import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mypay/common/constants/assest_path.dart';
import 'package:mypay/utils/ui/app_color.dart';

class SendButton extends StatelessWidget {
  final Color color;
  final void Function() onPressed;

  const SendButton({
    Key? key,
    required this.color,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 55,
      child: ElevatedButton.icon(
          icon: SvgPicture.asset(ICON_SEND, color: AppColor.white),
          label: Text(
            'Envoyer',
            style: TextStyle(fontSize: 18),
          ),
          onPressed: onPressed,
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(color),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(12.0)),
              ),
            ),
          )
          // style: ElevatedButton.styleFrom(
          //   shape: RoundedRectangleBorder(
          //     borderRadius: BorderRadius.all(Radius.circular(12.0)),
          //   ),
          // ),
          ),
    );
  }
}

// 