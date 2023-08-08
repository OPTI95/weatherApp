import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'dart:convert';
import 'package:crypto/crypto.dart';
part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());
  Future<void> auth(String email, String password) async {
    emit(LoginLoadingState());
    await Firebase.initializeApp();
    UserCredential userCredential;
    final salt = "YxEsl2w4zlPNL0yAODe26Q==";
    final hashedPassword = hashPassword(password, salt);
    try {
      userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: hashedPassword);
      emit(LoginLoadedState());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        emit(LoginErrorState("Пользователь не найден!"));
      } else if (e.code == 'wrong-password') {
        emit(LoginErrorState("Неверный пароль!"));
      }
    }
  }

  String hashPassword(String password, String salt) {
    final codec = Utf8Codec();
    final passwordBytes = codec.encode(password);
    final saltBytes = base64.decode(salt);

    final hmacSha256 = Hmac(sha256, saltBytes);
    final hashedBytes = hmacSha256.convert(passwordBytes).bytes;

    return base64.encode(hashedBytes);
  }
}
