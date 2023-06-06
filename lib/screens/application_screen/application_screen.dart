import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../constants/applications_type.dart';
import '../../themes/app_colors.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_text_field.dart';

class ApplicationScreen extends StatelessWidget {
  const ApplicationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: FocusScope.of(context).unfocus,
      child: Scaffold(
        body: Column(
          children: [
            CustomTextField(
              hintText: 'cause'.tr(),
            ),
            const SizedBox(height: 48),
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: ApplicationsType.values
                      .map(
                        (orderType) => Padding(
                          padding: const EdgeInsets.only(bottom: 24),
                          child: CustomButton(
                            onTap: () {},
                            minimumSize: const Size(360, 100),
                            // backgroundColor: AppColors.primaryColor,
                            //overlayColor: AppColors.darkPurple,
                            child: Text(
                              orderType.title.tr(),
                              style: Theme.of(context).textTheme.headline1,
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
