from flask import Blueprint, request, jsonify

reporte_bp = Blueprint('reporte', __name__, url_prefix='/reporte')

@reporte_bp.route('/movimientos', methods=['GET'])
def generar_reporte():
    # Simulación de datos
    reporte = [
        {'fecha': '2025-09-18', 'material': 'Aceite', 'tipo': 'SALIDA', 'cantidad': 200},
        {'fecha': '2025-09-19', 'material': 'PET', 'tipo': 'INGRESO', 'cantidad': 500},
    ]
    return jsonify(reporte)

