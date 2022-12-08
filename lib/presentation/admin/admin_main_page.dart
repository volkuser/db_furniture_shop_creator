import 'package:flutter/material.dart';

class AdminMainPage extends StatefulWidget {
  const AdminMainPage({Key? key}) : super(key: key);

  @override
  State<AdminMainPage> createState() => _AdminMainPageState();
}

// layout

class _AdminMainPageState extends State<AdminMainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 224, 221, 243),
        body: SafeArea(
            child: Center(
                child: Column(
      children: [
        const Text(
          "Вы зашли под ролью администратора",
          style: TextStyle(color: Color.fromARGB(255, 56, 56, 83)),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 20),
        Align(
          alignment: Alignment.bottomLeft,
          child: ElevatedButton(
            onPressed: () => Navigator.pop(context),
            style: ElevatedButton.styleFrom(
              shape: const CircleBorder(),
              padding: const EdgeInsets.all(15),
              backgroundColor: const Color.fromARGB(255, 160, 150, 219)
            ),
            child: const Icon(Icons.arrow_back, color: Color.fromARGB(255, 224, 221, 243)),
          ),
        ),
      ],
    ))));
  }
}