import 'package:flutter/material.dart';
import 'registroVacina.dart';
import 'Calendario.dart';
import 'Geocalizacao.dart';
import 'receitaMedicamento.dart';
import 'consulta.dart';
import 'perfil.dart';
import 'telaAvalicao.dart';
import 'grupoFamiliar.dart';

class Index extends StatelessWidget {
  const Index({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const TelaInicial(),
    );
  }
}

class TelaInicial extends StatefulWidget {
  const TelaInicial({super.key});

  @override
  _TelaInicialState createState() => _TelaInicialState();
}

class _TelaInicialState extends State<TelaInicial> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Saúde Já"),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 15),

            // Primeiro Container corrigido
            Container(
              width: double.infinity,
              color: Colors.blue,
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const CalendarScreen()),
                      );
                    },
                    child: const Text('Calendário'),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 15),

            // Repetição do primeiro Container
            Container(
              width: double.infinity,
              color: Colors.blue,
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const ConsultaScreen()),
                      );
                    },
                    child: const Text('Lembrança consulta'),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 15),

            Container(
              width: double.infinity,
              color: Colors.blue,
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const VaccineRecordsScreen()),
                      );
                    },
                    child: const Text('Registro de vacinação'),
                  ),

                ],
              ),
            ),
            const SizedBox(height: 15),

            Container(
              width: double.infinity,
              color: Colors.blue,
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const PrescriptionScreen()),
                      );
                    },
                    child: const Text('Medicamentos'),
                  ),

                ],
              ),
            ),
            const SizedBox(height: 15),

            Container(
              width: double.infinity,
              color: Colors.blue,
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const MapScreen()),
                      );
                    },
                    child: const Text('Geolocalização'),
                  ),

                ],
              ),
            ),
            const SizedBox(height: 15),

            Container(
              width: double.infinity,
              color: Colors.blue,
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => BodyPainScreen()),
                      );
                    },
                    child: const Text('Tela de Avaliação'),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 15),
          ],
        ),
      ),

      // Adicionando o menu inferior
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
