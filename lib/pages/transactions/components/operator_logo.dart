import 'package:flutter/material.dart';

class OperatorLogo extends StatelessWidget {
  const OperatorLogo({
    Key? key,
    required this.logoPath,
  }) : super(key: key);

  final String logoPath;

  @override
  Widget build(BuildContext context) {
    return Align(
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 30.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(08),
          child: logoPath.isNotEmpty
              ? Image.asset(
                  logoPath,
                  fit: BoxFit.cover,
                  width: 90,
                )
              : SizedBox.shrink(),
        ),
      ),
    );
  }
}
