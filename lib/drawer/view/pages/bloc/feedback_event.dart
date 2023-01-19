part of 'feedback_bloc.dart';

@immutable
abstract class FeedbackEvent {}
class FeedbackAddEvent extends FeedbackEvent {
  FeedbackAddEvent({
    required this.feedback
  });



  String feedback;
}
