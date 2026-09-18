
import 'package:fitness_builder/providers/user_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fitness_builder/services/user_service.dart';
import 'package:fitness_builder/providers/auth_provider.dart';
import 'package:fitness_builder/models/gender.dart';
import '../models/weight.dart';
import '../models/height.dart';
import 'package:fitness_builder/models/fitness_goal.dart';
import 'package:fitness_builder/models/user_level.dart';

class UserNotifier extends Notifier<UserState> {
  final UserService _userService = UserService();

  @override
  UserState build() {
    return const UserState.initial();
  }

  Future<void> loadUser() async {
    state = const UserState(status: UserStatus.loading);

    try {
      // user can never be null because we are mocking it
      final user = await _userService.getUser();
      state = UserState(status: UserStatus.loaded, user: user);
    } catch (e) {
      state = UserState(status: UserStatus.error, errorMessage: e.toString());
    }
  }

  // that was brilliant from visual studio code to add this function
  void setCurrentUser() {
    // read that user in authstate and set it in userstate
    final authState = ref.read(authProvider);
    if (authState.user != null) {
      state = UserState(status: UserStatus.loaded, user: authState.user);
    } else {
      state = const UserState(
        status: UserStatus.error,
        errorMessage: 'No user found',
      );
    }
  }

  // setters in the user notifier to set the values of the variables
  // the setters assume that a current user has already been placed into
  // Userstate

  void setGender(Gender gender) {
    final user = state.user;
    if (user != null) {
      final updatedUser = user.copyWith(gender: gender);
      state = UserState(status: UserStatus.loaded, user: updatedUser);
    }
  }

  void setAge(int age) {
    final user = state.user;
    if (user != null) {
      final updatedUser = user.copyWith(age: age);
      state = UserState(status: UserStatus.loaded, user: updatedUser);
    }
  }

  void setWeightValue(int value) {
    final user = state.user;
    if (user != null) {
      final updatedUser = user.copyWith(
        weight: Weight(value: value, unit: user.weight?.unit ?? WeightUnit.kg),
      );
      state = UserState(status: UserStatus.loaded, user: updatedUser);
    }
  }

  void setWeightUnit(WeightUnit unit) {
    final user = state.user;
    if (user != null) {
      final updatedUser = user.copyWith(
        weight: Weight(value: user.weight?.value ?? 0, unit: unit),
      );
      state = UserState(status: UserStatus.loaded, user: updatedUser);
    }
  }

  void setHeight(int height) {
    final user = state.user;
    if (user != null) {
      final updatedUser = user.copyWith(height: Height(value: height));
      state = UserState(status: UserStatus.loaded, user: updatedUser);
    }
  }

  void setGoal(int? index) {
    final user = state.user;
    if (user != null) {
      final goal = index == null ? null : FitnessGoal.options[index];
      final updatedUser = user.copyWith(goal: goal);
      state = UserState(status: UserStatus.loaded, user: updatedUser);
    }
  }

  void setUserLevel(UserLevel userLevel) {
    final user = state.user;
    if (user != null) {
      final updatedUser = user.copyWith(userLevel: userLevel);
      state = UserState(status: UserStatus.loaded, user: updatedUser);
    }
  }

  void setNickname(String nickname) {
    final user = state.user;

    if (user != null) {
      final updatedUser = user.copyWith(nickname: nickname);

      state = UserState(status: UserStatus.loaded, user: updatedUser);
    }
  }

  void setEmail(String email) {
    final user = state.user;
    if (user != null) {
      final updatedUser = user.copyWith(email: email);
      state = UserState(status: UserStatus.loaded, user: updatedUser);
    }
  }

  void setMobile(String mobileNumber) {
    final user = state.user;
    if (user != null) {
      final updatedUser = user.copyWith(mobileNumber: mobileNumber);
      state = UserState(status: UserStatus.loaded, user: updatedUser);
    }
  }

  bool isProfileComplete() {
    final user = state.user;
    if (user == null) {
      return false;
    } else {
      if (user.email == null && user.mobileNumber == null) {
        return false;
      }
      if (user.gender == null) {
        return false;
      }
      if (user.age == null) {
        return false;
      }
      if (user.goal == null || user.goal!.trim().isEmpty) {
        return false;
      }
      if (user.weight == null) {
        return false;
      }
      if (user.height == null) {
        return false;
      }
      if (user.userLevel == null) {
        return false;
      }
      if (user.nickname == null || user.nickname!.trim().isEmpty) {
        return false;
      }
    }
    return true;
  }
  

}

final userProvider = NotifierProvider<UserNotifier, UserState>(
  UserNotifier.new,
);
