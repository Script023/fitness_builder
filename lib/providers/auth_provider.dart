import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../services/auth_service.dart';
import 'auth_state.dart';
// the notifier owns authstate
// authnotifier is an extension of these notifier

class AuthNotifier extends Notifier<AuthState> {
  final AuthService _authService = AuthService();

  @override
  AuthState build() {
    return const AuthState.initial();
  }

  Future<void> login({required String email, required String password}) async {
    state = const AuthState(status: AuthStatus.loading);

    try {
      final user = await _authService.login(email: email, password: password);

      if (user != null) {
        state = AuthState(status: AuthStatus.authenticated, user: user);
      } else {
        state = const AuthState(
          status: AuthStatus.error,
          errorMessage: 'Invalid email or password',
        );
      }
    } catch (e) {
      state = AuthState(status: AuthStatus.error, errorMessage: e.toString());
    }
  }

  Future<void> createUser({
    required String fullName,
    required String password,
    required String mobileOrEmail,
  }) async {
    state = const AuthState(status: AuthStatus.loading);
    try {
      final user = await _authService.createUser(
        fullName: fullName,
        password: password,
        mobileOrEmail: mobileOrEmail,
      );
      state = AuthState(status: AuthStatus.authenticated, user: user);
      print('CREATE USER COMPLETED');
    } catch (e) {
      state = AuthState(status: AuthStatus.error, errorMessage: e.toString());
    }
  }
}

final authProvider = NotifierProvider<AuthNotifier, AuthState>(
  AuthNotifier.new,
);
