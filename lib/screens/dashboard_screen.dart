import 'package:dop/constants/color.dart';
import 'package:dop/constants/icons.dart';
import 'package:dop/constants/size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../widgets/citynamebar.dart';
import '../widgets/search_form.dart';
import '../widgets/topbar.dart';

class DashBoardScreen extends StatelessWidget {
  const DashBoardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              const TopBar(),
              Padding(
                padding: EdgeInsets.only(
                  top: 42.h,
                  bottom: 10.h,
                ),
                child: const CityNameBar(),
              ),
            ],
          ),
          Positioned(
            top: 177.h,
            bottom: null,
            left: 0.w,
            right: 0.w,
            child: const SearchForm(),
          ),
        ],
      ),
    );
  }
}

const OutlineInputBorder outlineInputBorder = OutlineInputBorder(
  borderRadius: BorderRadius.all(
    Radius.circular(
      99,
    ),
  ),
  borderSide: BorderSide(
    strokeAlign: 1,
    color: lightOutlineColor,
  ),
);
