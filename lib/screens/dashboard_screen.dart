import 'package:dop/constants/color.dart';

import 'package:dop/constants/size.dart';
import 'package:flutter/material.dart';

import '../widgets/citynamebar.dart';
import '../widgets/search_form.dart';
import '../widgets/topbar.dart';

class DashBoardScreen extends StatelessWidget {
  const DashBoardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Stack(
        children: [
          Column(
            children: [
              TopBar(),
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
