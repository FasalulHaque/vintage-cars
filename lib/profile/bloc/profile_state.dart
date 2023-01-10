part of 'profile_bloc.dart';

@immutable
abstract class ProfileState {}

class ProfileInitial extends ProfileState {}

class ProfileAddSucess extends ProfileState {}

class ProfileAddFiled extends ProfileState {
  ProfileAddFiled();
}




