import 'package:flutter/material.dart';
import 'package:arcore_flutter_plugin/arcore_flutter_plugin.dart';
import 'package:vector_math/vector_math_64.dart' as vector;
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
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
  late ArCoreController arCoreController;
  late ArCoreNode node;
  void dipsose(){
    super.dispose();
    arCoreController.dispose();
  }
  _onArCoreViewCreated(ArCoreController controller){
    arCoreController = controller;
    _addSphere(arCoreController);

  }
  _addSphere(ArCoreController controller){
    final material = ArCoreMaterial(color:Colors.red);
    final sphere = ArCoreSphere(materials:[material], radius:0.2);
    node = ArCoreNode(
        name: 'Sphere',
        shape: sphere,
        position:vector.Vector3(0,-1,-1),
        rotation:vector.Vector4(0,0,0,0),
    );
    controller.addArCoreNode(node);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:ArCoreView(onArCoreViewCreated:_onArCoreViewCreated  ));

  }
}
