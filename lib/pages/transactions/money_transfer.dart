import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mypay/pages/transactions/components/money_field.dart';
import 'package:mypay/pages/transactions/components/operator_logo.dart';
import 'package:mypay/pages/transactions/components/phone_field.dart';
import 'package:mypay/pages/transactions/components/send_button.dart';
import 'package:mypay/utils/helpers/custom_switch.dart';
import 'package:mypay/utils/helpers/utils.dart';
import 'package:mypay/utils/models/transaction.dart';
import 'package:mypay/utils/ui/app_color.dart';
import 'package:mypay/widgets/app_bar.dart';
import 'package:permission_handler/permission_handler.dart';

class Moneytransfer extends StatefulWidget {
  final Transaction transaction;

  const Moneytransfer({Key? key, required this.transaction}) : super(key: key);

  @override
  _MoneytransferState createState() => _MoneytransferState();
}

class _MoneytransferState extends State<Moneytransfer> {
  // Variables
  String phone = '671842701';
  String logoPath = '';
  String amount = '0';
  String operatorName = '';
  String fees = '50';
  bool hasCharges = false;
  bool isSameOperator = true;

  // Ctrllers
  final phoneCtrller = TextEditingController();
  final amountCtrller = TextEditingController();

  onChangePhone(String newValue) {
    setState(() {
      phone = newValue;
    });
  }

  onChangeAmount(String newValue) {
    setState(() {
      amount = newValue;
    });
  }

  initData() async {
    final userOperator = await getOprator();

    setState(() {
      logoPath = userOperator.logoPath;
    });

    operatorName = getOperatorName(userOperator.id);
  }

  @override
  void initState() {
    initData();

    phoneCtrller.text = phone;
    // amountCtrller.text = amount;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: emptyAppbar(
        context,
        widget.transaction.iconColor ?? AppColor.white,
        widget.transaction.type,
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              OperatorLogo(logoPath: logoPath),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20) +
                    EdgeInsets.only(bottom: 10),
                child: Row(
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                isSameOperator = true;
                              });
                            },
                            child: Icon(
                              isSameOperator
                                  ? Icons.radio_button_checked
                                  : Icons.radio_button_unchecked,
                              color: AppColor.mainColor,
                            ),
                          ),
                          SizedBox(width: 5.0),
                          Text(
                            "$operatorName",
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                isSameOperator = false;
                              });
                            },
                            child: Icon(
                              isSameOperator
                                  ? Icons.radio_button_unchecked
                                  : Icons.radio_button_checked,
                              color: AppColor.mainColor,
                            ),
                          ),
                          SizedBox(width: 5.0),
                          Text(
                            "Non $operatorName",
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              PhoneField(
                color: widget.transaction.iconColor ?? AppColor.white,
                controller: phoneCtrller,
                onChanged: onChangePhone,
                pickContact: _pickContact,
              ),
              SizedBox(height: 20),
              Container(
                child: Row(
                  children: [
                    MoneyField(
                      color: widget.transaction.iconColor!,
                      controller: amountCtrller,
                      onChanged: onChangeAmount,
                    ),
                    Expanded(
                        child: Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Frais d’envoie',
                            style:
                                TextStyle(fontSize: 12, color: AppColor.gray2),
                            maxLines: 2,
                          ),
                          SizedBox(height: 4),
                          Text(
                            '$fees FCFA',
                            style: TextStyle(color: AppColor.gray2),
                            maxLines: 3,
                          ),
                        ],
                      ),
                    ))
                  ],
                ),
              ),
              // SizedBox(height: 20),
              // Padding(
              //   padding: const EdgeInsets.symmetric(vertical: 10),
              //   child: Row(
              //     children: [
              //       Icon(Icons.add),
              //       Text(
              //         'Ajouter une référence',
              //         style: TextStyle(fontSize: 12, color: AppColor.gray2),
              //       ),
              //     ],
              //   ),
              // ),
              // // Container(child: TextField()),

              AnimatedOpacity(
                opacity: hasCharges ? 1 : 0,
                duration: Duration(milliseconds: 300),
                child: Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Text(
                    'Montant Total: 5150 FCFA',
                    style: TextStyle(color: AppColor.gray2),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Container(
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          hasCharges = !hasCharges;
                        });
                      },
                      child: CustomSwitch(
                        backgroundColor: hasCharges
                            ? widget.transaction.iconColor!
                            : Colors.grey,
                        unCheckedColor: Colors.white,
                        animationDuration: Duration(milliseconds: 300),
                        checkedColor: Colors.white,
                        checked: hasCharges,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 6),
                      child: Text(
                        'Inclure les frais de retrait',
                        style: TextStyle(fontSize: 12, color: AppColor.gray2),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 40),
              SendButton(
                color: widget.transaction.iconColor!,
                onPressed: () {},
              ),
              SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _pickContact() async {
    final status = await Permission.contacts.status;

    if (status.isGranted) {
      try {
        final contact = await ContactsService.openDeviceContactPicker();

        if (contact!.phones!.isEmpty) {
          print(contact.displayName);
        } else {
          showModalBottomSheet<void>(
            context: context,
            isScrollControlled: true,
            backgroundColor: AppColor.gray6,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
            ),
            builder: (BuildContext context) {
              return StatefulBuilder(
                builder: (BuildContext context,
                    void Function(void Function()) setState) {
                  return Container(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 16,
                        ),
                        Text(
                          'Selectionner un numero de ${contact.displayName}',
                          style: TextStyle(color: AppColor.gray3),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Container(
                          constraints: new BoxConstraints(
                            maxHeight: MediaQuery.of(context).size.height /
                                4.0 *
                                3.0, //this height is not contain `Text("Just a title")`'s height.
                          ),
                          child: ListView(
                            physics: BouncingScrollPhysics(),
                            shrinkWrap: true,
                            children: contact.phones!
                                .map(
                                  (item) => ListTile(
                                    dense: true,
                                    title: Text(
                                      item.value ?? '',
                                      style: TextStyle(fontSize: 14),
                                    ),
                                    onTap: () {
                                      setState(() {
                                        phoneCtrller.text = item.value!;
                                        Navigator.pop(context);
                                      });
                                    },
                                    trailing: Text(
                                      item.label ?? '',
                                      style: TextStyle(color: AppColor.gray3),
                                    ),
                                  ),
                                )
                                .toList(),
                          ),
                        ),
                        ListTile(
                          title:
                              Text('Annuler', style: TextStyle(fontSize: 16)),
                          onTap: () {
                            Navigator.pop(context);
                          },
                          dense: true,
                        ),
                      ],
                    ),
                  );
                },
              );
            },
          );
        }
      } catch (e) {
        print(e.toString());
      }
    } else {
      await Permission.contacts.request();
    }
  }
}

// https://drive.google.com/file/d/153GumshuU0ED-OaFs5JUUodTnnSaSzR7/view?usp=sharing