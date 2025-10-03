import 'package:flutter/material.dart';
import '../../widgets/botones_por_rol.dart';

class MetalicoDashboard extends StatelessWidget {
  const MetalicoDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Panel Negocios Metálicos')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text('Bienvenido Negocios Metálicos', style: TextStyle(fontSize: 20)),
            SizedBox(height: 12),
            BotonesPorRol(rol: 'Negocios Metálicos'),
          ],
        ),
      ),
    );
  }
}

