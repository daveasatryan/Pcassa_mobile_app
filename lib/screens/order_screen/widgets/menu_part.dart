import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

import '../../../constants/custom_icons.dart';
import '../../../models/category_model/category_model.dart';
import '../../../models/menu_abstract_model/menu_abstract_model.dart';
import '../../../models/product_model/product_model.dart';
import '../../../popups/modifier_modal.dart';
import '../../../store/basket_state/basket_state.dart';
import '../../../store/services_state/services_state.dart';
import '../../../themes/app_colors.dart';
import '../../../widgets/custom_button.dart';
import 'first_level_menu.dart';

class MenuPart extends StatefulWidget {
  const MenuPart({Key? key}) : super(key: key);

  @override
  State<MenuPart> createState() => _MenuPartState();
}

class _MenuPartState extends State<MenuPart> {
  final servicesState = GetIt.I<ServicesState>();
  final basketState = GetIt.I<BasketState>();

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => Column(
        children: [
          // const MenuItems(),
          const SizedBox(height: 4),
          if (servicesState.selectedSubCategory != null)
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Row(
                  children: [
                    Column(
                      children: [
                        Expanded(
                          flex: 3,
                          child: CustomButton(
                            onTap: onBack,
                            //backgroundColor: AppColors.darkPurple,
                            child: const Icon(
                              CustomIcons.arrowLeft,
                              color: AppColors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(width: 2),
                    Expanded(
                      flex: 6,
                      child: Container(
                        alignment: Alignment.center,
                        width: double.infinity,
                        height: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: AppColors.darkPurple,
                        ),
                        child: Text(
                          servicesState.selectedSubCategory!.caption!,
                          style: Theme.of(context).textTheme.headline1,
                          textAlign: TextAlign.center,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          const SizedBox(height: 7),
          Expanded(
            flex: 4,
            child: GridView.count(
              primary: false,
              padding: const EdgeInsets.symmetric(horizontal: 8),
              physics: const BouncingScrollPhysics(),
              childAspectRatio: 1.6,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
              crossAxisCount: 3,
              children: [
                for (var i = 0; i < servicesState.searchMenuItems.length; i++)
                  CustomButton(
                    onTap: () {
                      onTap(
                        context: context,
                        item: servicesState.searchMenuItems[i],
                      );
                    },
                    padding: const EdgeInsets.all(12),
                    backgroundColor: servicesState.searchMenuItems[i].isProduct
                        ? AppColors.lightPurple
                        : AppColors.purple,
                    foregroundColor: servicesState.searchMenuItems[i].isProduct
                        ? AppColors.black
                        : AppColors.white,
                    child: Text(
                      servicesState.searchMenuItems[i].isProduct
                          ? (servicesState.searchMenuItems[i] as ProductModel)
                              .name!
                          : (servicesState.searchMenuItems[i] as CategoryModel)
                              .caption!,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void onBack() {
    if (servicesState.selectedSubCategory!.isroot == 1) {
      final findParent = servicesState.categories.firstWhere((category) =>
          category.guid == servicesState.selectedSubCategory!.parentguid);

      servicesState.onFilterCategory(findParent);
    }
  }

  void onTap({
    required BuildContext context,
    required MenuAbstractModel item,
  }) {
    if (item.isProduct) {
      //  basketState.basket.clear();
      print(item);
      final product = item as ProductModel;
      basketState.onAddToBasket(product, 1);
      if (product.modifrequired && product.guid_mod!.isNotEmpty) {
        onShowModifiersModal(context: context);
      }
    } else {
      servicesState.onFilterCategory(item as CategoryModel);
    }
  }
}
