import 'package:flutter/material.dart';
import '../../widgets/botones_por_rol.dart';

class InvitadoDashboard extends StatelessWidget {
  const InvitadoDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Panel Invitado')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text('Bienvenido Invitado', style: TextStyle(fontSize: 20)),
            SizedBox(height: 12),
            BotonesPorRol(rol: 'Invitado'),
          ],
        ),
      ),
    );
  }
}

