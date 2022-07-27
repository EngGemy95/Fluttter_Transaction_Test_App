import '../models/transactions.dart';
import '../widgets/chart_bar.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Chart extends StatelessWidget {
  List<Transactions> recentTransactions;

  Chart(this.recentTransactions);

  List<Map<String, Object>> get groupedTransactionValues {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index));
      //print(weekDay);
      var totalSum = 0.0;

      for (int position = 0; position < recentTransactions.length; position++) {
        if (recentTransactions[position].date!.day == weekDay.day &&
            recentTransactions[position].date!.month == weekDay.month &&
            recentTransactions[position].date!.year == weekDay.year) {
          totalSum += recentTransactions[position].amount!;
        }
      }

      return {
        'day': DateFormat.E().format(weekDay).substring(0, 1),
        'amount': totalSum.toStringAsFixed(2),
      };
    }).reversed.toList();
  }

  double get totalSpending {
    return groupedTransactionValues.fold(0.0, (previousValue, item) {
      return previousValue + double.parse((item['amount'] as String));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Padding(
        padding: EdgeInsets.all(5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: groupedTransactionValues.map((data) {
            return Flexible(
              fit: FlexFit.tight,
              child: ChartBar(
                data['day'] as String,
                double.parse(data['amount'] as String),
                totalSpending == 0.0
                    ? 0.0
                    : double.parse((data['amount'] as String)) / totalSpending,
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
