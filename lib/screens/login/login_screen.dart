import 'package:flutter/material.dart';
import 'package:ecosider_app/screens/sga/sga_dashboard.dart';
import 'package:ecosider_app/screens/metalico/metalico_dashboard.dart';
import 'package:ecosider_app/screens/sepa/sepa_dashboard.dart';
import 'package:ecosider_app/screens/invitado/invitado_dashboard.dart';
import 'package:ecosider_app/services/auth_service.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _userController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  bool recordar = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE8F5E9),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/ecosider.png', height: 150),
              const SizedBox(height: 44),

              TextField(
                controller: _userController,
                decoration: const InputDecoration(labelText: 'Usuario'),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _passController,
                decoration: const InputDecoration(labelText: 'Contraseña'),
                obscureText: true,
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Checkbox(
                    value: recordar,
                    onChanged: (val) => setState(() => recordar = val ?? false),
                  ),
                  const Text('Recordar'),
                ],
              ),
              const SizedBox(height: 16),

              ElevatedButton(
                onPressed: () async {
                  final response = await AuthService.login(
                    _userController.text,
                    _passController.text,
                  );

                  if (response['token'] != null) {
                    final rol = response['rol'];

                    if (rol == 'SGA') {
                      final usuario = response['usuario'] ?? _userController.text;
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (_) => SgaDashboard(usuario: usuario, rol: rol)),
                      );
                    } else if (rol == 'Negocios Metálicos') {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (_) => const MetalicoDashboard()),
                      );
                    } else if (rol == 'SEPA') {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (_) => const SepaDashboard()),
                      );
                    } else if (rol == 'Invitado') {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (_) => const InvitadoDashboard()),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Rol no reconocido')),
                      );
                    }
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Credenciales inválidas')),
                    );
                  }
                },
                child: const Text('Iniciar Sesión'),
              ),TextButton(
                onPressed: () {},
                child: const Text('¿Olvidaste tu contraseña?'),
              ),
              TextButton(
                onPressed: () {},
                child: const Text('¿Necesitas Ayuda?'),
              ),
              const SizedBox(height: 24),
              Image.asset('assets/logo.png', height: 80),
              const SizedBox(height: 12),
              
            ],
          ),
        ),
      ),
    );
  }
}



