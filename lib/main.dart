import 'package:flutter/material.dart';

import '../../app_route.dart';
import '../../core/db/database_helper.dart';

class Screen1 extends StatelessWidget {
  const Screen1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Text('1'),
          ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=> const Screen2()));
              }, child: const Text('Переход на экран 2'))
        ],
      ),
    );
  }
}

class Screen2 extends StatelessWidget {
  const Screen2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Text('2'),
          ElevatedButton(
              onPressed: () {
                 Navigator.push(context, MaterialPageRoute(builder: (context)=> Screen3()));

              }, child: const Text('Переход на экран 3')),
              ElevatedButton(onPressed: () {
                  Navigator.pop(context);
              }, child: const Text ('Назад')),
        ],
      ),
    );
  }
}

class Screen3 extends StatelessWidget {
  const Screen3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Text('3'),
          ElevatedButton(
              onPressed: () {
                 Navigator.push(context, MaterialPageRoute(builder: (context)=> const Screen1()));
              }, child: const Text('Переход на экран 1')),
              ElevatedButton(onPressed: () {
                  Navigator.pop(context);
              }, child: const Text ('Назад')),
        ],
      ),
    );
  }
}

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await DatabaseHelper.instance.init();
  runApp(App());
}

class App extends StatelessWidget {
  App({super.key});
  final AppRouter router = AppRouter();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute:  router.generateRouter,
      initialRoute: signInScreen,
    );
  }
}
