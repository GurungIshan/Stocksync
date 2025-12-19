import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ims_mobile/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:ims_mobile/features/auth/presentation/bloc/auth_event.dart';
import 'package:ims_mobile/features/auth/presentation/pages/landing_page.dart';

class HomePage extends StatelessWidget {
  final String userName;
  HomePage({required this.userName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Welcome, $userName', style: TextStyle(fontSize: 24)),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                BlocProvider.of<AuthBloc>(context).add(LogoutEvent());
                Navigator.pushAndRemoveUntil(
                    context, MaterialPageRoute(builder: (_) => LandingPage()), (route) => false);
              },
              child: Text('Logout'),
            ),
          ],
        ),
      ),
    );
  }
}
