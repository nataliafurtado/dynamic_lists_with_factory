import 'package:dynamic_lists_with_factory/presentation/controllers/view_controller.dart';
import 'package:dynamic_lists_with_factory/init_instances.dart';
import 'package:dynamic_lists_with_factory/presentation/widgets/combo_widgets/combo_widget.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

void main() {
  runApp(const MyApp());
  initInstances();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    GetIt.I.get<ViewController>().init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Exemplo listas dinâmicas'),
      ),
      body: const ComboWidget(),
    );
  }
}
