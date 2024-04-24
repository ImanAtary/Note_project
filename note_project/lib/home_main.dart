import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HomeScreenPage extends StatefulWidget {
  const HomeScreenPage({super.key});

  @override
  State<HomeScreenPage> createState() => _HomeScreenPageState();
}

class _HomeScreenPageState extends State<HomeScreenPage> {
  String inputedText = '';
  var controller = TextEditingController();

  var box = Hive.box('names');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: controller,
            ),
            Text(inputedText),
            ElevatedButton(
              onPressed: () {
                setState(
                  () {
                    inputedText = controller.text;
                  },
                );
              },
              child: Text('Tap pn me'),
            ),
            ElevatedButton(
              onPressed: () {
                setState(
                  () {
                    box.put(1, 'imanattary');
                  },
                );
              },
              child: Text('create'),
            ),
            ElevatedButton(
              onPressed: () {
                setState(
                  () {
                    box.get(1);
                  },
                );
              },
              child: Text('read'),
            )
          ],
        ),
      ),
    );
  }
}
