import 'package:expenses/model/expenses.dart';
import 'package:flutter/material.dart';

class ExpenseItem extends StatelessWidget {
  final Expense expense;
  const ExpenseItem({super.key, required this.expense});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20),
        child: Column(
          children: [
            Text("Title : ${expense.title}"),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Row(
                children: [
                  Text("\$${expense.amount.toStringAsFixed(2)}"),
                  const Spacer(),
                  Icon(catgetoryIcons[expense.catgetory]),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(expense.formattedDate)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
