import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pcassa_retail_mobile/constants/app_settings.dart';
import 'package:pcassa_retail_mobile/constants/context_varebale.dart';
import 'package:pcassa_retail_mobile/constants/custom_icons.dart';
import 'package:pcassa_retail_mobile/store/RemaindingTradeable/remainding_tradeable.dart';
import 'package:pcassa_retail_mobile/themes/app_colors.dart';
import 'package:pcassa_retail_mobile/widgets/custom_app_bar.dart';
import 'package:pcassa_retail_mobile/widgets/custom_button.dart';

class RemainingTradeable extends StatefulWidget {
  RemainingTradeable({super.key});

  @override
  State<RemainingTradeable> createState() => _RemainingTradeableState();
}

class _RemainingTradeableState extends State<RemainingTradeable> {
  String _scanTxt = "";

  final textController = TextEditingController();
  Future<String> scanCode() async {
    String scanRes;
    try {
      scanRes = await FlutterBarcodeScanner.scanBarcode(
          '#28386a', 'Cancel', true, ScanMode.BARCODE);
      print("hhh $scanRes");
      if (scanRes != "-1") {
        remainding_tradeableState.onSearchProducts(barCode: scanRes);
      } else {
        null;
      }

      return scanRes;
    } catch (e) {
      AppSettings.toast(text: "error".tr());
      return "";
    }
  }

  void dispose() {
    super.dispose();
  }

  final remainding_tradeableState = RemaindingTradeable();

  @override
  Widget build(BuildContext context) {
    bool darkModeOn = MyUtility(context).brightness == Brightness.dark;

    return Scaffold(
        appBar: CustomAppBar(
          title: 'remaining_Tradeable'.tr(),
        ),

        body: SafeArea(
            child: Padding(
          padding:
              const EdgeInsets.only(bottom: 20, left: 16, right: 16, top: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(children: [
                Row(
                  children: [
                    Expanded(
                      flex: 5,
                      child: TextField(
                        //focusNode: OrderScreen.myFocusNode,
                        // textCapitalization: TextCapitalization.characters,
                        // onChanged: (value) {
                        //   //basketState.textValue = value;
                        // },
                        controller: textController,
                        //style: TextStyle(color: AppColors.black),
                        keyboardType: TextInputType.number,

                        decoration: InputDecoration(
                          filled: false,
                          fillColor: AppColors.white,
                          focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(width: 1, color:darkModeOn? Colors.white:AppColors.mediumGray),
                              borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(0),
                                  topRight: Radius.circular(0))
                              //BorderRadius.circular(4.0),
                              ),
                          enabledBorder: OutlineInputBorder(
                              borderSide:  BorderSide(
                                  width: 2, color:darkModeOn? Colors.white:AppColors.mediumGray),
                              borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(0),
                                  topRight: Radius.circular(0))),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        width: 100,
                        color:darkModeOn? Colors.black26:AppColors.darkPurple,
                        //decoration: BoxDecoration(

                        child: IconButton(
                          onPressed: () {
                            remainding_tradeableState.onSearchProducts(
                                barCode: textController.text);
                          },
                          icon: Icon(Icons.search,
                              size: 30, color: AppColors.white),
                        ),
                      ),
                    )
                  ],
                ),
                IconButton(
                  onPressed: scanCode,
                  icon: SvgPicture.asset(CustomIcons.scan,
                      width: 35,
                      height: 35,
                      color: darkModeOn == false
                          ? AppColors.darkGray
                          : AppColors.white,
                      semanticsLabel: 'Label'),
                ),
                Observer(
                  builder: (context) =>
                      remainding_tradeableState.searchProducts.isEmpty
                          ? Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: 50,
                                ),
                                Text(
                                  "empty_product".tr(),
                                  style: TextStyle(
                                    color: darkModeOn == false
                                        ? AppColors.darkGray
                                        : AppColors.white,
                                  ),
                                )
                              ],
                            )
                          : SizedBox(),
                )
              ]),
              SizedBox(height: 50),
              Container(
                width: MyUtility(context).width,
                decoration: BoxDecoration(
                    // color: Colors.amber,
                    ),
                child: Observer(builder: (context) {
                  return ListView.builder(
                      itemCount:
                          remainding_tradeableState.searchProducts.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        final item =
                            remainding_tradeableState.searchProducts[index];

                        return Padding(
                          padding: const EdgeInsets.only(bottom: 5),
                          child: Card(
                            elevation: 2,
                            child: ListTile(
                              trailing: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("${item.quantity}",
                                      style: const TextStyle(
                                          color: AppColors.gray)),
                                  Text("${item.ed_izm}",
                                      style: const TextStyle(
                                          color: AppColors.gray)),
                                ],
                              ),
                              subtitle: Text("${item.sklname}",
                                  style:
                                      const TextStyle(color: AppColors.gray)),
                              title: Text("${item.name}",
                                  style:
                                      const TextStyle(color: AppColors.gray)),
                            ),
                            // /pahest anun
                            // //anun
                            // quantiti
                            // //code
                          ),
                        );
                      });
                }),
              ),
            ],
          ),
        )));
  }
}
