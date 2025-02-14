import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'perfil.dart';
import 'grupoFamiliar.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({super.key});

  @override
  _CalendarScreenState createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  // Exemplo de datas marcadas para vacinação
  final Map<DateTime, List<String>> _markedVaccines = {
    DateTime.utc(2025, 2, 15): ['Hepatite B'],
    DateTime.utc(2025, 3, 10): ['Tríplice Viral'],
    DateTime.utc(2025, 4, 5): ['Febre Amarela'],
    DateTime.utc(2025, 5, 20): ['COVID-19 (1ª Dose)'],
    DateTime.utc(2025, 6, 15): ['COVID-19 (2ª Dose)'],
  };
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
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TableCalendar(
              firstDay: DateTime.utc(2020, 1, 1),
              lastDay: DateTime.utc(2030, 12, 31),
              focusedDay: _focusedDay,
              calendarFormat: _calendarFormat,
              selectedDayPredicate: (day) {
                return isSameDay(_selectedDay, day);
              },
              onDaySelected: (selectedDay, focusedDay) {
                setState(() {
                  _selectedDay = selectedDay;
                  _focusedDay = focusedDay;
                });
              },
              onFormatChanged: (format) {
                setState(() {
                  _calendarFormat = format;
                });
              },
              onPageChanged: (focusedDay) {
                _focusedDay = focusedDay;
              },
              eventLoader: (day) {
                return _markedVaccines[day] ?? [];
              },
            ),
            const SizedBox(height: 20),
            _selectedDay != null && _markedVaccines.containsKey(_selectedDay!)
                ? Column(
              children: _markedVaccines[_selectedDay!]!
                  .map((vac) => Text("Vacina: $vac",
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)))
                  .toList(),
            )
                : const Text("Nenhuma vacina marcada para este dia."),
          ],
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
        currentIndex: 0,
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped,
      ),
    );
  }
}
