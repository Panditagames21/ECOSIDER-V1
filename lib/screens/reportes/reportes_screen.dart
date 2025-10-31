import 'package:flutter/material.dart';

class ReporteScreen extends StatefulWidget {
  const ReporteScreen({super.key});

  @override
  State<ReporteScreen> createState() => _ReporteScreenState();
}

class _ReporteScreenState extends State<ReporteScreen> {
  String tipoReporte = 'Movimientos por Período';
  DateTime desde = DateTime.now().subtract(const Duration(days: 30));
  DateTime hasta = DateTime.now();

  void _generarReporte() {
    // Llamar al backend y mostrar gráfico
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Reportes de Residuos')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            DropdownButtonFormField<String>(
              value: tipoReporte,
              items: ['Movimientos por Período', 'Stock Actual', 'Alertas']
                  .map((tipo) => DropdownMenuItem(value: tipo, child: Text(tipo)))
                  .toList(),
              onChanged: (val) => setState(() => tipoReporte = val!),
              decoration: const InputDecoration(labelText: 'Seleccionar Tipo de Reporte'),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    decoration: const InputDecoration(labelText: 'Desde'),
                    readOnly: true,
                    onTap: () async {
                      final picked = await showDatePicker(
                        context: context,
                        initialDate: desde,
                        firstDate: DateTime(2020),
                        lastDate: DateTime.now(),
                      );
                      if (picked != null) setState(() => desde = picked);
                    },
                    controller: TextEditingController(text: '${desde.day}/${desde.month}/${desde.year}'),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: TextFormField(
                    decoration: const InputDecoration(labelText: 'Hasta'),
                    readOnly: true,
                    onTap: () async {
                      final picked = await showDatePicker(
                        context: context,
                        initialDate: hasta,
                        firstDate: DateTime(2020),
                        lastDate: DateTime.now(),
                      );
                      if (picked != null) setState(() => hasta = picked);
                    },
                    controller: TextEditingController(text: '${hasta.day}/${hasta.month}/${hasta.year}'),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _generarReporte,
              child: const Text('Generar Reporte'),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: Center(
                child: Text('Aquí se mostrará el gráfico 📊'),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(onPressed: () {}, child: const Text('Exportar a PDF')),
                ElevatedButton(onPressed: () {}, child: const Text('Exportar a CSV')),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
