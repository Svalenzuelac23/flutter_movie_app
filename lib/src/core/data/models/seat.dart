class Seat {
  final bool isBusy;
  final bool isHidden;
  late bool isSelected;

  Seat({
    required this.isBusy,
    required this.isHidden,
    this.isSelected = false,
  });
}
