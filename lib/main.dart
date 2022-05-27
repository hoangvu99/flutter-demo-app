import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Tutorial',
      theme: ThemeData(fontFamily: 'Cairo'),
      home: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Scaffold is a layout for
    // the major Material Components.
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Center(child: Text('Sign up')),
          bottom: const TabBar(
            tabs: [
              Text('Traveller', style: TextStyle(fontSize: 20)),
              Text('Guide', style: TextStyle(fontSize: 20))
            ],
          ),
        ),
        body: const TabBarView(children: <Widget>[SignUp(), SignUp()]),
      ),
    );
  }
}

class Input extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const Input(this.text);

  final String text;
  @override
  Widget build(BuildContext context) {
    // Scaffold is a layout for
    // the major Material Components.
    return TextFormField(
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
          hintText: text,
          border: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.grey, width: 32.0),
              borderRadius: BorderRadius.circular(5.0)),
          focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.grey, width: 1.0),
              borderRadius: BorderRadius.circular(5.0))),
    );
  }
}

class SignUp extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const SignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Scaffold is a layout for
    // the major Material Components.
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(left: 30.0, right: 30.0, top: 60.0),
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: <Widget>[
            Row(children: const [
              Expanded(child: Input("Email*")),
            ]),
            const SizedBox(height: 20),
            Row(children: const [Expanded(child: Input("Password*"))]),
            const SizedBox(height: 20),
            Row(children: const [Expanded(child: Input("Confirm Password*"))]),
            const SizedBox(height: 20),
            Row(children: const [
              Expanded(child: Input("First Name*")),
              SizedBox(height: 20),
              Expanded(child: Input("Last Name*"))
            ]),
            const SizedBox(height: 20),
            Row(children: const [Expanded(child: Input("Phone Number*"))]),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
