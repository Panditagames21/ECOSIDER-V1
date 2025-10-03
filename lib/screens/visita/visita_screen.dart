import 'package:ecosider_app/widgets/registro_form.dart';
import 'package:flutter/material.dart';

class VisitaScreen extends StatelessWidget {
  const VisitaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Registrar Visita')),
      body: const RegistroForm(tipo: 'Visita'),
    );
  }
}
