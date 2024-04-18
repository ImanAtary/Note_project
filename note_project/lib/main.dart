import 'package:flutter/material.dart';

void main() {
  runApp(
    Application(),
  );
}

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Text('Iman Attary'),
        ),
      ),
    );
  }
}
