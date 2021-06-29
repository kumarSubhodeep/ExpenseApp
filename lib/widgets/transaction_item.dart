import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personal_enpenses/model/transaction.dart';

class TransactionItem extends StatelessWidget {
  const TransactionItem({
    Key key,
    @required this.transaction,
    @required this.deleteTx,
  }) : super(key: key);

  final Transaction transaction;
  final Function deleteTx;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shadowColor: Colors.black45,
      margin: EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 5,
      ),
      child: ListTile(
        leading: CircleAvatar(
          radius: 30,
          child: Padding(
            padding: EdgeInsets.all(6),
            child: FittedBox(child: Text('₹ ${transaction.amount}')),
          ),
        ),
        title: Text(
          transaction.title,
          // ignore: deprecated_member_use
          style: Theme.of(context).textTheme.title,
        ),
        subtitle: Text(
          DateFormat.yMMMd().format(transaction.date),
        ),
        trailing: MediaQuery.of(context).size.width > 360
            // ignore: deprecated_member_use
            ? FlatButton.icon(
                onPressed: () => deleteTx(transaction.id),
                icon: Icon(Icons.delete),
                textColor: Theme.of(context).errorColor,
                label: Text('Delete'),
              )
            : IconButton(
                icon: Icon(Icons.delete),
                onPressed: () => deleteTx(transaction.id),
                color: Theme.of(context).errorColor,
              ),
      ),
    );
  }
}
