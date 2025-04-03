import 'dart:developer';

import 'package:financy_app/features/sign_up/sign_up_state.dart';
import 'package:flutter/foundation.dart';

class SignUpController extends ChangeNotifier {
  SignUpState _state = SignUpInitialState();

  SignUpState get state => _state;

  void _changeState(SignUpState newState) {
    _state = newState;
    notifyListeners();
  }

  Future<bool> doSignUp() async {
    //Atualiza uma variável
    _changeState(SignUpLoadingState());

    try {
      await Future.delayed(const Duration(seconds: 2));
      //throw Exception("Error");
      log('Usuario criado com sucesso!');

      //Atualiza novamente  uma variável
      _changeState(SignUpSuccessState());
      return true;
    } catch (e) {
      _changeState(SignUpErrorState());
      return false;
    }
  }
}
