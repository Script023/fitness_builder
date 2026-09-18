import '../models/gender.dart';
import '../models/fitness_goal.dart';
import '../models/user_level.dart';
import '../models/weight.dart';
import '../models/height.dart';
import '../models/user.dart';

// creating a fake user
final mockUser = User(
  fullName: 'Ikechukwu Nnamdi',
  nickname: 'John',
  email: 'nnamdiikechukwu623@gmail.com',
  password: '123456789',
  mobileNumber: '+234-8029879930',
  gender: Gender.male,
  age: 26,
  weight: Weight(value: 65, unit: WeightUnit.kg),
  height: Height(value: 170),
  goal: FitnessGoal.options[4],
  userLevel: UserLevel.intermediate,
);
