import 'package:flutter/material.dart';
import 'grupoFamiliar.dart';
import 'perfil.dart';

class VaccineRecordsScreen extends StatefulWidget {
  const VaccineRecordsScreen({super.key});

  @override
  _VaccineRecordsScreenState createState() => _VaccineRecordsScreenState();
}

class _VaccineRecordsScreenState extends State<VaccineRecordsScreen> {
  int _selectedIndex = 0; // Índice da aba selecionada

  // Função para alterar a aba ativa
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    if (index == 0) { // Índice do botão "Perfil"
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const PerfilScreen()),
      );
    }
    if (index == 1){
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const FamilyGroupPage())
      );
    }
  }

  final List<Map<String, String>> vaccines = [
    {'name': 'Hepatite B', 'date': '10/01/2023'},
    {'name': 'Tríplice Viral', 'date': '15/03/2023'},
    {'name': 'Febre Amarela', 'date': '20/06/2023'},
    {'name': 'COVID-19 (1ª Dose)', 'date': '05/07/2023'},
    {'name': 'COVID-19 (2ª Dose)', 'date': '10/08/2023'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Saúde Já"),
        backgroundColor: Colors.blue,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: vaccines.length,
          itemBuilder: (context, index) {
            return Card(
              elevation: 3,
              margin: const EdgeInsets.symmetric(vertical: 8.0),
              child: ListTile(
                leading: const Icon(Icons.vaccines, color: Colors.blue),
                title: Text(vaccines[index]['name']!,
                    style: const TextStyle(fontWeight: FontWeight.bold)),
                subtitle: Text('Data: ${vaccines[index]['date']}'),
              ),
            );
          },
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Perfil",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_2),
            label: "Grupo Familiar",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.support_outlined),
            label: "Suporte",
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped,
      ),
    );
  }
}
