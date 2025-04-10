import 'package:financy_app/features/sign_up/sign_up_state.dart';
import 'package:financy_app/services/auth_service.dart';
import 'package:flutter/foundation.dart';

class SignUpController extends ChangeNotifier {
  final AuthService _service;

  SignUpController(this._service);

  SignUpState _state = SignUpStateInitial();

  SignUpState get state => _state;

  void _changeState(SignUpState newState) {
    _state = newState;
    notifyListeners();
  }

  Future<void> signUp({
    required String? name,
    required String email,
    required String password,
  }) async {
    //Atualiza uma variável
    _changeState(SignUpStateLoading());

    try {
      await _service.signUp(name: name, email: email, password: password);

      //Atualiza novamente  uma variável
      _changeState(SignUpStateSuccess());
    } catch (e) {
      _changeState(SignUpStateError(message: e.toString()));
    }
  }
}
