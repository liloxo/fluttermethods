import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'internetcheck_event.dart';
part 'internetcheck_state.dart';

class InternetcheckBloc extends Bloc<InternetcheckEvent, InternetcheckState> {
  Connectivity connectionStatus = Connectivity() ;
  StreamSubscription? connectivitySubscription;
  InternetcheckBloc() : super(InternetcheckInitial()) {
    on<Internetyes>((event, emit) => emit(InternetyesState()));
    on<Internetno>((event, emit) => emit(InternetnoState()));

    connectivitySubscription = connectionStatus.onConnectivityChanged.listen((value) {
      if(value == ConnectivityResult.mobile || value == ConnectivityResult.wifi ){
       add(Internetyes());
      }else{
       add(Internetno());
      }
    });
    
  }

  @override
  Future<void> close() {
    connectivitySubscription?.cancel();
    return super.close();
  }
}
