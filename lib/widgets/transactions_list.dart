import '../widgets/transaction_item.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transactions.dart';

class TransactionsList extends StatelessWidget {
  final List<Transactions> transactions;
  final Function deleteTransactionFun;

  TransactionsList(this.transactions, this.deleteTransactionFun);

  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty
        ? LayoutBuilder(builder: (ctx, constraints) {
            return Column(
              children: [
                Text(
                  'No Transaction Added yet!',
                  style: Theme.of(context).textTheme.headline6,
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  height: constraints.maxHeight * 0.7,
                  child: Image.asset(
                    'assets/images/waiting.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            );
          })
        : ListView(
            children: transactions.map((tx) {
              return TransactionItem(
                  key: ValueKey(tx.id),
                  transaction: tx,
                  deleteTransactionFun: deleteTransactionFun);
            }).toList(),
          );
    // ListView.builder(
    //     itemBuilder: (ctx, index) {
    //       return TransactionItem(
    //           key: ValueKey(transactions[index].id),
    //           transaction: transactions[index],
    //           deleteTransactionFun: deleteTransactionFun);
    //       // return Card(
    //       //     child: Row(
    //       //   children: [
    //       //     Container(
    //       //       margin: const EdgeInsets.symmetric(
    //       //         horizontal: 10,
    //       //         vertical: 10,
    //       //       ),
    //       //       padding: const EdgeInsets.all(10),
    //       //       decoration: BoxDecoration(
    //       //         border: Border.all(
    //       //           color: Theme.of(context).primaryColor,
    //       //           width: 2,
    //       //         ),
    //       //       ),
    //       //       child: Text(
    //       //         '\$${transactions[index].amount?.toStringAsFixed(2)}',
    //       //         style: TextStyle(
    //       //           fontWeight: FontWeight.bold,
    //       //           color: Theme.of(context).primaryColor,
    //       //           fontSize: 20,
    //       //         ),
    //       //       ),
    //       //     ),
    //       //     Column(
    //       //       crossAxisAlignment: CrossAxisAlignment.start,
    //       //       children: [
    //       //         Text(
    //       //           transactions[index].title ?? '-',
    //       //           style: Theme.of(context).textTheme.headline6,
    //       //         ),
    //       //         Text(
    //       //           DateFormat('yyy-MM-dd')
    //       //               .format(transactions[index].date!),
    //       //           style: const TextStyle(
    //       //             color: Colors.grey,
    //       //           ),
    //       //         )
    //       //       ],
    //       //     ),
    //       //   ],
    //       // ),
    //       // );
    //     },
    //     itemCount: transactions.length,

    //     // children: transactions.map((tx) {
    //     //   return Card(
    //     //       child: Row(
    //     //     children: [
    //     //       Container(
    //     //         margin: const EdgeInsets.symmetric(
    //     //           horizontal: 10,
    //     //           vertical: 10,
    //     //         ),
    //     //         padding: const EdgeInsets.all(10),
    //     //         decoration: BoxDecoration(
    //     //           border: Border.all(
    //     //             color: Colors.purple,
    //     //             width: 2,
    //     //           ),
    //     //         ),
    //     //         child: Text(
    //     //           '\$${tx.amount}',
    //     //           style: const TextStyle(
    //     //             fontWeight: FontWeight.bold,
    //     //             color: Colors.purple,
    //     //             fontSize: 20,
    //     //           ),
    //     //         ),
    //     //       ),
    //     //       Column(
    //     //         crossAxisAlignment: CrossAxisAlignment.start,
    //     //         children: [
    //     //           Text(
    //     //             tx.title ?? '-',
    //     //             style: const TextStyle(
    //     //               fontSize: 16,
    //     //               fontWeight: FontWeight.bold,
    //     //             ),
    //     //           ),
    //     //           Text(
    //     //             DateFormat('yyy-MM-dd').format(tx.date!),
    //     //             style: const TextStyle(
    //     //               color: Colors.grey,
    //     //             ),
    //     //           )
    //     //         ],
    //     //       ),
    //     //     ],
    //     //   ));
    //     // }).toList(),
    //   );
  }
}
