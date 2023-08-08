part of 'login_cubit.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

class LoginInitial extends LoginState {}
class LoginLoadingState extends LoginState {}

class LoginLoadedState extends LoginState {
  
  LoginLoadedState();
}

class LoginErrorState extends LoginState {
  final String error;

  LoginErrorState(this.error);
}