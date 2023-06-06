import 'package:flutter/material.dart';

import '../../../models/table_group/table_group_model.dart';
import 'table_group_item.dart';

class TableGroups extends StatelessWidget {
  const TableGroups({
    Key? key,
    required this.tableGroups,
    required this.onChangeGroup,
    required this.selectedTableGroupId,
  }) : super(key: key);

  final List<TableGroupModel> tableGroups;
  final Function(int) onChangeGroup;
  final int selectedTableGroupId;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: tableGroups
            .map(
              (item) => InkWell(
                onTap: () {
                  onChangeGroup(item.id);
                },
                child: TableGroupItem(
                  isSelected: item.id == selectedTableGroupId,
                  tableGroup: item,
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
