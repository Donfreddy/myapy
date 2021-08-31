import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mypay/common/constants/assest_path.dart';
import 'package:mypay/utils/ui/app_color.dart';

class PhoneField extends StatelessWidget {
  final Color color;
  final TextEditingController controller;
  final void Function(String) onChanged;
  final void Function()? pickContact;

  const PhoneField({
    Key? key,
    required this.color,
    required this.controller,
    required this.onChanged,
    this.pickContact,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextFormField(
        controller: controller,
        keyboardType: TextInputType.number,
        cursorColor: color,
        onChanged: onChanged,
        // inputFormatters: [PhoneFormatter()],
        decoration: InputDecoration(
          prefixIcon: Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: SvgPicture.asset(ICON_CALL, color: color),
          ),
          prefixIconConstraints: BoxConstraints(minHeight: 20, minWidth: 20),
          suffixIcon: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: pickContact,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(14 - 2),
                bottomRight: Radius.circular(14 - 2),
              ),
              child: Container(
                height: 57,
                width: 55,
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(14 - 2),
                    bottomRight: Radius.circular(14 - 2),
                  ),
                ),
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: SvgPicture.asset(ICON_2USER, color: AppColor.white),
              ),
            ),
          ),
          suffixIconConstraints: BoxConstraints(minHeight: 20, minWidth: 20),
          labelText: 'Numéro de téléphone',
          labelStyle: TextStyle(color: color),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(14 - 2)),
            borderSide: BorderSide(color: color, width: 2),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14 - 2),
            borderSide: BorderSide(color: color),
          ),
        ),
      ),
    );
  }
}
