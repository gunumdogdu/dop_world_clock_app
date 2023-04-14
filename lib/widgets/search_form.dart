import 'package:dop/constants/size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../constants/icons.dart';
import '../screens/dashboard_screen.dart';

class SearchForm extends StatelessWidget {
  const SearchForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 44,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 33.w, vertical: 0),
        child: Form(
          child: TextFormField(
            decoration: InputDecoration(
              hintText: 'Arama',
              hintStyle: Theme.of(context).textTheme.bodySmall,
              filled: true,
              fillColor: Colors.white,
              border: outlineInputBorder,
              enabledBorder: outlineInputBorder,
              focusedBorder: outlineInputBorder,
              prefixIcon: Padding(
                padding: EdgeInsets.fromLTRB(15.w, 12.h, 10.w, 12.h),
                child: SvgPicture.asset(searchIcon),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
