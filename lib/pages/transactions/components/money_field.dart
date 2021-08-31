import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
// import 'package:intl/intl.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mypay/common/constants/assest_path.dart';
import 'package:mypay/utils/helpers/number_input_formatter.dart';

class MoneyField extends StatelessWidget {
  final Color color;
  final TextEditingController controller;
  final void Function(String) onChanged;

  const MoneyField({
    Key? key,
    required this.color,
    required this.controller,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 1.6,
      child: TextFormField(
        controller: controller,
        keyboardType: TextInputType.number,
        cursorColor: color,
        onChanged: onChanged,
        inputFormatters: [ThousandsFormatter()],
        decoration: InputDecoration(
          // suffix: ElevatedButton(

          //   style: ButtonStyle(),
          //   onPressed: () {},
          //   child: Text('data'),
          // ),
          // suffix: ,
          prefixIcon: Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: SvgPicture.asset(ICON_TICKET, color: color),
          ),
          prefixIconConstraints: BoxConstraints(minHeight: 20, minWidth: 20),

          labelText: 'Montant',
          hintText: 'Montant',
          labelStyle: TextStyle(color: color),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(14.0 - 2)),
            borderSide: BorderSide(color: color, width: 2),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(14.0 - 2)),
            borderSide: BorderSide(color: color),
          ),
        ),
      ),
    );
  }
}
