import 'package:firebase_login/services/auth.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  final Function toggleView;
  const SignIn({required this.toggleView});

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();

  final _formKey = GlobalKey<FormState>();

  // TextField State
  String email = '';
  String password = '';
  String error = '';
  bool signInbtn = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
        title: Text('Sign In'),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              SizedBox(height: 20),
              TextFormField(
                onChanged: (val) {
                  setState(() => email = val);
                },
                validator: (val) => val!.isEmpty
                    ? 'Enter an Email'
                    : !val.contains('@')
                        ? 'Enter a Valid Email Address'
                        : null,
                decoration: InputDecoration(hintText: 'Enter Email'),
              ),
              SizedBox(height: 20),
              TextFormField(
                obscureText: true,
                onChanged: (val) {
                  setState(() => password = val);
                },
                validator: (val) => val!.isEmpty
                    ? 'Enter Password'
                    : val.length < 8
                        ? 'Enter a Strong Password'
                        : null,
                decoration: InputDecoration(hintText: 'Enter Password'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  if (signInbtn) {}
                  if (_formKey.currentState!.validate()) {
                    dynamic result =
                        await _auth.signinWithEmailandPassword(email, password);
                    if (result == null) {
                      setState(() => error = 'User Not Found!');
                    }
                    print(email);
                    print(password);
                  }
                },
                child: Text(
                  'Sign In',
                ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.pink[400],
                ),
              ),
              SizedBox(height: 10),
              TextButton(
                  onPressed: () {
                    widget.toggleView();
                  },
                  child: Text("Don't have an account? Register Now")),
              SizedBox(height: 20),
              Text(
                error,
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.red,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
