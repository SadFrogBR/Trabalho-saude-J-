import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class consulta extends StatelessWidget {
  const consulta({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const TelaConsulta(),
    );
  }
}


class TelaConsulta extends StatelessWidget {
  const TelaConsulta({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
