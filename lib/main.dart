import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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

class PasswordInput extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const PasswordInput(this.text);

  final String text;
  @override
  Widget build(BuildContext context) {
    // Scaffold is a layout for
    // the major Material Components.
    return Stack(
      children: [
        TextFormField(
          keyboardType: TextInputType.text,
          obscureText: true,
          decoration: InputDecoration(
            hintText: text,
            border: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.grey, width: 32.0),
                borderRadius: BorderRadius.circular(5.0)),
          ),
        ),
        Positioned(
          child: Icon(Icons.lock_outline),
          right: 10,
          top: 15.5,
        )
      ],
    );
  }
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
              Text('Sign Up', style: TextStyle(fontSize: 20)),
              Text('Login', style: TextStyle(fontSize: 20))
            ],
          ),
        ),
        body: const TabBarView(children: <Widget>[SignUp(), Login()]),
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
      ),
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
              Expanded(child: EmailInput()),
            ]),
            const SizedBox(height: 20),
            Row(children: const [Expanded(child: PasswordInput("Password*"))]),
            const SizedBox(height: 20),
            Row(children: const [
              Expanded(child: PasswordInput("Confirm Password*"))
            ]),
            const SizedBox(height: 20),
            Row(children: const [
              Expanded(child: Input("First Name*")),
              SizedBox(height: 20),
              Expanded(child: Input("Last Name*"))
            ]),
            const SizedBox(height: 20),
            Row(children: [Expanded(child: PhoneInput())]),
            const SizedBox(height: 20),
            Row(children: [CheckBoxInput(), Text('I accept all The Terms')]),
            const SizedBox(height: 20),
            Row(children: [
              ElevatedButton(onPressed: () => {}, child: Text('Đăng ký'))
            ]),
          ],
        ),
      ),
    );
  }
}

class PhoneInput extends StatefulWidget {
  const PhoneInput({Key? key}) : super(key: key);

  @override
  State<PhoneInput> createState() => _PhoneInputState();
}

class _PhoneInputState extends State<PhoneInput> {
  void grow() {
    setState(() {});
  }

  var item = {'+84', '+44', '+1', '+66'};
  String selectedValue = "+84";
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        TextFormField(
          keyboardType: TextInputType.number,
          inputFormatters: <TextInputFormatter>[
            FilteringTextInputFormatter.digitsOnly
          ],
          decoration: InputDecoration(
            hintText: 'Phone Number*',
            contentPadding: EdgeInsets.only(left: 110),
            border: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.grey, width: 32.0),
                borderRadius: BorderRadius.circular(5.0)),
          ),
        ),
        Positioned(
          child: Column(children: [
            DropdownButton(
              items: item.map((String i) {
                return DropdownMenuItem(
                  value: i,
                  child: Text(i),
                );
              }).toList(),
              onChanged: (String? newvalue) {
                setState(() {
                  selectedValue = newvalue!;
                });
              },
              value: selectedValue,
            )
          ]),
          left: 50,
          top: -1,
        ),
        Positioned(
          child: Image.asset(
            'images/' + selectedValue + '.png',
            width: 30,
            height: 20,
          ),
          left: 10,
          top: 11.5,
        )
      ],
    );
  }
}

class CheckBoxInput extends StatefulWidget {
  const CheckBoxInput({Key? key}) : super(key: key);

  @override
  State<CheckBoxInput> createState() => _CheckBoxInputState();
}

class _CheckBoxInputState extends State<CheckBoxInput> {
  bool checkValue = false;
  @override
  Widget build(BuildContext context) {
    return Checkbox(
        value: checkValue,
        onChanged: (bool? newValue) => {
              setState(() {
                checkValue = newValue!;
              })
            });
  }
}

class EmailInput extends StatefulWidget {
  const EmailInput({Key? key}) : super(key: key);

  @override
  _EmailInputState createState() => _EmailInputState();
}

class _EmailInputState extends State<EmailInput> {
  String msg = "";
  String color = "";
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        TextFormField(
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
            hintText: "Email",
            helperText: msg,
            border: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.grey, width: 32.0),
                borderRadius: BorderRadius.circular(5.0)),
          ),
          onChanged: (String? value) => {
            if (!RegExp(
                    r"^([a-zA-Z0-9_\-\.]+)@([a-zA-Z0-9_\-\.]+)\.([a-zA-Z]{2,5})$")
                .hasMatch(value!))
              {
                setState(() => {msg = "Email không hợp lệ"})
              }
            else
              {
                setState(() => {msg = "Email hợp lệ"})
              }
          },
        ),
        Positioned(
          child: Icon(Icons.email_outlined),
          right: 10,
          top: 15.5,
        )
      ],
    );
  }
}

class Login extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const Login({Key? key}) : super(key: key);

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
              Expanded(child: EmailInput()),
            ]),
            const SizedBox(height: 20),
            Row(children: const [Expanded(child: PasswordInput("Password*"))]),
            const SizedBox(height: 20),
            Center(
              child:
                  ElevatedButton(onPressed: () => {}, child: Text('Đăng nhập')),
            ),
            const SizedBox(height: 20),
            Center(
              child: Text('Forgot Password'),
            ),
            const SizedBox(height: 20),
            Center(
              child: Text('Sign up with Email'),
            ),
            const SizedBox(height: 20),
            Center(
              child: Text('---------- Or Login With ---------'),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                LogoItem("fb-logo.png"),
                LogoItem("ins-logo.png"),
                LogoItem("gmail-logo.png"),
                LogoItem("twitter-logo.png")
              ],
            )
          ],
        ),
      ),
    );
  }
}

class LogoItem extends StatelessWidget {
  const LogoItem(this.logo);

  final String logo;
  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'images/' + logo,
      width: 30,
      height: 30,
    );
  }
}
