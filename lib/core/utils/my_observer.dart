import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyObserver implements BlocObserver{
  @override
  void onChange(BlocBase bloc, Change change) {
    debugPrint('onChange -- ${bloc.runtimeType}, $change');
  }

  @override
  void onClose(BlocBase bloc) {
    debugPrint('onClose -- ${bloc.runtimeType}');
  }

  @override
  void onCreate(BlocBase bloc) {
    debugPrint('onCreate -- ${bloc.runtimeType}');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    debugPrint('onError -- ${bloc.runtimeType}, $error');
  }

  @override
  void onEvent(Bloc bloc, Object? event) {
    debugPrint('onEvent -- ${bloc.runtimeType}, $event');
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    debugPrint('onTransition -- ${bloc.runtimeType}, $transition');
  }
}