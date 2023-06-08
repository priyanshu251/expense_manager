import 'package:expense_manager/modals/expense.dart';
import 'package:expense_manager/widgets/expenses_list/expense_item.dart';
import 'package:flutter/material.dart';

class ExpenseList extends StatelessWidget {
  const ExpenseList(
      {super.key, required this.expenses, required this.onRemoveExpense});
  final void Function(Expense expense) onRemoveExpense;
  final List<Expense> expenses;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (context, index) => Dismissible(
        background: Container(
            color: Theme.of(context).colorScheme.error.withOpacity(0.75),
            margin: EdgeInsets.symmetric(
              horizontal: Theme.of(context).cardTheme.margin!.horizontal,
            )),
        key: ValueKey(expenses[index]),
        onDismissed: (direction) {
          onRemoveExpense(
              expenses[index]); //exp[enses is the list of object(modal) expense
        },
        child: ExpenseItem(expenses[index]),
      ),
    );
  }
}
