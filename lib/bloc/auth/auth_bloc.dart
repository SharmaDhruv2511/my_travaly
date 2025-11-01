import 'package:flutter_bloc/flutter_bloc.dart';
import 'auth_event.dart';
import 'auth_state.dart';
import 'package:flutter/material.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final BuildContext context;

  AuthBloc(this.context) : super(const AuthState()) {
    on<GoogleSigninEvent>(_handleGoogleSignIn);
  }

  void _handleGoogleSignIn(
    GoogleSigninEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));

    await Future.delayed(const Duration(seconds: 2));

    emit(state.copyWith(isLoading: false));

    if (context.mounted) {
      Navigator.pushReplacementNamed(context, "/home");
    }
  }
}
