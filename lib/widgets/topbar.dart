import 'package:dop/widgets/welcome_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../constants/icons.dart';
import '../constants/size.dart';
import '../controller/themecontroller.dart';

class TopBar extends StatelessWidget {
  TopBar({
    super.key,
  });

  final themeController = Get.find<ThemeController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 199.h,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(kRadiusTopBar),
          bottomRight: Radius.circular(kRadiusTopBar),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const WelcomeDetail(),
          Padding(
            padding: EdgeInsets.only(
              right: 33.w,
            ),
            child: InkWell(
              onTap: () {
                themeController.changeTheme();
              },
              child: Container(
                  height: 41.h,
                  width: 41.h,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      width: 3,
                      color: Theme.of(context).colorScheme.surface,
                    ),
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                  child: Transform.scale(
                    scale: 0.6,
                    child: SvgPicture.asset(
                      themeController.isDarkMode ? sunIcon : moonIcon,
                      height: 14.97.h,
                      width: 14.97.h,
                    ),
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
