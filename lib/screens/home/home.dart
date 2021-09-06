import 'package:firebase_login/services/auth.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        title: Text('Firebase Login'),
        backgroundColor: Colors.brown[600],
        elevation: 0.0,
        actions: [
          TextButton.icon(
            onPressed: () async {
              await _auth.signOut();
            },
            icon: Icon(
              Icons.person,
              color: Colors.brown[100],
            ),
            label: Text(
              'Logout',
              style: TextStyle(color: Colors.brown[100]),
            ),
          )
        ],
      ),
    );
  }
}
