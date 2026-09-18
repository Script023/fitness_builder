import 'package:fitness_builder/models/fitness_goal.dart';
import 'package:fitness_builder/models/user_level.dart';
import 'package:flutter/material.dart';
import '../models/gender.dart';
import '../models/weight.dart';
import '../models/height.dart';

class SetupProvider extends ChangeNotifier {
  //initialize all the variables
  // and their data types
  Gender? _gender;
  // declaration of the initial value of age
  int _age = 18;
  // declaration of the initial value of weight
  Weight _weight = Weight(value: 60, unit: WeightUnit.kg);
  Height _height = Height(value: 50);
  String? _goal;
  UserLevel? _userLevel;
  //create a getter function to be able to get
  // these variables why? because you just
  // encapsulated them and made it private
  Gender? get gender => _gender;
  int get age => _age;
  Weight get weight => _weight;
  Height get height => _height;
  String? get goal => _goal;
  UserLevel? get userLevel => _userLevel;
  // adding a validation getter
  bool get isGenderSelected => _gender != null;
  int? get selectedGoalIndex {
    if (_goal == null) {
      return null;
    }

    return FitnessGoal.options.indexOf(_goal!);
  }

  // setters
  void setGender(Gender gender) {
    _gender = gender;
    notifyListeners();
    print('Gender: $gender');
  }

  void setAge(int age) {
    _age = age;
    // call these to notify clients that the object has changed
    notifyListeners();
    print('Age: $age');
  }

  void setWeightValue(int value) {
    _weight = Weight(value: value, unit: _weight.unit);
    notifyListeners();
    print('Weight: ${weight.value}${weight.unit}');
  }

  void setWeightUnit(WeightUnit unit) {
    _weight = Weight(value: _weight.value, unit: unit);
    notifyListeners();
  }

  void setHeight(Height height) {
    _height = height;
    notifyListeners();
    print('Height: ${height.value} cm');
  }

  void setFitnessGoal(int? index) {
    _goal = index == null ? null : FitnessGoal.options[index];
    print('Goal : $goal');
    notifyListeners();
  }

  void setUserLevel(UserLevel level) {
    _userLevel = level;
    print('physicality: $_userLevel');
    notifyListeners();
  }
}
