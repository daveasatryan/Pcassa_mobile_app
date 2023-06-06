import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pcassa_retail_mobile/constants/custom_icons.dart';

import '../models/table_model/table_model.dart';
import '../themes/app_colors.dart';

class ActiveTable extends StatelessWidget {
  const ActiveTable({
    Key? key,
    required this.onTap,
    required this.table,
  }) : super(key: key);
  final VoidCallback onTap;
  final TableModel table;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 5),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: table.status ? AppColors.darkPurple : AppColors.gray,
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Icon(
                      CustomIcons.table,
                      size: 36,
                      color: AppColors.white,
                    ),
                    const SizedBox(width: 12),
                    Text(
                      '${table.id}',
                      style: Theme.of(context).textTheme.headline1,
                    ),
                  ],
                ),
                Text(
                  DateFormat('yyyy-MM-dd HH:mm:ss').format(
                    table.date ?? DateTime.now(),
                  ),
                  style: Theme.of(context)
                      .textTheme
                      .headline4!
                      .copyWith(color: AppColors.white),
                ),
              ],
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${table.fio}',
                  style: Theme.of(context).textTheme.headline3,
                ),
                Text(
                  table.sum.toStringAsFixed(1),
                  style: Theme.of(context).textTheme.headline1,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
