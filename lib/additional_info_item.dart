import 'package:flutter/material.dart';

class AdditionalInformationItem extends StatelessWidget {
  const AdditionalInformationItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    //This File only has Humidity Card, remaining cards are in the main file.
    return const SizedBox(
      width:
          66, //it was a fixed value (which was 100) before, but I hardcoded this value for spaceAround and design purposes.
      child: Column(
        children: [
          Icon(
            Icons.water_drop,
            size: 38,
          ),
          SizedBox(height: 6),
          Text(
            "Humididty",
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w100,
            ),
          ),
          SizedBox(height: 6),
          Text(
            "80%",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
