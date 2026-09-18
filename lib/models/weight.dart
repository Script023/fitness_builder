enum WeightUnit { kg, lb }

class Weight {
  final int value;
  final WeightUnit unit;

  const Weight({required this.value, required this.unit});
}
