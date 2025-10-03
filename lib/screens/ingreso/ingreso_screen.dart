import 'package:flutter/material.dart';
import '../../widgets/registro_form.dart';

class IngresoScreen extends StatelessWidget {
  const IngresoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Registrar Entrada')),
      body: RegistroForm(
        tipo: 'Ingreso',
        mostrarMateriales: true,
        mostrarOrigen: true,
        materiales: ['Neumáticos', 'Aceite', 'Cobre', 'Plástico'],
      ),
    );
  }
}

