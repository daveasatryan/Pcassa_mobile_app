import 'dart:math';

import 'package:dropdown_search/dropdown_search.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:pcassa_retail_mobile/constants/app_settings.dart';
import 'package:pcassa_retail_mobile/constants/context_varebale.dart';
import 'package:pcassa_retail_mobile/store/auth/auth_state.dart';
import 'package:pcassa_retail_mobile/themes/app_colors.dart';
import 'package:pcassa_retail_mobile/widgets/custom_button.dart';

import '../../../store/Finance_operation/finance_operation_state.dart';

class Collaction extends StatefulWidget {
  Collaction({super.key});

  @override
  State<Collaction> createState() => _CollactionState();
}

class _CollactionState extends State<Collaction>
    with SingleTickerProviderStateMixin {
  final sumController = TextEditingController();

  final descriptionController = TextEditingController();

  final finance_operation_state = Finance_operation_state();

  final authState = GetIt.I<AuthState>();

  bool errorColorSum = false;
  bool errorColorDesc = false;
  String sumHintText = "sum".tr();
  int? code;
  String name = "";
  int toggle = 0;
  AnimationController? _con;
  TextEditingController? _textEditingController;
  @override
  void initState() {
    finance_operation_state.getSPRData();
    super.initState();
    _textEditingController = TextEditingController();
    _con = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 375),
    );
  }

  @override
  Widget build(BuildContext context) {
    bool darkModeOn = MyUtility(context).brightness == Brightness.dark;
    return Container(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Column(
        children: [
          TextField(
            onChanged: (value) {
              if (value.isNotEmpty) {
                setState(() {
                  errorColorSum = false;
                });
              } else {
                setState(() {
                  errorColorSum = true;
                });
              }
            },
            controller: sumController,
            //onChanged: (value) {}
            keyboardType: TextInputType.number,
            //controller: controllerText,
            decoration: InputDecoration(
              filled: true, //<-- SEE HERE
              fillColor:
                  darkModeOn == false ? AppColors.white : AppColors.darkGray,
              hintText: "sum".tr(),
              hintStyle: TextStyle(
                  color: darkModeOn ? AppColors.white : Colors.black26),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    width: 1,
                    color: errorColorSum == false
                        ? darkModeOn == false
                            ? AppColors.primaryColor
                            : AppColors.purple
                        : AppColors.red),
                borderRadius: BorderRadius.circular(4.0),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    width: 1,
                    color: errorColorSum == false
                        ? darkModeOn == false
                            ? AppColors.mediumGray
                            : AppColors.white
                        : AppColors.red),
                borderRadius: BorderRadius.circular(4.0),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          TextField(
            onChanged: (value) {
              if (value.isNotEmpty) {
                setState(() {
                  errorColorDesc = false;
                });
              } else {
                setState(() {
                  errorColorDesc = true;
                });
              }
            },
            controller: descriptionController,
            //onChanged: (value) {}
            keyboardType: TextInputType.text,
            //controller: controllerText,
            decoration: InputDecoration(
              filled: true, //<-- SEE HERE
              fillColor:
                  darkModeOn == false ? AppColors.white : AppColors.darkGray,
              hintText: "cause".tr(),
              hintStyle: TextStyle(
                  color: darkModeOn ? AppColors.white : Colors.black26),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    width: 1.2,
                    color: errorColorDesc == false
                        ? darkModeOn == false
                            ? AppColors.primaryColor
                            : AppColors.purple
                        : AppColors.red),
                borderRadius: BorderRadius.circular(4.0),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    width: 0.9,
                    color: errorColorDesc == false
                        ? darkModeOn == false
                            ? AppColors.mediumGray
                            : AppColors.white
                        : AppColors.red),
                borderRadius: BorderRadius.circular(4.0),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Observer(builder: (context) {
            return DropdownSearch(
              showClearButton: true,
              mode: Mode.BOTTOM_SHEET,
              showSelectedItems: true,
              items: SPRlist(),

              dropdownSearchDecoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      width: 1,
                      color: darkModeOn ? AppColors.white : AppColors.darkGray),
                  borderRadius: BorderRadius.circular(4.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      width: 1,
                      color:
                          darkModeOn ? AppColors.white : AppColors.mediumGray),
                  borderRadius: BorderRadius.circular(4.0),
                ),
                labelText: "select_contragent".tr(),
                labelStyle: TextStyle(color:darkModeOn? AppColors.white:Colors.black26),
                border: OutlineInputBorder(
                  borderSide:
                      const BorderSide(width: 1, color: AppColors.purple),
                  borderRadius: BorderRadius.circular(4.0),
                ),
                fillColor:
                    darkModeOn == false ? AppColors.white : AppColors.darkGray,
              ),
              // popupItemDisabled: isItemDisabled,
              onChanged: itemSelectionChanged,
              //selectedItem: "",

              showSearchBox: true,
              searchFieldProps: TextFieldProps(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                  hintText: "search".tr(),
                  hintStyle: TextStyle(
                    color:
                        darkModeOn == true ? AppColors.white : AppColors.gray,
                  ),
                  filled: true,
                  fillColor: darkModeOn == false
                      ? AppColors.white
                      : AppColors.darkGray,
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(width: 1, color: AppColors.purple),
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(width: 2, color: AppColors.purple),
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                ),
                cursorColor: AppColors.purple,
              ),
            );
          }),
          SizedBox(
            height: 20,
          ),
          CustomButton(
            backgroundColor:
                darkModeOn == false ? AppColors.mediumGray : Colors.black26,
            minimumSize: const Size(double.infinity, 60),
            //backgroundColor: AppColors.primaryColor,
            //overlayColor: AppColors.darkPurple,
            onTap: () async {
              var now = new DateTime.now();
              var formatter = new DateFormat('dd.MM.yyyy');
              String formattedDate = formatter.format(now);
              print(formattedDate);
              if (sumController.text.isNotEmpty &&
                  descriptionController.text.isNotEmpty) {
                final sumadouble = double.parse(sumController.text);
                final sumaint = int.parse(sumController.text);

                await finance_operation_state.sendFinanceOperation(
                    authState.info!.n_smena,
                    sumadouble,
                    descriptionController.text,
                    0,
                    context,
                    name != "" ? name : null,
                    name != null ? formattedDate : null,
                    name != null ? sumaint : null,
                    code != null ? code : null);
                setState(() {
                  errorColorDesc = false;
                  errorColorSum = false;
                });
              } else {
                if (sumController.text.isEmpty) {
                  setState(() {
                    errorColorSum = true;
                  });
                  if (descriptionController.text.isEmpty) {
                    setState(() {
                      errorColorDesc = true;
                    });
                  }
                }
                AppSettings.toast(text: "requiredfiled".tr());
              }
            },
            child: Text(
              "collection".tr(),
              style: Theme.of(context).textTheme.headline1!.copyWith(
                  color: darkModeOn ? AppColors.white : AppColors.darkGray),
            ),
          ),
        ],
      ),
    );
  }

  // bool isItemDisabled(String s) {
  //   //return s.startsWith('I');

  //   if (s.startsWith('I')) {
  //     return true;
  //   } else {
  //     return false;
  //   }
  // }

  List<String> SPRlist() {
    List<String> list = [];
    for (var i = 0; i < finance_operation_state.sprList.length; i++) {
      list.add(finance_operation_state.sprList[i].name!);
    }

    return list;
  }

  void itemSelectionChanged(String? s) {
    if (s == null) {
      name = "";
      code = null;
    }
    for (var i = 0; i < finance_operation_state.sprList.length; i++) {
      if (s == finance_operation_state.sprList[i].name) {
        name = finance_operation_state.sprList[i].name!;
        code = int.parse(finance_operation_state.sprList[i].kod!);

        print(name);
        print(code);
      }
    }
  }
}
