import '../mock/mock_user.dart';
import '../models/user.dart';
import '../models/height.dart';
import '../models/weight.dart';

class AuthService {
  Future<User?> login({required String email, required String password}) async {
    if (email == mockUser.email && password == mockUser.password) {
      return mockUser;
    }

    return null;
  }

  Future<User> createUser({
    required String fullName,
    required String password,
    required String mobileOrEmail,
  }) async {
    if (mobileOrEmail.contains('@')) {
      final email = mobileOrEmail;
      return User(
        fullName: fullName,
        password: password,
        email: email,
        age: 18,
        height: Height(value: 50),
        weight: Weight(value: 60, unit: WeightUnit.kg),
      );
    } else {
      final mobileNumber = mobileOrEmail;
      return User(
        fullName: fullName,
        password: password,
        mobileNumber: mobileNumber,
        age: 18,
        height: Height(value: 50),
        weight: Weight(value: 60, unit: WeightUnit.kg),
      );
    }
  }
}
