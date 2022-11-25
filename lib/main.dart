import 'package:flutter/material.dart';
import 'package:furniture_shop_db_editor/core/db/database_helper.dart';

void main() async {
  await DatabaseHelper.instance.init();
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
    );
  }
}
