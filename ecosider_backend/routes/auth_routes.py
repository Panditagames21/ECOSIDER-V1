from flask import Blueprint, request, jsonify

auth_bp = Blueprint('auth', __name__, url_prefix='/auth')

@auth_bp.route('/login', methods=['POST'])
def login():
    data = request.json
    usuario = data.get('usuario')
    contrasena = data.get('contrasena')

    # Diccionario de usuarios simulados
    usuarios = {
        'sga': {'usuario': 'Antonio', 'rol': 'SGA'},
        'metalico': {'usuario': 'Negocios', 'rol': 'Negocios Metálicos'},
        'sepa': {'usuario': 'SEPA', 'rol': 'SEPA'},
        'invitado': {'usuario': 'Visitante', 'rol': 'Invitado'}
    }

    if usuario in usuarios and contrasena == '1234':
        return jsonify({
            'token': 'jwt_simulado',
            'usuario': usuarios[usuario]['usuario'],
            'rol': usuarios[usuario]['rol']
        })
    else:
        return jsonify({'error': 'Credenciales inválidas'}), 401



