import 'package:flutter/material.dart';
import 'constants.dart';

// Circular Progress Indicator

// Linear Progress Indicator
Widget kLinearLoadingIndicator = LinearProgressIndicator(
    color: Colors.green, backgroundColor: AppColors().kMainBlackColor);

Widget kSizedBox20 = const SizedBox(height: 20);

//To show linear lodaing in bottom sheet

void showLinearLoading(context, bool isTouchDimissable, bool isBackNavAllowed) {
  showModalBottomSheet(
      isDismissible: isTouchDimissable,
      backgroundColor: Colors.transparent,
      context: context,
      builder: (ctx) => WillPopScope(
          onWillPop: () async {
            return isBackNavAllowed;
          },
          child: kLinearLoadingIndicator));
}
