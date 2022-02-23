import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:realm/realm.dart';
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
  int _counter = 0;

  Future<void> _incrementCounter() async {
      var config = Configuration([OhakonJson.schema]);
      var realm = Realm(config);
      await rootBundle.loadString('json/ohakon.json').then((jsonStr){
        var ohakonW = OhakonJson(jsonStr);

        realm.write(() {
          realm.add(ohakonW);
        });
      });


      var ohakonR = realm.all<OhakonJson>();
      OhakonJson ohakonJ = ohakonR[0];
      print("Ohakon Json ${ohakonJ.ohakon}");

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
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
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
