import 'package:flutter/material.dart';
import 'package:saudeja/index.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView( // Adicionado para permitir rolagem
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 50), // Espaçamento no topo
                Image.asset(
                  'assets/image/icons.png',
                  height: 150, // Tamanho ajustado para evitar overflow
                ),
                const SizedBox(height: 24),

                // Campo CPF
                TextField(
                  decoration: InputDecoration(
                    labelText: "CPF",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    filled: true,
                    fillColor: Colors.grey[200],
                  ),
                ),
                const SizedBox(height: 16),

                // Campo Senha
                TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: "Senha",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    filled: true,
                    fillColor: Colors.grey[200],
                  ),
                ),
                const SizedBox(height: 24),

                // Botão Logar
                ElevatedButton(
                  onPressed: () { const index();

                    // Lógica de login
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 48), // Botão largo
                    backgroundColor: Colors.redAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  child: const Text("Logar"),
                ),
                const SizedBox(height: 16),

                // Botão Suporte
                ElevatedButton(
                  onPressed: () {
                    // Lógica de suporte
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 48), // Botão largo
                    backgroundColor: Colors.redAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  child: const Text("Suporte"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
