import 'package:flutter_bloc/flutter_bloc.dart';
import 'auth_event.dart';
import 'auth_state.dart';
import '../../domain/usecases/login_usecase.dart';
import '../../domain/usecases/signup_usecase.dart';
import '../../../../core/session/session_manager.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LoginUseCase loginUseCase;
  final SignupUseCase signupUseCase;
  final SessionManager sessionManager;

  AuthBloc({required this.loginUseCase, required this.signupUseCase, required this.sessionManager})
      : super(AuthInitial()) {
    on<LoginEvent>((event, emit) async {
      emit(AuthLoading());
      try {
        final user = await loginUseCase.execute(event.email, event.password);
        await sessionManager.saveSession(user.email, user.name, user.token);
        emit(AuthSuccess(user));
      } catch (e) {
        emit(AuthFailure('Login Failed'));
      }
    });

    on<SignupEvent>((event, emit) async {
      emit(AuthLoading());
      try {
        final user = await signupUseCase.execute(event.name, event.email, event.password);
        emit(AuthSuccess(user));
      } catch (e) {
        emit(AuthFailure('Signup Failed'));
      }
    });

    on<LogoutEvent>((event, emit) async {
      await sessionManager.clearSession();
      emit(AuthInitial());
    });
  }
}
