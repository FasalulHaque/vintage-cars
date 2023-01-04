part of 'register_bloc.dart';

@immutable
abstract class RegisterState {}

class RegisterInitial extends RegisterState {}

class LoginSuccess extends RegisterState {}

class LoginFailed extends RegisterState {
  LoginFailed({required this.message});
  String message;
}
