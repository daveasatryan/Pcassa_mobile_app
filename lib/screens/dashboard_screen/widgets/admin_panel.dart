import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

import '../../../constants/custom_icons.dart';
import '../../../router.gr.dart';
import '../../../services.dart';
import '../../../store/services_state/services_state.dart';
import '../../../themes/app_colors.dart';
import '../../../utils/ui_utils.dart';
import '../../../widgets/custom_button.dart';

class AdminPanel extends StatelessWidget {
  const AdminPanel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        boxShadow: boxShadow,
      ),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 24),
              child: InkWell(
                child: const Icon(
                  CustomIcons.dashboard,
                  size: 48,
                ),
                onTap: () => router.push(AdminRoute()),
              ),
            ),
            Observer(
              builder: (_) => Row(
                children: [
                  CustomButton(
                    onTap: () {
                      GetIt.I<ServicesState>().isDarkMode = true;
                    },
                    padding: const EdgeInsets.all(18),
                    backgroundColor: GetIt.I<ServicesState>().isDarkMode
                        ? AppColors.purple
                        : AppColors.mediumGray,
                    child: Icon(
                      CustomIcons.sun,
                      color: GetIt.I<ServicesState>().isDarkMode
                          ? AppColors.white
                          : AppColors.gray,
                    ),
                  ),
                  const SizedBox(width: 4),
                  CustomButton(
                    onTap: () {
                      GetIt.I<ServicesState>().isDarkMode = false;
                    },
                    padding: const EdgeInsets.all(18),
                    backgroundColor: !GetIt.I<ServicesState>().isDarkMode
                        ? AppColors.purple
                        : AppColors.mediumGray,
                    child: Icon(
                      CustomIcons.moon,
                      color: !GetIt.I<ServicesState>().isDarkMode
                          ? AppColors.white
                          : AppColors.gray,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
