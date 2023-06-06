import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:pcassa_retail_mobile/constants/context_varebale.dart';
import 'package:pcassa_retail_mobile/models/All_change_model/items_model.dart';
import 'package:pcassa_retail_mobile/store/All_change/all_change_state.dart';
import 'package:pcassa_retail_mobile/themes/app_colors.dart';
import 'package:pcassa_retail_mobile/widgets/custom_app_bar.dart';
import 'package:pcassa_retail_mobile/widgets/custom_button.dart';

class AllChange extends StatefulWidget {
  AllChange({super.key, required this.item, required this.summa});
  List<ItemsModel> item;
  int summa;
  DateTime _now = DateTime.now();
  @override
  State<AllChange> createState() => _AllChangeState();
}

class _AllChangeState extends State<AllChange> {
  @override
  Widget build(BuildContext context) {
    bool darkModeOn = MyUtility(context).brightness == Brightness.dark;
    return Scaffold(
      appBar: CustomAppBar(
        title: 'ProductsSold'.tr(),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: SingleChildScrollView(
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
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: FittedBox(
                              child: Text(
                                  "${widget._now.day}/${widget._now.month}/${widget._now.year} ${widget._now.hour}:${widget._now.minute}",
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: darkModeOn
                                        ? AppColors.white
                                        : AppColors.darkGray,
                                  )),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height / 10,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 15),
                            child: Text(
                              "totalAmount".tr(),
                              style: TextStyle(
                                  color: darkModeOn == false
                                      ? AppColors.darkGray
                                      : AppColors.white,
                                  fontSize: 20),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 15),
                            child: Text(
                              "${widget.summa}",
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
                    Column(
                      children: [
                        Container(
                            padding: EdgeInsets.only(left: 16, right: 16),
                            width: MediaQuery.of(context).size.width,
                            height: 30,
                            decoration: BoxDecoration(
                                color: darkModeOn
                                    ? Colors.black26
                                    : AppColors.mediumGray),
                            child: Row(
                              // crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Container(
                                    alignment: Alignment.center,
                                    child: Text(
                                      "Name".tr(),
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          color: darkModeOn
                                              ? AppColors.white
                                              : AppColors.darkGray,
                                          fontSize: 17),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    alignment: Alignment.center,
                                    child: Text(
                                      "Qty".tr(),
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          color: darkModeOn
                                              ? AppColors.white
                                              : AppColors.darkGray,
                                          fontSize: 17),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    alignment: Alignment.center,
                                    child: Text(
                                      "sum".tr(),
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          color: darkModeOn
                                              ? AppColors.white
                                              : AppColors.darkGray,
                                          fontSize: 17),
                                    ),
                                  ),
                                ),
                              ],
                            )
                            // title: Text("midd"),
                            // trailing: Text("right"),

                            ),
                        const SizedBox(
                          height: 5,
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height / 2,
                          width: MediaQuery.of(context).size.width,
                          child: ListView.builder(
                            itemCount: widget.item.length,
                            itemBuilder: (context, index) {
                              return Container(
                                padding: EdgeInsets.only(left: 15, right: 15),
                                width: MediaQuery.of(context).size.width,
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Container(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              "${widget.item[index].name}",
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                  color: darkModeOn == false
                                                      ? AppColors.darkGray
                                                      : AppColors.white,
                                                  fontSize: 17),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              "${widget.item[index].Quantity}",
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                  color: darkModeOn == false
                                                      ? AppColors.darkGray
                                                      : AppColors.white,
                                                  fontSize: 17),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                        alignment: Alignment.center,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              "${widget.item[index].Amount}",
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                  color: darkModeOn == false
                                                      ? AppColors.darkGray
                                                      : AppColors.white,
                                                  fontSize: 17),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );

                              // Row(
                              //   crossAxisAlignment: CrossAxisAlignment.center,
                              //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                              //   children: [
                              //     Column(
                              //       crossAxisAlignment: CrossAxisAlignment.center,
                              //       mainAxisAlignment: ,
                              //       children: [
                              //         FittedBox(
                              //           child: Text(
                              //             "${widget.item[index].name}",
                              //             style: TextStyle(
                              //                 color: darkModeOn == false
                              //                     ? AppColors.darkGray
                              //                     : AppColors.white,
                              //                 fontSize: 17),
                              //           ),
                              //         ),
                              //       ],
                              //     ),
                              //     FittedBox(
                              //       child: Text(
                              //         "${widget.item[index].name}",
                              //         style: TextStyle(
                              //             color: darkModeOn == false
                              //                 ? AppColors.darkGray
                              //                 : AppColors.white,
                              //             fontSize: 17),
                              //       ),
                              //     ),
                              //     FittedBox(
                              //       child: Text(
                              //         "${widget.item[index].Quantity}",
                              //         style: TextStyle(
                              //             color: darkModeOn == false
                              //                 ? AppColors.darkGray
                              //                 : AppColors.white,
                              //             fontSize: 17),
                              //       ),
                              //     ),
                              //     FittedBox(
                              //       child: Text(
                              //         "${widget.item[index].Amount}",
                              //         style: TextStyle(
                              //             color: darkModeOn == false
                              //                 ? AppColors.darkGray
                              //                 : AppColors.white,
                              //             fontSize: 17),
                              //       ),
                              //     ),
                              //   ],
                              // );
                            },
                          ),
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
                          minimumSize: Size(double.infinity,
                              MediaQuery.of(context).size.height / 9),
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
