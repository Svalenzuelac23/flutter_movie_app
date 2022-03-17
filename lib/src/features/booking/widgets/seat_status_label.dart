import 'package:flutter/material.dart';

class SeatsStatusLabel extends StatelessWidget {
  final Color color;
  final String label;

  const SeatsStatusLabel({
    Key? key,
    required this.color,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 15,
          width: 15,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color,
          ),
        ),
        const SizedBox(width: 8),
        Text(
          label,
          style: const TextStyle(color: Colors.grey, fontSize: 12),
        )
      ],
    );
  }
}
