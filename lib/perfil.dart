import 'package:flutter/material.dart';

class PerfilScreen extends StatelessWidget {
  const PerfilScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Saúde Já', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.blue,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Perfil do Usuário", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
              const SizedBox(height: 20),
              buildProfileItem("Nome", "Lucas Silva"),
              buildProfileItem("CPF", "123.456.789-00"),
              buildProfileItem("RG", "12.345.678-9"),
              buildProfileItem("Tipo Sanguíneo", "O+"),
              buildProfileItem("Convênio", "SUS"),
              buildProfileItem("Telefone", "(11) 98765-4321"),
              buildProfileItem("Telefone Confirmação", "(11) 91234-5678"),
              const SizedBox(height: 30),
              Center(
                child: Column(
                  children: [
                    const Text("QR Code do Perfil", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 10),
                    Container(
                      width: 150,
                      height: 150,
                      color: Colors.grey[300], // Placeholder para QR Code
                      child: const Center(child: Icon(Icons.qr_code, size: 100, color: Colors.black54)),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildProfileItem(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          Text(value, style: const TextStyle(fontSize: 16)),
        ],
      ),
    );
  }
}
