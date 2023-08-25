import 'package:counter_app/controllers/Counter_controller.dart';
import 'package:counter_app/controllers/Theme_controller.dart';
import 'package:counter_app/utils/routes_utils.dart';
import 'package:counter_app/views/screens/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SharedPreferences preferences = await SharedPreferences.getInstance();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => CounterController(preferences: preferences),
        ),
        ChangeNotifierProvider(
          create: (context) => ThemeController(preferences: preferences),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,

      ),
      darkTheme: ThemeData.dark(
        useMaterial3: true,
      ),
      themeMode: Provider.of<ThemeController>(context).getValue
          ? ThemeMode.dark
          : ThemeMode.light,
      initialRoute: MyRoute.HomePage,
      routes: {
        MyRoute.HomePage: (context) => const HomePage(),
      },
    );
  }
}
