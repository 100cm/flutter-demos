import 'package:dart/components/common/button.component.dart';
import 'package:dart/components/stream/stream-text.component.dart';
import 'package:dart/css/button.css.dart';
import 'package:dart/demos/demo-animation.dart';
import 'package:dart/demos/demo-buttons.dart';
import 'package:dart/demos/demo-drawer.dart';
import 'package:dart/demos/demo-grid-view.dart';
import 'package:dart/demos/demo-list.dart';
import 'package:dart/demos/demo-new-app.dart';
import 'package:dart/demos/demo-notification.dart';
import 'package:dart/demos/demo-overlay.dart';
import 'package:dart/demos/demo-refresh.dart';
import 'package:dart/demos/demo-text.dart';
import 'package:dart/stores/base_store.dart';
import 'package:dart/stores/events_monitor.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/subjects.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  String date;

// This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      routes: {
        '/': (context) => MyHomePage(title: 'index home'),
        '/buttons': (context) => DemoButton(),
        '/list': (context) => DemoList(),
        '/drawer': (context) => DemoDrawerState(),
        '/grid': (context) => DemoGridView(),
        '/new_app': (context) => DemoApp(),
        '/notification': (context) => DemoNotification(),
        '/animations': (context) => DemoAnimation(),
        '/overlays': (context) => DemoOverlay(),
        '/refresh': (context) => DemoRefresh(),
        '/texts':(context)=>DemoText(),
      },
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
        primarySwatch: Colors.blue,
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  int asd = 0;
  final _sides = BehaviorSubject<int>();

  get sides => _sides.stream;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      asd += 12;
      _counter++;
    });
  }

  void update() {
    this.asd += 123;
    this._sides.add(this.asd += 123);
  }

  go(context, constructor) {
    Navigator.pushNamed(context, constructor);
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
//    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
//      statusBarColor: Colors.blue, //or set color with: Color(0xFF0000FF)
//    ));

    const List list = [
      {'name': 'Drawer', 'path': '/drawer'},
      {'name': 'buttons', 'path': '/buttons'},
      {'name': 'List', 'path': '/list'},
      {'name': 'Refresh', 'path': '/refresh'},
      {'name': 'Grid View', 'path': '/grid'},
      {'name': 'New App', 'path': '/new_app'},
      {'name': 'Notification', 'path': '/notification'},
      {'name': 'Animation', 'path': '/animations'},
      {'name': 'overlay', 'path': '/overlays'},
      {'name': 'Text', 'path': '/texts'},
    ];

    store.setStore(Stores.MAIN_CONTEXT, context);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: Container(
          child: Center(
            child: Text('Components'),
          ),
        ),
      ),
      body: Container(
        margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
        width: MediaQuery
            .of(context)
            .size
            .width,
        color: const Color(0xF000000),
        child: Padding(
          padding: EdgeInsets.all(20),
          child: ListView.separated(
              itemBuilder: (context, index) {
                return Button(list[index]['name'], backgroundColor: "#1890ff",
                    borderRadius: 4.0,
                    onClick: () {
                      Navigator.pushNamed(context, list[index]['path']);
                    },
                    color: '#FFFFFF',
                    height: 50.0,
                  );
              },
              separatorBuilder: (context, index) {
                return Divider(color: HexColor('#E0E0E0'), height: 16);
              },
              itemCount: list.length),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Flex(
          direction: Axis.horizontal,
          children: <Widget>[
            Expanded(
              flex: 5,
              child: Text('Global Monitor'),
            ),
            StreamText(
              eventMonitor.getEvent(Events.Login)
            )
          ],
        ),
      ),
    );
  }
}
