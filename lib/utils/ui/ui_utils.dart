/// All the custom UI widgets like an input text box with search icon,
/// autocomplete widgets, Error message banners, custom checkbox chips related
/// utils can be present in this file and will be used thoughout the application.

import 'package:flutter/material.dart';
import 'package:mypay/utils/ui/app_color.dart';

SnackBar customSnackBar(BuildContext context, String msg) {
  return SnackBar(
    content: Text(
      msg,
      style: Theme.of(context)
          .textTheme
          .bodyText1!
          .copyWith(color: AppColor.white),
    ),
    duration: Duration(seconds: 3),
    backgroundColor: AppColor.mainColor,
  );
}
