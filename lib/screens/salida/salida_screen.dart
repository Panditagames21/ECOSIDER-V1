import 'package:ecosider_app/widgets/registro_form.dart';
import 'package:flutter/material.dart';

class SalidaScreen extends StatelessWidget {
  const SalidaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Registrar Salida')),
      body: RegistroForm(
        tipo: 'Salida',
        mostrarMateriales: true,
        mostrarDestino: true,
        materiales: ['Neumáticos', 'Aceite', 'Cobre', 'Plástico'],
      ),
    );
  }
}

