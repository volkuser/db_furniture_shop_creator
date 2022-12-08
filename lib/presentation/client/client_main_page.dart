import 'package:flutter/material.dart';

class ClientMainPage extends StatefulWidget {
  const ClientMainPage({Key? key}) : super(key: key);

  @override
  State<ClientMainPage> createState() => _ClientMainPageState();
}

// layout

class _ClientMainPageState extends State<ClientMainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 224, 221, 243),
        body: SafeArea(
            child: Center(
                child: Column(
      children: [
        const Text(
          "Вы зашли под ролью клиента",
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