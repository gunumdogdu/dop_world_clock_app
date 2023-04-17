import 'package:dop/constants/color.dart';
import 'package:dop/constants/size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../constants/icons.dart';

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
              hintStyle: Theme.of(context).textTheme.bodyLarge,
              filled: true,
              fillColor: Theme.of(context).colorScheme.onSurface,
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(
                    99,
                  ),
                ),
                borderSide: BorderSide(
                  strokeAlign: 1,
                  color: lightOutlineColor,
                ),
              ),
              enabledBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(
                    99,
                  ),
                ),
                borderSide: BorderSide(
                  strokeAlign: 1,
                  color: lightOutlineColor,
                ),
              ),
              focusedBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(
                    99,
                  ),
                ),
                borderSide: BorderSide(
                  strokeAlign: 1,
                  color: lightOutlineColor,
                ),
              ),
              prefixIcon: Padding(
                padding: EdgeInsets.fromLTRB(15.w, 12.h, 10.w, 12.h),
                child: SvgPicture.asset(searchIcon),
              ),
            ),
            style: Theme.of(context).textTheme.labelMedium,
          ),
        ),
      ),
    );
  }
}
