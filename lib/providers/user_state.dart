import 'package:fitness_builder/models/user.dart';

enum UserStatus { initial, loading, loaded, error }

class UserState {
  final UserStatus status;
  final User? user;
  final String? errorMessage;
  const UserState({required this.status, this.user, this.errorMessage});
  const UserState.initial()
    : status = UserStatus.initial,
      user = null,
      errorMessage = null;
}
