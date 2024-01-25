import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/internetcheck_bloc.dart';
import 'homepage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent)
    );
    return BlocProvider(
      create: (context)=> InternetcheckBloc(),
      child: const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    )
    );
  }
}

