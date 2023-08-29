import 'package:flutter/material.dart';

class AdditionalInformationItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  const AdditionalInformationItem({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    //This File only has Humidity Card, remaining cards are in the main file.
    return SizedBox(
      // width:
      //     // 66, //it was a fixed value (which was 100) before, but I hardcoded this value for spaceAround and design purposes.
      //     105,
      child: Column(
        children: [
          Icon(
            icon,
            size: 38,
          ),
          const SizedBox(height: 6),
          Text(
            label,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w100,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            value,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
