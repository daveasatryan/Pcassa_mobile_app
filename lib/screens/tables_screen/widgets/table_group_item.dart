import 'package:flutter/material.dart';

import '../../../models/table_group/table_group_model.dart';
import '../../../themes/app_colors.dart';

class TableGroupItem extends StatelessWidget {
  const TableGroupItem({
    Key? key,
    required this.tableGroup,
    this.isSelected = false,
  }) : super(key: key);

  final bool isSelected;
  final TableGroupModel tableGroup;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(6),
      padding: const EdgeInsets.only(bottom: 7, left: 4, right: 4),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: isSelected ? AppColors.purple : AppColors.mediumGray,
            width: 3,
          ),
        ),
      ),
      child: Text(
        tableGroup.name,
        style: Theme.of(context).textTheme.bodyText2,
      ),
    );
  }
}
