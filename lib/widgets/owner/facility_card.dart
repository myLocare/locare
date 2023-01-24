import 'package:flutter/material.dart';
import 'package:locare/data/models/Facility.dart';

class FacilityCard extends StatelessWidget {
  const FacilityCard({
    super.key,
    required this.facility,
    required this.onTapIncreament,
    required this.onTapDecreament,
  });

  final Facility facility;
  final VoidCallback onTapIncreament;
  final VoidCallback onTapDecreament;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return InkWell(
      onTap: onTapIncreament,
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Container(
              width: width * 0.3,
              height: height * 0.2,
              decoration: BoxDecoration(
                // color: Colors.blue,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  facility.icon!,
                  Text(
                    facility.name!,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 12.5,
                    ),
                  ),
                  Text(
                    facility.numberOfItems.toString(),
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: IconButton(
                onPressed: onTapDecreament,
                icon: const Icon(
                  Icons.remove_circle,
                  // color: Colors.red,
                  size: 20,
                )),
          )
        ],
      ),
    );
  }
}
