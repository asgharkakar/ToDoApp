
import 'dart:async';



import 'package:connectivity/connectivity.dart';
import 'package:flutter_application_6/bloc_internet/state_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'event_bloc.dart';

class InternetBloc extends Bloc<InternetEvent,internetState>{
  Connectivity _connectivity=Connectivity();
  StreamSubscription? connectivitySubscription;


  InternetBloc():super(internetIntializeState()){
    on((InternetLostEvent, emit) => emit(internetLostState()));
    on((IntenetGainedEvent, emit) => emit(internetGaintState()));

    connectivitySubscription= _connectivity.onConnectivityChanged.listen((result) {
      if(result==ConnectivityResult.mobile || result== ConnectivityResult.wifi)
        {
           add(IntenetGainedEvent());
        }
      else

        {
          add(InternetLostEvent());
        }

    });
  }
  @override
  Future<void> close() {
    connectivitySubscription?.cancel();
    // TODO: implement close
    return super.close();
  }
}