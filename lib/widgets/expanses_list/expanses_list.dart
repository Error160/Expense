import 'package:expenses/model/expenses.dart';
import 'package:expenses/widgets/expanses_list/expanses_item.dart';
import 'package:flutter/material.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({
    super.key,
    required this.expaneses,
  });

  final List<Expense> expaneses;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) => Dismissible(
        key: ValueKey(expaneses[index]),
        child: ExpenseItem(
          expense: expaneses[index],
        ),
        onDismissed: (direction) => expaneses.remove(expaneses[index]),
      ),
      itemCount: expaneses.length,
    );
  }
}
