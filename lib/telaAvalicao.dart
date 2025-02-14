import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BodyPainScreen(),
    );
  }
}

class BodyPainScreen extends StatelessWidget {
  void _showPainDialog(BuildContext context, String bodyPart) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Área Selecionada"),
        content: Text("Você selecionou: $bodyPart"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text("OK"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,

        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: Center(child: Text("Selecione a área da dor")),
      ),
      body: Center(
        child: Container(
          width: 500,
          height: 600,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Image.asset('assets/image/corpo.jpg', width: 500, fit: BoxFit.contain), // Ajustando a imagem
              Positioned(
                top: 50,
                child: _buildPainButton(context, "Cabeça"),
              ),
              Positioned(
                top: 100,
                child: _buildPainButton(context, "Pescoço"),
              ),
              Positioned(
                top: 170,
                child: _buildPainButton(context, "Peito"),
              ),
              Positioned(
                top: 150,
                left: 130,
                child: _buildPainButton(context, "Ombro Esquerdo"),
              ),
              Positioned(
                top: 150,
                right: 130,
                child: _buildPainButton(context, "Ombro Direito"),
              ),
              Positioned(
                top: 250,
                child: _buildPainButton(context, "Abdômen"),
              ),
              Positioned(
                top: 250,
                left: 120,
                child: _buildPainButton(context, "Braço Esquerdo"),
              ),
              Positioned(
                top: 250,
                right: 120,
                child: _buildPainButton(context, "Braço Direito"),
              ),
              Positioned(
                top: 400,
                left: 105,
                child: _buildPainButton(context, "Mão Esquerda"),
              ),
              Positioned(
                top: 400,
                right: 105,
                child: _buildPainButton(context, "Mão Direita"),
              ),
              Positioned(
                top: 400,
                child: _buildPainButton(context, "Pelvis"),
              ),
              Positioned(
                top: 450,
                left: 190,
                child: _buildPainButton(context, "Perna Esquerda"),
              ),
              Positioned(
                top: 450,
                right: 190,
                child: _buildPainButton(context, "Perna Direita"),
              ),
              Positioned(
                top: 500,
                left: 180,
                child: _buildPainButton(context, "Joelho Esquerdo"),
              ),
              Positioned(
                top: 500,
                right: 180,
                child: _buildPainButton(context, "Joelho Direito"),
              ),
              Positioned(
                top: 550,
                left: 170,
                child: _buildPainButton(context, "Pé Esquerdo"),
              ),
              Positioned(
                top: 550,
                right: 170,
                child: _buildPainButton(context, "Pé Direito"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPainButton(BuildContext context, String bodyPart) {
    return GestureDetector(
      onTap: () => _showPainDialog(context, bodyPart),
      child: Container(
        width: 35,
        height: 35,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.red.withOpacity(0.6),
        ),
      ),
    );
  }
}
