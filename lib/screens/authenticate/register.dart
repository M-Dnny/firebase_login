import 'package:firebase_login/services/auth.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  final Function toggleView;
  const Register({required this.toggleView});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  // TextField State
  String email = '';
  String password = '';
  String error = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
        title: Text('Register'),
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
                validator: (val) => val!.isEmpty ? 'Enter an Email' : null,
                decoration: InputDecoration(hintText: 'Enter Email'),
              ),
              SizedBox(height: 20),
              TextFormField(
                obscureText: true,
                validator: (val) => val!.isEmpty
                    ? 'Enter Password'
                    : val.length < 8
                        ? 'Enter a Strong Password'
                        : null,
                onChanged: (val) {
                  setState(() => password = val);
                },
                decoration: InputDecoration(hintText: 'Enter Password'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    dynamic result = await _auth.registerWithEmailandPassword(
                        email, password);
                    if (result == null) {
                      setState(
                          () => error = 'Please Enter a Valid Email Address');
                    }
                    print(email);
                    print(password);
                  }
                },
                child: Text(
                  'Register',
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
                  child: Text("Already have an account? Sign In")),
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
