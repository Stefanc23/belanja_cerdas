import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Belanja Cerdas'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Form(
            key: _formKey,
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 16.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(100.0),
                        ),
                        hintText: 'Cari',
                      ),
                    ),
                  ),
                ),
                Ink(
                  decoration: const ShapeDecoration(
                    color: Colors.blue,
                    shape: CircleBorder(),
                  ),
                  child: IconButton(
                    icon: Icon(Icons.search_rounded),
                    color: Colors.white,
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {}
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
