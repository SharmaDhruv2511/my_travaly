import 'package:equatable/equatable.dart';

class AuthState extends Equatable {

  final bool isLoading;

  const AuthState({ this.isLoading = false});

  AuthState copyWith({bool? isLoading}) {
    return AuthState(isLoading: isLoading ?? this.isLoading);
  }

  @override
  List<Object> get props => [isLoading];
}