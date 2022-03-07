import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:realm/realm.dart';
import 'package:realm_demo_app/Models/ohakon_dao.dart';
import 'package:realm_demo_app/ohakon.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  Future<void> _incrementCounter() async {
    String json =  await rootBundle.loadString('json/ohakon.json');
    var ohakonW = OhakonJson(1,json);
    OhakonDao.addOhakonJson(ohakonW);

    OhakonJson ohakonJ = OhakonDao.findAll();
    print('Ohakon FFFJson ${ohakonJ.ohakon}');
    var ohakon = OhakonJson(1, 'aaaaa');
    OhakonDao.updateOhakonJson(ohakon);
    OhakonJson ohakonJJ = OhakonDao.findAll();
    print('Ohakon FFFJson ${ohakonJJ.ohakon}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
