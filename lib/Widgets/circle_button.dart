import 'package:flutter/material.dart';

class CircleButton extends StatelessWidget {

  final IconData icon;
  final VoidCallback onPresses;
  final double iconSize;

  const CircleButton({super.key, required this.icon, required this.onPresses, required this.iconSize});


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(6),
      decoration: BoxDecoration(
          color: Colors.grey[200],
          shape: BoxShape.circle
      ),
      child: IconButton(
          onPressed: onPresses,
          icon: Icon(icon,
            size: iconSize,
            color: Colors.black,)
      ),
    );
  }
}
