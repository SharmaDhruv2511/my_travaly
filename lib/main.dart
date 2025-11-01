import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_travaly_task/presentation/auth_screen.dart';
import 'package:my_travaly_task/presentation/property_screen.dart';
import 'package:my_travaly_task/repository/property_repo.dart';

void main(){
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(create: (context) => PropertyRepo()),
      ],
      child: MaterialApp(
        // home: AuthScreen() ,
         initialRoute: '/',
        routes: {
      '/': (context) => const AuthScreen(),
      '/home': (context) => const PropertyScreen(),
        },
      ),
    );
  }
}