import 'package:flutter/material.dart';
import 'perfil.dart';

class FamilyGroupScreen extends StatelessWidget {
  const FamilyGroupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const FamilyGroupPage(),
    );
  }
}

class FamilyGroupPage extends StatefulWidget {
  const FamilyGroupPage({super.key});

  @override
  _FamilyGroupPageState createState() => _FamilyGroupPageState();
}

class _FamilyGroupPageState extends State<FamilyGroupPage> {
  int _selectedIndex = 1; // Define a aba ativa como "Grupo Familiar"

  List<Map<String, String>> members = [
    {'name': 'Maria', 'dob': '10/10/1990'},
    {'name': 'João', 'dob': '20/05/1985'},
  ];

  final TextEditingController nameController = TextEditingController();
  final TextEditingController dobController = TextEditingController();

  void addMember() {
    if (nameController.text.isNotEmpty && dobController.text.isNotEmpty) {
      setState(() {
        members.add({
          'name': nameController.text,
          'dob': dobController.text,
        });
      });
      nameController.clear();
      dobController.clear();
    }
  }






  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Grupo Familiar"),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 15),

            // Lista de membros
            Expanded(
              child: ListView.builder(
                itemCount: members.length,
                itemBuilder: (context, index) {
                  return Container(
                    width: double.infinity,
                    color: Colors.blue[100],
                    margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          members[index]['name']!,
                          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        Text('Nascimento: ${members[index]['dob']}'),
                      ],
                    ),
                  );
                },
              ),
            ),

            // Adicionar novo membro
            Container(
              width: double.infinity,
              color: Colors.blue,
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  TextField(
                    controller: nameController,
                    decoration: const InputDecoration(
                      labelText: 'Nome',
                      filled: true,
                      fillColor: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    controller: dobController,
                    decoration: const InputDecoration(
                      labelText: 'Data de Nascimento',
                      filled: true,
                      fillColor: Colors.white,
                    ),
                    keyboardType: TextInputType.datetime,
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: addMember,
                    child: const Text('Adicionar Membro'),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 15),
          ],
        ),
      ),

      // Menu inferior

    );
  }
}
