import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/internetcheck_bloc.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.blueGrey,centerTitle: true,title: const Text('Notes',style: TextStyle(letterSpacing: 1),),),
      body: SafeArea(
        child: Center(
          child: BlocConsumer<InternetcheckBloc,InternetcheckState>(
            builder: (context,state){
              if(state is InternetyesState){
                return const Text('Connected');
              }else if (state is InternetnoState){
                return const Text('Not Connected');
              }else{
                return const Text('Loading..');
              }
            }, 
            listener: (context,state){
              if(state is InternetyesState){
                 ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Connected'),backgroundColor: Colors.green,));
              }else if (state is InternetnoState){
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Not Connected'),backgroundColor: Colors.red,));
              }
            }
          ),
        ),
      )
    );
  }
}
