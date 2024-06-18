import 'package:flutter/material.dart';
import "package:uuid/uuid.dart";
import 'package:intl/intl.dart';

final dateFormat = DateFormat.yMd();
const uuid = Uuid();

enum Catgetory { food, travel, rent }

const catgetoryIcons = {
  Catgetory.food: (Icons.lunch_dining),
  Catgetory.rent: (Icons.price_change),
  Catgetory.travel: (Icons.travel_explore),
};

class Expense {
  final Catgetory catgetory;
  final String id;
  final String title;
  final double amount;
  final DateTime date;

  Expense({
    required this.catgetory,
    required this.title,
    required this.amount,
    required this.date,
  }) : id = uuid.v4();

  String get formattedDate {
    return dateFormat.format(date);
  }
}
