import 'package:belajar_bloc/src/blocs/bloc.dart';
import 'package:belajar_bloc/src/models/post.dart';
import 'package:belajar_bloc/src/ui/counter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

import 'src/ui/post_list.dart';

//void main() {
//  BlocSupervisor.delegate = SimpleBlocDelegate();
//  runApp(App());
//}
void main() {
  runApp(Main());
}

class Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: 'Bloc Sample',
      home: MainApp(),
    );
  }
}

class MainApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MainAppState();
  }
}

class _MainAppState extends State<MainApp> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Bloc Sample'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          RaisedButton(onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => Counter()));
          }, child: Text('Counter'),),
          SizedBox(height: 10,),
          RaisedButton(onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => PostList()));
          }, child: Text('Infinity List'),),
        ],
      ),
    );
  }
}