import 'package:counter_app/controllers/Counter_controller.dart';
import 'package:counter_app/controllers/Theme_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Page"),
        centerTitle: true,
        actions: [
          Consumer<ThemeController>(
            builder: (context, provider, child) => IconButton(
              onPressed: () {
                provider.changeTheme();
              },
              icon: Icon(
                provider.getValue ? Icons.light_mode : Icons.dark_mode,
              ),
            ),
          ),
        ],
      ),
      body: Align(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Press + to increase the counter"),
            Consumer<CounterController>(
              builder: (context, provider, child) => Text(
                "${provider.getCounter}",
                style: const TextStyle(
                  fontSize: 44,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
            onPressed: () {
              Provider.of<CounterController>(context, listen: false).increase();
            },
            child: const Icon(Icons.add),
          ),
          const SizedBox(
            width: 20,
          ),
          FloatingActionButton(
            onPressed: () {
              Provider.of<CounterController>(context, listen: false).decrease();
            },
            child: const Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}
