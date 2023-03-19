import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function addtx;
  const NewTransaction(this.addtx, {super.key});

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  DateTime? userdate;

  void onSubmit() {
    final titlesub = titleController.text;
    final amountsub = int.parse(amountController.text);
    if (titlesub.isEmpty || amountsub <= 0 || userdate == null) {
      return;
    }
    widget.addtx(titlesub, amountsub, userdate);
    Navigator.pop(context, true);
  }

  void datepicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2023),
      lastDate: DateTime.now(),
    ).then((datepicked) {
      if (datepicked == null) {
        return;
      }
      setState(() {
        userdate = datepicked;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListView(
        children: [
          const SizedBox(height: 15),
          TextFormField(
            decoration: const InputDecoration(labelText: "Title"),
            controller: titleController,
            onChanged: (_) => onSubmit,
          ),
          TextFormField(
            decoration: const InputDecoration(labelText: "Amount"),
            controller: amountController,
            keyboardType: TextInputType.number,
            onChanged: (_) => onSubmit,
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: Text(
                  userdate == null
                      ? "Date is Empty !"
                      : "Date Picked : ${DateFormat.yMd().format(userdate!)}",
                ),
              ),
              TextButton(
                  onPressed: datepicker,
                  child: const Text(
                    "Date",
                    style: TextStyle(fontSize: 18),
                  )),
            ],
          ),
          const SizedBox(height: 15),
          Card(
            elevation: 10,
            child: TextButton(
              onPressed: onSubmit,
              child: const Text(
                "Add Transaction",
                style: TextStyle(fontSize: 18),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
