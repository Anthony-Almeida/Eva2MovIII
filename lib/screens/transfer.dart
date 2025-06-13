import 'package:flutter/material.dart';

class TransferScreen extends StatefulWidget {
  const TransferScreen({super.key});

  @override
  State<TransferScreen> createState() => _TransferScreenState();
}

class _TransferScreenState extends State<TransferScreen> {
  final idController = TextEditingController();
  final nameController = TextEditingController();
  final amountController = TextEditingController();

  void _saveTransfer() {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(content: Text("Transferencia guardada correctamente")),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          TextField(controller: idController, decoration: const InputDecoration(labelText: 'ID Transferencia')),
          TextField(controller: nameController, decoration: const InputDecoration(labelText: 'Nombre Destinatario')),
          TextField(controller: amountController, keyboardType: TextInputType.number, decoration: const InputDecoration(labelText: 'Monto')),
          const SizedBox(height: 20),
          ElevatedButton(onPressed: _saveTransfer, child: const Text("Guardar Transferencia"))
        ],
      ),
    );
  }
}
