import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  final String nombreUsuario;

  const DashboardScreen({super.key, required this.nombreUsuario});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 217, 223, 210), // Verde muy claro
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 60, 154, 65),
        title: Row(
          children: [
            Image.asset('assets/ecosider.png', height: 32),
            const SizedBox(width: 12),
            Text('Bienvenido, $nombreUsuario'),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Resumen del Día', style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 12),

            // Tarjetas de resumen
            Row(
              children: [
                Expanded(
                  child: Card(
                    color: const Color.fromARGB(255, 202, 230, 203),
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        children: const [
                          Icon(Icons.download, size: 32, color: Colors.green),
                          SizedBox(height: 8),
                          Text('Entradas Hoy', style: TextStyle(fontWeight: FontWeight.bold)),
                          Text('Neumáticos: 500 kg'),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Card(
                    color: const Color.fromARGB(255, 255, 195, 201),
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        children: const [
                          Icon(Icons.upload, size: 32, color: Colors.red),
                          SizedBox(height: 8),
                          Text('Salidas Hoy', style: TextStyle(fontWeight: FontWeight.bold)),
                          Text('Cilindro Aceite: 200 un'),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 16),
            Card(
              color: const Color.fromARGB(255, 255, 247, 180),
              child: ListTile(
                leading: const Icon(Icons.warning, color: Colors.orange),
                title: const Text('Alertas'),
                subtitle: const Text('Aceite alto en stock\nPróxima disposición: 25/09/2025'),
              ),
            ),

            const SizedBox(height: 24),
            Text('Acciones Rápidas', style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 12),

            Wrap(
              spacing: 12,
              runSpacing: 12,
              children: [
                _actionButton(Icons.download, 'Registrar Entrada', Colors.green),
                _actionButton(Icons.upload, 'Registrar Salida', Colors.red),
                _actionButton(Icons.person, 'Registrar Visita', Colors.blue),
                _actionButton(Icons.cleaning_services, 'Registrar Limpieza', const Color.fromARGB(255, 230, 172, 224)),
              ],
            ),

            const SizedBox(height: 24),
            Center(
              child: ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.send),
                label: const Text('Enviar Reporte'),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.green[700]),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.green[700],
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Inicio'),
          BottomNavigationBarItem(icon: Icon(Icons.input), label: 'Entrada'),
          BottomNavigationBarItem(icon: Icon(Icons.output), label: 'Salida'),
          BottomNavigationBarItem(icon: Icon(Icons.inventory), label: 'Inventario'),
          BottomNavigationBarItem(icon: Icon(Icons.bar_chart), label: 'Reportes'),
        ],
      ),
    );
  }

  Widget _actionButton(IconData icon, String label, Color color) {
    return ElevatedButton.icon(
      onPressed: () {},
      icon: Icon(icon, size: 20),
      label: Text(label),
      style: ElevatedButton.styleFrom(
        backgroundColor: color.withOpacity(0.9),
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      ),
    );
  }
}

