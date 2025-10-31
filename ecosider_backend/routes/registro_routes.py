from flask import Blueprint, request, jsonify
from services.registro_service import guardar_registro

registro_bp = Blueprint('registro', __name__, url_prefix='/registro')

@registro_bp.route('/ingreso', methods=['POST'])
def registrar_ingreso():
    data = request.json
    ok = guardar_registro(data, tipo='INGRESO')
    return jsonify({'success': ok})

