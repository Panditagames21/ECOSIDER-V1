from flask import Flask
from flask_cors import CORS

app = Flask(__name__)
CORS(app)

# Importar rutas
from routes.auth_routes import auth_bp
from routes.registro_routes import registro_bp
from routes.inventario_routes import inventario_bp
from routes.reporte_routes import reporte_bp

# Registrar blueprints
app.register_blueprint(auth_bp)
app.register_blueprint(registro_bp)
app.register_blueprint(inventario_bp)
app.register_blueprint(reporte_bp)

if __name__ == '__main__':
    app.run(debug=True)
app.config['SQLALCHEMY_DATABASE_URI'] = (
    'mssql+pyodbc://admin:Joselu0406#-@ecosider-sql.cqzmok4agqfe.us-east-1.rds.amazonaws.com:1433/EcoSiderDB?driver=ODBC+Driver+17+for+SQL+Server'
)



