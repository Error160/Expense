import 'package:expenses/model/expenses.dart';
import 'package:expenses/widgets/expanses_list/expanses_list.dart';
import 'package:expenses/widgets/new_expanse.dart';
import 'package:flutter/material.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> expaneses = [
    Expense(
        title: "BreakFast",
        amount: 20,
        date: DateTime.now(),
        catgetory: Catgetory.food),
    Expense(
        title: "Picnic",
        amount: 120,
        date: DateTime.now(),
        catgetory: Catgetory.travel),
  ];
  void addExpenses(Expense expense) {
    setState(() {
      expaneses.add(expense);
    });
  }

  void removeExpenses(Expense expense) {
    setState(() {
      expaneses.remove(expense);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Expenses"),
        actions: [
          IconButton(
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (ctx) => NewExpanse(
                  onAddExpense: addExpenses,
                ),
              );
            },
            icon: const Icon(Icons.add),
          )
        ],
      ),
      body: ExpensesList(expaneses: expaneses),
    );
  }
}
