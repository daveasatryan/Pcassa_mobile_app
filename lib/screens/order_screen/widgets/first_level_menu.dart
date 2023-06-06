import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

import '../../../models/category_model/category_model.dart';
import '../../../store/services_state/services_state.dart';
import '../../../themes/app_colors.dart';
import '../../../widgets/custom_button.dart';

class MenuItems extends StatefulWidget {
  const MenuItems({
    Key? key,
  }) : super(key: key);

  @override
  State<MenuItems> createState() => _MenuItemsState();
}

class _MenuItemsState extends State<MenuItems> {
  final servicesState = GetIt.I<ServicesState>();
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        scrollDirection: Axis.horizontal,
        child: Observer(
          builder: (_) => Row(
            children: servicesState.categoriesFirstLevel
                .map(
                  (category) => CustomButton(
                    onTap: () {
                      onTap(category);
                    },
                    backgroundColor:
                        category.guid == servicesState.selectedMainCategoryId
                            ? AppColors.purple
                            : AppColors.gray,
                    foregroundColor: AppColors.white,
                    child: Text(
                      category.caption!,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                    ),
                  ),
                )
                .toList(),
          ),
        ),
      ),
    );
  }

  void onTap(CategoryModel selectedMainCategory) {
    servicesState.onFilterCategory(selectedMainCategory);
  }
}
