from flask import Blueprint, jsonify

inventario_bp = Blueprint('inventario', __name__, url_prefix='/inventario')

@inventario_bp.route('/', methods=['GET'])
def obtener_inventario():
    inventario = [
        {'nombre': 'Plástico PET', 'cantidad': 1500, 'ubicacion': 'Zona A'},
        {'nombre': 'Aceite', 'cantidad': 2000, 'ubicacion': 'Zona C'},
    ]
    return jsonify(inventario)

