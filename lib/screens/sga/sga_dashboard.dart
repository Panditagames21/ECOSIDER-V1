import 'package:flutter/material.dart';
import '../../widgets/menu_lateral.dart';
import '../../widgets/botones_por_rol.dart';

class SgaDashboard extends StatelessWidget {
  final String usuario;
  final String rol;

  const SgaDashboard({super.key, required this.usuario, required this.rol});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Panel SGA')),
      drawer: MenuLateral(usuario: usuario, rol: rol),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Bienvenido $usuario', style: const TextStyle(fontSize: 20)),
            const SizedBox(height: 12),
            BotonesPorRol(rol: rol),
          ],
        ),
      ),
    );
  }
}



