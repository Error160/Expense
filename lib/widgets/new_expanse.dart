import 'package:expenses/model/expenses.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewExpanse extends StatefulWidget {
  const NewExpanse({
    super.key,
    required this.onAddExpense,
  });

  final void Function(Expense expense) onAddExpense;
  @override
  State<NewExpanse> createState() => _NewExpanseState();
}

class _NewExpanseState extends State<NewExpanse> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();
  final formatter = DateFormat.yMd();
  Catgetory? _selectedCat;

  DateTime? _selectedDate;

  @override
  void dispose() {
    super.dispose();
    _titleController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          TextField(
            controller: _titleController,
            maxLength: 50,
            decoration: const InputDecoration(label: Text("Title")),
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _amountController,
                  maxLength: 50,
                  decoration: const InputDecoration(
                    label: Text("amount"),
                    prefixIcon: Icon(Icons.money),
                    prefixText: "\$",
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(_selectedDate == null
                        ? "no Selected Date"
                        : formatter.format(_selectedDate!)),
                    IconButton(
                        onPressed: () async {
                          final now = DateTime.now();
                          final start =
                              DateTime(now.year - 1, now.month, now.day);
                          _selectedDate = await showDatePicker(
                              context: context,
                              firstDate: start,
                              lastDate: now);
                          setState(() {
                            _selectedDate;
                          });
                        },
                        icon: const Icon(Icons.date_range))
                  ],
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              children: [
                DropdownButton(
                    value: _selectedCat,
                    items: Catgetory.values
                        .map(
                          (e) => DropdownMenuItem(
                            value: e,
                            child: Text(e.name),
                          ),
                        )
                        .toList(),
                    onChanged: (newCat) {
                      if (newCat == null) {
                        return;
                      }
                      setState(() {
                        _selectedCat = newCat as Catgetory?;
                      });
                    }),
                const Spacer(),
                ElevatedButton(
                    onPressed: () {
                      double? amount = double.tryParse(_amountController.text);
                      bool isAmountVaild = amount != null;

                      if (!isAmountVaild ||
                          _titleController.text.trim().isEmpty ||
                          _selectedDate == null ||
                          _selectedCat == null) {
                        showDialog(
                          context: context,
                          builder: (cxt) => AlertDialog(
                            title: const Text("Error"),
                            content: const Text("Your Data Is Not Vaild"),
                            actions: [
                              ElevatedButton(
                                  onPressed: () {
                                    Navigator.pop(cxt);
                                  },
                                  child: const Text("Okay"))
                            ],
                          ),
                        );
                      } else {
                        widget.onAddExpense(Expense(
                            catgetory: _selectedCat!,
                            title: _titleController.text,
                            amount: amount,
                            date: _selectedDate!));
                        Navigator.pop(context);
                      }
                    },
                    child: const Text("Add")),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("Cancel"),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
