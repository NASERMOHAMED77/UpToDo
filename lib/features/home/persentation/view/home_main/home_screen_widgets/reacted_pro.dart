
import 'package:flutter/material.dart';

class ReactedProfiles extends StatelessWidget {
  const ReactedProfiles({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Positioned(
        left: 32,
        bottom: 8,
        child: SizedBox(
          height: 35,
          width: 35,
          child: Stack(
            children: [
              Positioned(
                right: 0,
                child: CircleAvatar(
                  radius: 9,
                ),
              ),
              Positioned(
                left: 0,
                top: 10,
                child: CircleAvatar(
                  radius: 7,
                ),
              ),
              Positioned(
                bottom: 0,
                right: 8,
                child: CircleAvatar(
                  radius: 6,
                ),
              ),
            ],
          ),
        ));
  }
}
