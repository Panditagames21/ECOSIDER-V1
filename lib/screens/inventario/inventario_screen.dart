import 'package:flutter/material.dart';

class InventarioScreen extends StatefulWidget {
  const InventarioScreen({super.key});

  @override
  State<InventarioScreen> createState() => _InventarioScreenState();
}

class _InventarioScreenState extends State<InventarioScreen> {
  List<Map<String, dynamic>> inventario = [];
  String filtroTipo = '';
  String filtroUbicacion = '';
  String busqueda = '';

  @override
  void initState() {
    super.initState();
    _cargarInventario();
  }

  Future<void> _cargarInventario() async {
    // Aquí llamas a tu backend para obtener el inventario
    // Simulación temporal:
    setState(() {
      inventario = [
        {'nombre': 'Plástico (PET)', 'cantidad': 1500, 'ubicacion': 'Zona A, Estante 3'},
        {'nombre': 'Metal (Aluminio)', 'cantidad': 800, 'ubicacion': 'Zona B, Plataforma 1'},
        {'nombre': 'Orgánico (Aceite)', 'cantidad': 2000, 'ubicacion': 'Zona C, Contenedor 5'},
      ];
    });
  }

  List<Map<String, dynamic>> get _filtrados {
    return inventario.where((item) {
      final nombre = item['nombre'].toString().toLowerCase();
      final ubicacion = item['ubicacion'].toString().toLowerCase();
      return nombre.contains(busqueda.toLowerCase()) &&
          (filtroTipo.isEmpty || nombre.contains(filtroTipo.toLowerCase())) &&
          (filtroUbicacion.isEmpty || ubicacion.contains(filtroUbicacion.toLowerCase()));
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Inventario de Residuos')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              decoration: const InputDecoration(labelText: 'Buscar Residuo...'),
              onChanged: (val) => setState(() => busqueda = val),
            ),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: const InputDecoration(labelText: 'Tipo'),
                    onChanged: (val) => setState(() => filtroTipo = val),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: TextField(
                    decoration: const InputDecoration(labelText: 'Ubicación'),
                    onChanged: (val) => setState(() => filtroUbicacion = val),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: _filtrados.length,
                itemBuilder: (context, index) {
                  final item = _filtrados[index];
                  return Card(
                    child: ListTile(
                      title: Text(item['nombre']),
                      subtitle: Text('Ubicación: ${item['ubicacion']}'),
                      trailing: Text('${item['cantidad']} kg'),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

