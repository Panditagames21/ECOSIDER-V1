import 'package:flutter/material.dart';

class HistorialScreen extends StatelessWidget {
  final String material;
  final List<Map<String, dynamic>> movimientos;

  const HistorialScreen({
    super.key,
    required this.material,
    required this.movimientos,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Historial: $material')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Text('Movimientos recientes', style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: movimientos.length,
                itemBuilder: (context, index) {
                  final mov = movimientos[index];
                  return Card(
                    child: ListTile(
                      leading: Icon(mov['tipo'] == 'ENTRADA' ? Icons.arrow_downward : Icons.arrow_upward),
                      title: Text('${mov['tipo']} - ${mov['cantidad']} kg'),
                      subtitle: Text('${mov['fecha']} - ${mov['origen'] ?? mov['destino']}'),
                    ),
                  );
                },
              ),
            ),
            TextButton(
              onPressed: () {
                // Navegar a pantalla completa de historial si lo deseas
              },
              child: const Text('Ver todos los movimientos'),
            ),
          ],
        ),
      ),
    );
  }
}

