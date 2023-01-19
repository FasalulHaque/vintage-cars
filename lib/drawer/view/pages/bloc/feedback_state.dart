part of 'feedback_bloc.dart';

@immutable
abstract class FeedbackState {}

class FeedbackInitial extends FeedbackState {}

class FeedbackSuccess extends FeedbackState {}

class FeedbackFailed extends FeedbackState {
  FeedbackFailed({required this.message});
  String message;
}
