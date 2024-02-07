import 'package:flutter/material.dart';

class SecBtn extends StatelessWidget {
  final VoidCallback onpress;
  final IconData icon;
  const SecBtn({super.key, required this.onpress, required this.icon});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onpress,
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Theme.of(context).colorScheme.primary,
        ),
        child: Icon(
          icon,
          color: Theme.of(context).colorScheme.primaryContainer,
          size: 24,
        ),
      ),
    );
  }
}
