import 'package:flutter/material.dart';
import 'package:manemo/dialog.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.green,
      ),
      home: Monemo(title: 'Monemo'),
    );
  }
}

class Monemo extends StatefulWidget {
  Monemo({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MonemoState createState() => _MonemoState();
}

class _MonemoState extends State<Monemo> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Monemo'),
      ),
      body: new Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Center(
              child: Card(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text('2019/03',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 30)),
                    const ListTile(
                      leading: Icon(
                        Icons.attach_money,
                        size: 40.0,
                        color: Colors.indigo,
                      ),
                      title: Text('30,000',
                          textAlign: TextAlign.right,
                          style: TextStyle(fontSize: 30)),
                      subtitle: Text('Cash',
                          textAlign: TextAlign.right,
                          style: TextStyle(fontSize: 10)),
                    ),
                    const ListTile(
                      leading: Icon(
                        Icons.credit_card,
                        size: 40.0,
                        color: Colors.indigo,
                      ),
                      title: Text('30,000',
                          textAlign: TextAlign.right,
                          style: TextStyle(fontSize: 30)),
                      subtitle: Text('Charge',
                          textAlign: TextAlign.right,
                          style: TextStyle(fontSize: 10)),
                    ),
                    ButtonTheme.bar(
                      child: ButtonBar(
                        alignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          FlatButton(
                            child: const Text('NEXT MONTH'),
                            onPressed: () {/* ... */},
                          ),
                          FlatButton(
                            child: const Text('PREV MONTH'),
                            onPressed: () {/* ... */},
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            new Expanded(
              child: new SizedBox(
                  height: 200,
                  child: ListView.builder(
                    itemCount: 4,
                    itemBuilder: (context, int index) {
                      return Card(
                        child: Column(
                          children: <Widget>[
                            ListTile(
                              leading: Icon(Icons.map),
                              title: Text('created ' + index.toString()),
                            )
                          ],
                        ),
                      );
                    },
                  )),
            ),
          ]),
      floatingActionButton: new FloatingActionButton(
          backgroundColor: const Color(0xFF0099ed),
          child: new Icon(Icons.add_circle),
          onPressed: openDialog),
    );
  }

  void openDialog() {
    // showDialog(context: context, builder: (_) => ManemoReceiptDialog());
    Navigator.push(
      context,
      MaterialPageRoute(
          settings: RouteSettings(name: "/payments/register"),
          builder: (BuildContext context) => ManemoReceiptDialog()),
    );
  }
}
