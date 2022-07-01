import 'package:flutter/material.dart';
import 'login.dart';
import 'signup.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
      ),
      body: Container(
        color: Colors.white,
        child: Column(children: <Widget>[
          const SizedBox(
            height: 200,
          ),
          Center(
            child: FlatButton(
                padding:
                    const EdgeInsets.symmetric(vertical: 18, horizontal: 80),
                color: Colors.deepPurple,
                textColor: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32.0)),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const Login()));
                },
                child: const Text(
                  'LOGIN',
                  style: TextStyle(fontSize: 18.0),
                )),
          ),
          const Padding(
            padding: EdgeInsets.all(18.0),
            child: Text("Don't have an account?"),
          ),
          Center(
            child: FlatButton(
                padding:
                    const EdgeInsets.symmetric(vertical: 18, horizontal: 72),
                color: Colors.purple[50],
                textColor: Colors.black,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32.0)),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const SignUp()));
                },
                child: const Text(
                  'SIGN UP',
                  style: TextStyle(fontSize: 18.0),
                )),
          ),
        ]),
      ),
    );
  }
}
