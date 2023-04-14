import 'package:dop/widgets/welcome_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../constants/color.dart';
import '../constants/icons.dart';
import '../constants/size.dart';

class TopBar extends StatelessWidget {
  const TopBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 199,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: lightPrimaryColor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(32),
          bottomRight: Radius.circular(32),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const WelcomeDetail(),
          SizedBox(
            height: 70,
            width: 70,
            child: IconButton(
              padding: const EdgeInsets.only(right: 33),
              onPressed: () {}, // DARK - LIGHT THEME BUTTON PRESS FUNCTION
              icon: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    width: 3,
                    color: lightSecondaryColorWO,
                  ),
                ),
                child: CircleAvatar(
                  radius: 35,
                  backgroundColor: lightSecondaryColor,
                  child: SvgPicture.asset(
                    moonIcon,
                    height: 14.97,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
