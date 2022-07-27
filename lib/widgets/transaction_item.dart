import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transactions.dart';

class TransactionItem extends StatefulWidget {
  const TransactionItem({
    Key? key,
    required this.transaction,
    required this.deleteTransactionFun,
  }) : super(key: key);

  final Transactions transaction;
  final Function deleteTransactionFun;

  @override
  State<TransactionItem> createState() => _TransactionItemState();
}

class _TransactionItemState extends State<TransactionItem> {
  late Color _bgColor;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    const availableColors = [
      Colors.red,
      Colors.blue,
      Colors.black,
      Colors.purple,
    ];

    _bgColor = availableColors[Random().nextInt(4)];
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.symmetric(horizontal: 5, vertical: 8),
      child: ListTile(
        title: Text(
          widget.transaction.title!,
          style: Theme.of(context).textTheme.headline6,
        ),
        subtitle: Text(DateFormat.yMMMd().format(widget.transaction.date!)),
        leading: CircleAvatar(
          //backgroundColor: Theme.of(context).primaryColor,
          backgroundColor: _bgColor,
          radius: 30,
          child: FittedBox(
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                '\$ ${widget.transaction.amount}',
                style: Theme.of(context).textTheme.headline5,
              ),
            ),
          ),
        ),
        // leading: Container(
        //   height: 60,
        //   width: 60,
        //   decoration: BoxDecoration(
        //     color: Theme.of(context).primaryColor,
        //     shape: BoxShape.circle,
        //   ),
        //   child: FittedBox(
        //     child: Padding(
        //       padding: EdgeInsets.all(8.0),
        //       child: Text(
        //         '\$ ${transactions[index].amount}',
        //         style: Theme.of(context).textTheme.headline5,
        //       ),
        //     ),
        //   ),
        // ),
        trailing: MediaQuery.of(context).size.width > 560
            ? TextButton.icon(
                onPressed: () {
                  widget.deleteTransactionFun(widget.transaction.id);
                },
                icon: Icon(
                  Icons.delete,
                  color: Theme.of(context).errorColor,
                ),
                label: Text(
                  'Delete',
                  style: TextStyle(color: Theme.of(context).errorColor),
                ),
              )
            : IconButton(
                onPressed: () {
                  widget.deleteTransactionFun(widget.transaction.id);
                },
                icon: Icon(
                  Icons.delete,
                  color: Theme.of(context).errorColor,
                ),
              ),
      ),
    );
  }
}
