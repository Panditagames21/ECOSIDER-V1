import 'package:ecosider_app/services/registro_service.dart';
import 'package:ecosider_app/services/blob_service.dart'; // Asegúrate de tener este servicio
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class RegistroForm extends StatefulWidget {
  final String tipo; // 'Ingreso', 'Salida', 'Visita', 'Limpieza'
  final List<String>? materiales;
  final bool mostrarMateriales;
  final bool mostrarDestino;
  final bool mostrarOrigen;

  const RegistroForm({
    super.key,
    required this.tipo,
    this.materiales,
    this.mostrarMateriales = false,
    this.mostrarDestino = false,
    this.mostrarOrigen = false,
  });

  @override
  State<RegistroForm> createState() => _RegistroFormState();
}

class _RegistroFormState extends State<RegistroForm> {
  String? materialSeleccionado;
  String? origen;
  String? destino;
  double cantidad = 0.0;
  String comentario = '';
  XFile? _foto;
  String? _fotoUrl;

  Future<void> _tomarFoto() async {
    final picker = ImagePicker();
    final picked = await picker.pickImage(source: ImageSource.camera);
    if (picked != null) {
      final url = await BlobService.subirFoto(picked);
      setState(() {
        _foto = picked;
        _fotoUrl = url;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          if (widget.mostrarMateriales)
            DropdownButtonFormField<String>(
              value: materialSeleccionado,
              items: widget.materiales
                  ?.map((mat) => DropdownMenuItem(value: mat, child: Text(mat)))
                  .toList(),
              onChanged: (val) => setState(() => materialSeleccionado = val),
              decoration: const InputDecoration(labelText: 'Tipo de Residuo'),
            ),
          if (widget.mostrarOrigen)
            TextFormField(
              decoration: const InputDecoration(labelText: 'Origen'),
              onChanged: (val) => origen = val,
            ),
          if (widget.mostrarDestino)
            TextFormField(
              decoration: const InputDecoration(labelText: 'Destino/Receptor'),
              onChanged: (val) => destino = val,
            ),
          TextFormField(
            decoration: const InputDecoration(labelText: 'Cantidad (kg)'),
            keyboardType: TextInputType.number,
            onChanged: (val) => cantidad = double.tryParse(val) ?? 0.0,
          ),
          TextFormField(
            decoration: const InputDecoration(labelText: 'Comentario'),
            maxLines: 3,
            onChanged: (val) => comentario = val,
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: _tomarFoto,
            child: const Text('Subir Foto'),
          ),
          if (_foto != null)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Image.file(File(_foto!.path), height: 150),
            ),
          ElevatedButton(
            onPressed: () async {
              final datos = {
                'usuario': 'antonio', // puedes obtenerlo desde el login
                'material': materialSeleccionado,
                'origen': origen,
                'destino': destino,
                'cantidad': cantidad,
                'comentario': comentario,
                'fecha_hora': DateTime.now().toIso8601String(),
                'foto_url': _fotoUrl,
              };

              final ok = await RegistroService.registrarIngreso(datos);
              if (ok) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Registro guardado exitosamente')),
                );
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Error al guardar')),
                );
              }
            },
            child: Text('Guardar ${widget.tipo}'),
          ),
        ],
      ),
    );
  }
}


