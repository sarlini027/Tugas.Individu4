from wsgiref.simple_server import make_server
from pyramid.config import Configurator
from pyramid.view import view_config
from pyramid.authorization import ACLAuthorizationPolicy
import pymysql
import jwt
import json
import datetime

# Koneksi ke database MySQL
connection = pymysql.connect(
    host='localhost',
    user='root',
    password='',
    db='pyramid-tugasmovie',
    charset='utf8mb4',
    cursorclass=pymysql.cursors.DictCursor
)

# Fungsi verifikasi token JWT
def verify_jwt_token(request):
    jwt_secret = request.registry.settings['jwt.secret']
    token = request.headers.get('Authorization')

    if token:
        try:
            decoded_token = jwt.decode(token, jwt_secret, algorithms=['HS256'])
            request.user = decoded_token
            return decoded_token
        except jwt.ExpiredSignatureError:
            return None, 'Token has expired'
        except jwt.InvalidTokenError:
            return None, 'Invalid token'
    return None, 'Token not provided'

# Fungsi autentikasi
def authenticate(username, password):
    with connection.cursor() as cursor:
        sql = "SELECT * FROM users WHERE username=%s AND password=%s"
        cursor.execute(sql, (username, password))
        user = cursor.fetchone()

        if user:
            return user['id']  # Mengembalikan user ID jika autentikasi berhasil
        else:
            return None  # Mengembalikan None jika autentikasi gagal

# Fungsi untuk menghasilkan refresh token
def generate_refresh_token(user_id):
    refresh_token_payload = {
        'sub': user_id,
        'exp': datetime.datetime.utcnow() + datetime.timedelta(minutes=1)  # Refresh token expires in 1 minute (for testing purposes)
    }
    refresh_token = jwt.encode(refresh_token_payload, 'refresh_secret', algorithm='HS256')
    return refresh_token

# Route untuk halaman login
@view_config(route_name='page_login', renderer='views/login.jinja2')
def page_login(request):
    return {}

# Route untuk autentikasi dan menghasilkan JWT token dan refresh token
@view_config(route_name='login', renderer="json")
def login(request):
    try:
        json_data = request.json_body
        username = json_data.get('username')
        password = json_data.get('password')

        user_id = authenticate(username, password)

        if user_id:
            # Generate JWT token
            token_data = {
                'sub': user_id,
                'exp': datetime.datetime.utcnow() + datetime.timedelta(minutes=30)  # Token expires in 30 minutes
            }
            jwt_token = jwt.encode(token_data, 'secret', algorithm='HS256')
            
            # Generate refresh token
            refresh_token = generate_refresh_token(user_id)

            # Save tokens in the database (pseudo-code for illustration purposes)
            with connection.cursor() as cursor:
                hashed_refresh_token = refresh_token  # Hash the refresh token before saving it in the database
                sql = "INSERT INTO tokens (user_id, jwt_token, refresh_token) VALUES (%s, %s, %s)"
                cursor.execute(sql, (user_id, jwt_token, hashed_refresh_token))
                connection.commit()

            return {
                'result': 'ok',
                'token': jwt_token,
                'refresh_token': refresh_token  # Send the refresh token to the client
            }
        else:
            request.response.status = 401  # Unauthorized
            return {
                'result': 'error',
                'message': 'Invalid credentials'
            }

    except json.JSONDecodeError:
        request.response.status = 400  # Bad Request
        return {
            'result': 'error',
            'message': 'Invalid JSON data'
        }

# Route untuk halaman beranda yang membutuhkan token
@view_config(route_name='beranda', renderer="json")
def home(request):
    authorization_header = request.headers.get('Authorization')
    if authorization_header and authorization_header.startswith('Bearer '):
        token = authorization_header.split('Bearer ')[1]
        try:
            decoded_user = jwt.decode(token, request.registry.settings['jwt.secret'], algorithms=['HS256'])
            user_id = decoded_user.get('sub')
            
            # Retrieve the refresh token from the database based on the user's ID
            with connection.cursor() as cursor:
                sql = "SELECT refresh_token FROM tokens WHERE user_id=%s"
                cursor.execute(sql, (user_id,))
                result = cursor.fetchone()

            if result:
                refresh_token = result['refresh_token']
                # Verify the refresh token (you should use a different secret for refresh tokens)
                decoded_refresh_token = jwt.decode(refresh_token, 'refresh_secret', algorithms=['HS256'])
                if decoded_refresh_token:
                    # If refresh token is valid, return the response
                    return {'greet': 'Beranda', 'name': decoded_user.get('sub')}
                else:
                    request.response.status = 401  # Unauthorized
                    return {'greet': 'Unauthorized', 'name': '', 'error': 'Invalid refresh token'}
            else:
                request.response.status = 401  # Unauthorized
                return {'greet': 'Unauthorized', 'name': '', 'error': 'Refresh token not found'}
        except jwt.ExpiredSignatureError:
            request.response.status = 401  # Unauthorized
            return {'greet': 'Unauthorized', 'name': '', 'error': 'Token has expired'}
        except jwt.InvalidTokenError:
            request.response.status = 401  # Unauthorized
            return {'greet': 'Unauthorized', 'name': '', 'error': 'Invalid token'}
        except Exception as e:
            print(f"Error: {str(e)}")
            request.response.status = 500  # Internal Server Error
            return {'greet': 'Unauthorized', 'name': '', 'error': 'Internal Server Error'}
    else:
        request.response.status = 401  # Unauthorized
        return {'greet': 'Unauthorized', 'name': '', 'error': 'Token not provided'}

# Route untuk halaman movie
@view_config(route_name='movie', renderer='views/movie.jinja2')
def movie(request):
     with connection.cursor() as cursor:
        sql = "SELECT * FROM movie"
        cursor.execute(sql)
        data = cursor.fetchall()
        return {'data': data}

# Route untuk halaman edit movie
@view_config(route_name='edit_movie', renderer='views/edit_movie.jinja2')
def edit_movie(request):
    id_movie = request.matchdict.get('id_movie')  # Ambil id_movie dari parameter URL

    with connection.cursor() as cursor:
        # Ambil data film berdasarkan id_movie
        sql = "SELECT * FROM movie WHERE id_movie = %s"
        cursor.execute(sql, (id_movie,))
        movie_data = cursor.fetchone()

    if not movie_data:
        # Menangani jika id_movie tidak ditemukan
        return HTTPNotFound("Film tidak ditemukan")

    # Proses data film untuk ditampilkan dalam form edit
    # Misalnya, mengisi nilai awal form dengan data film yang ada

    return {'movie_data': movie_data}

# Konfigurasi Pyramid
if __name__ == "__main__":
    with Configurator() as config:
        config = Configurator(settings={'jwt.secret': 'secret_key_here'})
        config.include('pyramid_jinja2')
        config.add_static_view(name='static', path='static')
        config.add_route('beranda', '/home')
        config.add_route('page_login', '/')
        config.add_route('login', '/api/login')
        config.add_route('movie', '/movie')
        config.add_route('edit_movie', '/edit_movie/{id_movie}')
        config.add_route('delete_movie', '/delete_movie/{id_movie}')
        config.scan()
        config.set_authorization_policy(ACLAuthorizationPolicy())
        config.include('pyramid_jwt')
        config.set_jwt_authentication_policy(config.get_settings()['jwt.secret'])
        app = config.make_wsgi_app()

    # Menjalankan aplikasi pada server lokal
    server = make_server('0.0.0.0', 6543, app)
    server.serve_forever()
