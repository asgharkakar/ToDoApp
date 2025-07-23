
import 'package:flutter/material.dart';
import 'package:flutter_application_6/bloc_internet/bloc.dart';
import 'package:flutter_application_6/bloc_internet/state_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocBuilder<InternetBloc,internetState>(
            builder: (context,state){
              if(state is internetGaintState){
                return Text("Connected");
              }
              else if(state is internetLostState){
                return Text("Internet not connected");
              }
              else
                {
                  return Text("search...");
                }


           },


      ),
    )
    );
  }
}
