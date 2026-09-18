import '../mock/mock_user.dart';
import '../models/user.dart';

class UserService {
  Future<User> getUser() async {
    return mockUser;
  }
}