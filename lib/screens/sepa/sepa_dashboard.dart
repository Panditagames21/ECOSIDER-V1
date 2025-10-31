import 'package:flutter/material.dart';
import '../../widgets/botones_por_rol.dart';

class SepaDashboard extends StatelessWidget {
  const SepaDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Panel SEPA')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text('Bienvenido SEPA', style: TextStyle(fontSize: 20)),
            SizedBox(height: 12),
            BotonesPorRol(rol: 'SEPA'),
          ],
        ),
      ),
    );
  }
}

