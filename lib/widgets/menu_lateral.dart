import 'package:flutter/material.dart';
import 'package:ecosider_app/services/auth_service.dart';
import 'package:ecosider_app/screens/login/login_screen.dart';

class MenuLateral extends StatelessWidget {
  final String usuario;
  final String rol;

  const MenuLateral({super.key, required this.usuario, required this.rol});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const DrawerHeader(
            child: Icon(Icons.account_circle, size: 80),
          ),
          Text('Usuario: $usuario', style: const TextStyle(fontSize: 16)),
          Text('Rol: $rol', style: const TextStyle(fontSize: 16)),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Cerrar sesión'),
            onTap: () async {
              await AuthService.logout();
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (_) => const LoginScreen()),
                (route) => false,
              );
            },
          ),
        ],
      ),
    );
  }
}
