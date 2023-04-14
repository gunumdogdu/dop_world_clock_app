import 'package:dop/constants/color.dart';
import 'package:dop/constants/icons.dart';
import 'package:dop/constants/size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
              SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(
                        33.w,
                        42.h,
                        33.w,
                        10.h,
                      ),
                      child: Container(
                        alignment: Alignment.centerLeft,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(8.0),
                          ),
                          color: lightPrimaryColor,
                        ),
                        height: 54.h,
                        width: double.infinity,
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(20.w, 18.h, 20.w, 18.h),
                          child: Text(
                            'Africa, Abidjan',
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
          Positioned(
              top: 177.h,
              bottom: null,
              left: 0.w,
              right: 0.w,
              child: SearchForm()),
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
