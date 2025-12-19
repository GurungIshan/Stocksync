import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ims_mobile/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:ims_mobile/features/auth/domain/repositories/auth_repository.dart';

import 'core/session/session_manager.dart';

import 'features/auth/data/repositories/auth_repository_impl.dart';
import 'features/auth/domain/usecases/login_usecase.dart';
import 'features/auth/domain/usecases/signup_usecase.dart';
import 'features/auth/presentation/bloc/auth_bloc.dart';
import 'features/auth/presentation/pages/landing_page.dart';
import 'features/dashboard/pages/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final authRepository = AuthRepositoryImpl(AuthRemoteDataSource());

  final sessionManager = SessionManager();
  final session = await sessionManager.getSession();

  runApp(
    MyApp(
      sessionManager: sessionManager,
      session: session,
      authRepository: authRepository,
    ),
  );
}

class MyApp extends StatelessWidget {
  final SessionManager sessionManager;
  final Map<String, String>? session;
  final AuthRepository authRepository;

  const MyApp({
    super.key,
    required this.sessionManager,
    required this.session,
    required this.authRepository,
  });

  @override
  Widget build(BuildContext context) {
    // Data layer
    final authRepository = AuthRepositoryImpl(AuthRemoteDataSource());

    // Domain layer
    final loginUseCase = LoginUseCase(authRepository);
    final signupUseCase = SignupUseCase(authRepository);

    return BlocProvider<AuthBloc>(
      create: (_) => AuthBloc(
        loginUseCase: loginUseCase,
        signupUseCase: signupUseCase,
        sessionManager: sessionManager,
      ),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'StockSync',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          scaffoldBackgroundColor: Colors.white,
          useMaterial3: true,
        ),

        /// Auto session-based navigation
        home: session != null
            ? HomePage(userName: session!['name']!)
            : LandingPage(),
      ),
    );
  }
}
