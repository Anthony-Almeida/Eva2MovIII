import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class DepositScreen extends StatefulWidget {
  const DepositScreen({super.key});

  @override
  State<DepositScreen> createState() => _DepositScreenState();
}

class _DepositScreenState extends State<DepositScreen> {
  List<dynamic> data = [];

  Future<void> fetchData() async {
    final response = await http.get(Uri.parse('https://jritsqmet.github.io/web-api/'));
    if (response.statusCode == 200) {
      setState(() => data = json.decode(response.body));
    }
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void _showDetails(item) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text(item['banco']),
        content: Text("Monto: ${item['monto']}\nID: ${item['id']}\nDescripción: ${item['descripcion'] ?? 'N/A'}"),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: data.length,
      itemBuilder: (_, index) {
        final item = data[index];
        return ListTile(
          leading: Image.network(item['imagen'], width: 50),
          title: Text("${item['banco']}"),
          subtitle: Text("Monto: ${item['monto']}"),
          onTap: () => _showDetails(item),
        );
      },
    );
  }
}
