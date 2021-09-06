import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_login/screens/wrapper.dart';
import 'package:firebase_login/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        StreamProvider.value(
          value: AuthService().user,
          initialData: null,
          catchError: (FireBaseUser, CustomUser) => null,
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SafeArea(child: Wrapper()),
      ),
    );
  }
}
