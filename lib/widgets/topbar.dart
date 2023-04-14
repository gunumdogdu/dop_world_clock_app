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
      height: 199.h,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: lightPrimaryColor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(kRadiusTopBar),
          bottomRight: Radius.circular(kRadiusTopBar),
        ),
      ),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        const WelcomeDetail(),
        Padding(
          padding: EdgeInsets.only(
            right: 33.w,
          ),
          child: InkWell(
            onTap: () {},
            child: Container(
                height: 41.h,
                width: 41.h,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    width: 3,
                    color: lightSecondaryColorWO,
                  ),
                  color: lightSecondaryColor,
                ),
                child: Transform.scale(
                  scale: 0.6,
                  child: SvgPicture.asset(
                    moonIcon,
                    height: 14.97.h,
                    width: 14.97.h,
                  ),
                )),
          ),
        ),
      ]),
    );
  }
}
