import 'package:ecosider_app/widgets/registro_form.dart';
import 'package:flutter/material.dart';

class LimpiezaScreen extends StatelessWidget {
  const LimpiezaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Registrar Limpieza')),
      body: const RegistroForm(tipo: 'Limpieza'),
    );
  }
}

