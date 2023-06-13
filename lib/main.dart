import 'package:api_and_provider/home_page.dart';
import 'package:api_and_provider/provider/get_data_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (ctx) => GetDataProvider()),
        ],
        child: const MaterialApp(
          title: 'Flutter Demo',
          home: HomePage(),
        ));
  }
}
