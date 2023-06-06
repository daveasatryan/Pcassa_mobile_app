import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:pcassa_retail_mobile/constants/context_varebale.dart';
import 'package:pcassa_retail_mobile/http/repositories/services_repository.dart';
import 'package:pcassa_retail_mobile/models/balance_casa_model/balanse_casa_model.dart';
import 'package:pcassa_retail_mobile/models/balance_casa_model/item_inkas.dart';
import 'package:pcassa_retail_mobile/store/valets_state/valets_state.dart';
import 'package:pcassa_retail_mobile/themes/app_colors.dart';
import 'package:pcassa_retail_mobile/widgets/custom_app_bar.dart';
import 'package:pcassa_retail_mobile/widgets/custom_button.dart';

class BalanceCasa extends StatefulWidget {
  BalanceCasa(
      {super.key,
      required this.amount,
      required this.sale,
      required this.inkassAmount,
      required this.vnesAmount,
      required this.inkasList,
      required this.vnesList});
  int amount;
  int sale;
  int inkassAmount;
  int vnesAmount;
  List<Item_inkas> inkasList;
  List<Item_inkas> vnesList;
  DateTime _now = DateTime.now();
  @override
  State<BalanceCasa> createState() => _BalanceCasaState();
}

class _BalanceCasaState extends State<BalanceCasa> {
  bool hideInkas = false;
  bool hideVnea = false;

  @override
  Widget build(BuildContext context) {
    bool isExpand = false;
    bool darkModeOn = MyUtility(context).brightness == Brightness.dark;
    return Scaffold(
      appBar: CustomAppBar(
        title: 'BalanceSheet'.tr(),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 30,
                      decoration: BoxDecoration(
                          color: darkModeOn
                              ? Colors.black26
                              : AppColors.mediumGray),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 15),
                            child: Text(
                                "${widget._now.day}/${widget._now.month}/${widget._now.year}   ${widget._now.hour}:${widget._now.minute}",
                                style: TextStyle(
                                    fontSize: 11,
                                    color: darkModeOn
                                        ? AppColors.white
                                        : AppColors.darkGray)),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      alignment: Alignment.center,
                      // height: MediaQuery.of(context).size.height / 10,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 15, right: 15),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              // mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                FittedBox(
                                  child: Text(
                                    "CashBalance".tr(),
                                    style: TextStyle(
                                        color: darkModeOn == false
                                            ? AppColors.darkGray
                                            : AppColors.white,
                                        fontSize: 20),
                                  ),
                                ),
                                FittedBox(
                                  child: Text(
                                    "cash".tr(),
                                    style: TextStyle(
                                        color: darkModeOn == false
                                            ? AppColors.darkGray
                                            : AppColors.white,
                                        fontSize: 20),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 15, right: 15),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              //mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                FittedBox(
                                  child: Text(
                                    "${widget.sale}",
                                    style: TextStyle(
                                        color: darkModeOn == false
                                            ? AppColors.darkGray
                                            : AppColors.white,
                                        fontSize: 22),
                                  ),
                                ),
                                FittedBox(
                                  child: Text(
                                    "${widget.amount}",
                                    style: TextStyle(
                                        color: darkModeOn == false
                                            ? AppColors.darkGray
                                            : AppColors.white,
                                        fontSize: 22),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        SizedBox(
                          height: 15,
                        ),
                        ExpansionTile(
                          initiallyExpanded: false,
                          iconColor: AppColors.white,
                          trailing: Icon(
                            Icons.keyboard_arrow_down_outlined,
                            color: darkModeOn
                                ? AppColors.white
                                : AppColors.darkGray,
                          ),
                          onExpansionChanged: (value) {
                            setState(() {
                              isExpand = value;
                            });
                          },
                          collapsedIconColor: darkModeOn
                              ? Colors.black26
                              : AppColors.mediumGray,
                          collapsedBackgroundColor: darkModeOn
                              ? Colors.black26
                              : AppColors.mediumGray,
                          backgroundColor:
                              darkModeOn ? Colors.black26 : AppColors.white,
                          title: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Collected".tr(),
                                  style: TextStyle(
                                      color: darkModeOn
                                          ? AppColors.white
                                          : AppColors.darkGray,
                                      fontSize: 18),
                                ),
                                Text(
                                  "${widget.inkassAmount}",
                                  style: TextStyle(
                                      color: darkModeOn
                                          ? AppColors.white
                                          : AppColors.darkGray,
                                      fontSize: 20),
                                ),
                              ]),
                          children: [
                            for (var i = 0; i < widget.inkasList.length; i++)
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 15),
                                    child: Container(
                                      width: MediaQuery.of(context).size.width /
                                          2.5,
                                      child: Text(
                                        "${widget.inkasList[i].description}",
                                        style: TextStyle(
                                            color: darkModeOn
                                                ? AppColors.white
                                                : AppColors.darkGray,
                                            fontSize: 16),
                                        maxLines: 3,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 15),
                                    child: Text(
                                      "${widget.inkasList[i].summa}",
                                      style: TextStyle(
                                          color: darkModeOn
                                              ? AppColors.white
                                              : AppColors.darkGray,
                                          fontSize: 17),
                                    ),
                                  ),
                                ],
                              ),
                            SizedBox(
                              height: 10,
                            )
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        ExpansionTile(
                          initiallyExpanded: false,
                          iconColor: AppColors.white,
                          trailing: Icon(
                            Icons.keyboard_arrow_down_outlined,
                            color: darkModeOn
                                ? AppColors.white
                                : AppColors.darkGray,
                          ),
                          onExpansionChanged: (value) {
                            setState(() {
                              isExpand = value;
                            });
                          },
                          collapsedIconColor: darkModeOn
                              ? Colors.black26
                              : AppColors.mediumGray,
                          collapsedBackgroundColor: darkModeOn
                              ? Colors.black26
                              : AppColors.mediumGray,
                          backgroundColor:
                              darkModeOn ? Colors.black26 : AppColors.white,
                          title: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Contributed".tr(),
                                  style: TextStyle(
                                      color: darkModeOn
                                          ? AppColors.white
                                          : AppColors.darkGray,
                                      fontSize: 18),
                                ),
                                Text(
                                  "${widget.vnesAmount}",
                                  style: TextStyle(
                                      color: darkModeOn
                                          ? AppColors.white
                                          : AppColors.darkGray,
                                      fontSize: 20),
                                ),
                              ]),
                          children: [
                            for (var i = 0; i < widget.vnesList.length; i++)
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 15, right: 15),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      width: MediaQuery.of(context).size.width /
                                          2.5,
                                      child: Text(
                                        "${widget.vnesList[i].description}",
                                        style: TextStyle(
                                            color: darkModeOn
                                                ? AppColors.white
                                                : AppColors.darkGray,
                                            fontSize: 16),
                                        maxLines: 3,
                                      ),
                                    ),
                                    Text(
                                      "${widget.vnesList[i].summa}",
                                      style: TextStyle(
                                          color: darkModeOn
                                              ? AppColors.white
                                              : AppColors.darkGray,
                                          fontSize: 17),
                                    ),
                                  ],
                                ),
                              ),
                            const SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ],
                ),
                Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: CustomButton(
                          backgroundColor: darkModeOn == true
                              ? Colors.black26
                              : AppColors.mediumGray,
                          foregroundColor: AppColors.white,
                          minimumSize: Size(double.infinity, 60),
                          child: FittedBox(
                              child: Text(
                            "print".tr(),
                            style: TextStyle(
                                color: darkModeOn
                                    ? AppColors.white
                                    : AppColors.darkGray,
                                fontSize: 18,
                                fontWeight: FontWeight.w600),
                          ))),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
