import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<LoginEvent>((event, emit) async {
      if (event is LoginnEvent) {
        final auth = FirebaseAuth.instance;
        try {
          await auth.signInWithEmailAndPassword(
            email: event.email,
            password: event.password,
          );

          emit(LoginSuccess());
        } on FirebaseAuthException catch (e) {
          emit(LoginFailed(message: e.code));
        }
      }
    });
  }
}
