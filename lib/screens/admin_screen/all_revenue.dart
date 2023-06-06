import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:pcassa_retail_mobile/constants/context_varebale.dart';
import 'package:pcassa_retail_mobile/themes/app_colors.dart';
import 'package:pcassa_retail_mobile/widgets/custom_app_bar.dart';
import 'package:pcassa_retail_mobile/widgets/custom_button.dart';

class AllRevenue extends StatefulWidget {
  AllRevenue(
      {super.key, required this.sumValets, required, required this.nameValets});
  DateTime _now = DateTime.now();
  List<String> nameValets;
  List<int> sumValets;
  @override
  State<AllRevenue> createState() => _AllRevenueState();
}

class _AllRevenueState extends State<AllRevenue> {
  int amount = 0;
  @override
  void dispose() {
    amount = 0;
    widget.nameValets.clear();
    widget.sumValets.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool darkModeOn = MyUtility(context).brightness == Brightness.dark;

    for (int i = 0; i < widget.sumValets.length; i++) {
      amount += widget.sumValets[i];
    }

    return Scaffold(
      appBar: CustomAppBar(
        title: "TotalRevenues".tr(),
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
                    Container(
                      height: MediaQuery.of(context).size.height / 10,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 15),
                            child: Text(
                              "totalRevenues".tr(),
                              style: TextStyle(
                                  color: darkModeOn == false
                                      ? AppColors.darkGray
                                      : AppColors.white,
                                  fontSize: 16),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 15),
                            child: Text(
                              amount.toString(),
                              style: TextStyle(
                                  color: darkModeOn == false
                                      ? AppColors.darkGray
                                      : AppColors.white,
                                  fontSize: 19),
                            ),
                          ),
                        ],
                      ),
                    ),
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 15),
                                  child: Text(
                                    "CurrencyType".tr(),
                                    style: TextStyle(
                                        color: darkModeOn
                                            ? AppColors.white
                                            : AppColors.darkGray,
                                        fontSize: 17),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 15),
                                  child: Text(
                                    "sum".tr(),
                                    style: TextStyle(
                                        color: darkModeOn
                                            ? AppColors.white
                                            : AppColors.darkGray,
                                        fontSize: 17),
                                  ),
                                ),
                              ],
                            )
                            // title: Text("midd"),
                            // trailing: Text("right"),

                            ),
                        SizedBox(
                          height: 5,
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height / 1.9,
                          width: MediaQuery.of(context).size.width,
                          child: ListView.builder(
                            itemCount: widget.nameValets.length,
                            itemBuilder: (context, index) {
                              return Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 15),
                                    child: Container(
                                      alignment: Alignment.center,
                                      child: Text(
                                        "${widget.nameValets[index]}",
                                        style: TextStyle(
                                            color: darkModeOn == false
                                                ? AppColors.darkGray
                                                : AppColors.white,
                                            fontSize: 17),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 15),
                                    child: Container(
                                      alignment: Alignment.center,
                                      child: Text(
                                        "${widget.sumValets[index]}",
                                        style: TextStyle(
                                            color: darkModeOn == false
                                                ? AppColors.darkGray
                                                : AppColors.white,
                                            fontSize: 17),
                                      ),
                                    ),
                                  ),
                                ],
                              );
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
