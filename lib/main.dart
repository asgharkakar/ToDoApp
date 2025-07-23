import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_application_6/HomePage.dart';
import 'package:flutter_application_6/bloc_internet/bloc.dart';


import 'package:flutter_application_6/splashscreen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';




void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>InternetBloc(),
      child: MaterialApp(
        home: const HomePage(),
      ),
    );
  }
}
