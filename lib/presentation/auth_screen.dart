import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_travaly_task/bloc/auth/auth_bloc.dart';
import 'package:my_travaly_task/bloc/auth/auth_event.dart';
import 'package:my_travaly_task/bloc/auth/auth_state.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AuthBloc(context),
      child: Scaffold(
        backgroundColor: const Color(0xFF1E1E1E),
        body: SafeArea(
          child: Center(
            child: BlocBuilder<AuthBloc, AuthState>(
              builder: (context, state) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset("assets/images/my_logo.png", height: 120),

                    const SizedBox(height: 20),

                    const Text(
                      "Welcome to My Travaly App",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 40),

                    Row(
                      children: const [
                        Expanded(
                          child: Divider(
                            color: Colors.grey,
                            indent: 30,
                            endIndent: 10,
                          ),
                        ),
                        Text(
                          "Continue with App",
                          style: TextStyle(color: Colors.grey),
                        ),
                        Expanded(
                          child: Divider(
                            color: Colors.grey,
                            indent: 10,
                            endIndent: 30,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 40),

                    GestureDetector(
                      onTap: state.isLoading
                          ? null
                          : () => context.read<AuthBloc>().add(
                              GoogleSigninEvent(),
                            ),
                      child: Container(
                        height: 55,
                        width: 55,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Center(
                          child: state.isLoading
                              ? const CircularProgressIndicator(
                                  strokeWidth: 2,
                                  color: Colors.black,
                                )
                              : SvgPicture.asset(
                                  "assets/images/google_icon.svg",
                                  height: 28,
                                ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
