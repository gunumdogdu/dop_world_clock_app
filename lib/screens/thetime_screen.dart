import 'package:dop/constants/color.dart';
import 'package:dop/constants/icons.dart';
import 'package:dop/constants/size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TheTimeScreen extends StatefulWidget {
  const TheTimeScreen({super.key});

  @override
  State<TheTimeScreen> createState() => _TheTimeScreenState();
}

class _TheTimeScreenState extends State<TheTimeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 111.h,
            decoration: const BoxDecoration(
              color: lightPrimaryColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(kRadiusTopBar),
                bottomRight: Radius.circular(kRadiusTopBar),
              ),
            ),
            child: Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset(arrowLeftIcon),
                ),
                Image.asset(headlineImg),
              ],
            ),
          )
        ],
      ),
    );
  }
}
// IconButton(
//                   onPressed: () {}, icon: SvgPicture.asset(arrowLeftIcon))