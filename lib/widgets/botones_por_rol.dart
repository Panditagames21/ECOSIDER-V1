import 'package:flutter/material.dart';
import '../config/roles_config.dart';

class BotonesPorRol extends StatelessWidget {
  final String rol;

  const BotonesPorRol({super.key, required this.rol});

  @override
  Widget build(BuildContext context) {
    final funciones = funcionesPorRol[rol] ?? [];

    return Wrap(
      spacing: 10,
      runSpacing: 10,
      children: funciones.map((funcion) {
        return ElevatedButton(
          onPressed: () {
            // Aquí puedes navegar o ejecutar lógica según función
            print('Acción: $funcion');
          },
          child: Text('Registrar ${funcion[0].toUpperCase()}${funcion.substring(1)}'),
        );
      }).toList(),
    );
  }
}

