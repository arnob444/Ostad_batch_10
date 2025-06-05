import 'package:flutter/material.dart';
import 'package:buttonexpert/model/expense_model.dart';
import 'package:intl/intl.dart';

class Expensetracker extends StatefulWidget {
  const Expensetracker({super.key});

  @override
  State<Expensetracker> createState() => _ExpensetrackerState();
}

class _ExpensetrackerState extends State<Expensetracker> {
  final List<String> categories = [
    'Foods',
    'Transports',
    'Tution fees',
    'Others',
  ];

  final List<Expense> expense = [];

  double total = 0.0;

  void showForm(BuildContext context) {
    String selectedCategory = '';
    TextEditingController titleController = TextEditingController();
    TextEditingController amountController = TextEditingController();
    DateTime expenseDateTime = DateTime.now();

    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.only(
            left: 16,
            right: 16,
            top: 16,
            bottom: 16,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: titleController,
                decoration: InputDecoration(labelText: 'Title'),
              ),
              SizedBox(height: 10),
              TextField(
                controller: amountController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: "Amount"),
              ),
              SizedBox(height: 10),
              DropdownButtonFormField(
                hint: Text('Select anyone'),
                items:
                    categories
                        .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                        .toList(),
                onChanged: (value) {
                  selectedCategory = value!;
                },
              ),
              SizedBox(height: 10),
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                onPressed: () {
                  if (titleController.text.isNotEmpty ||
                      double.tryParse(amountController.text) != null) {
                    addExpense(
                      titleController.text,
                      double.parse(amountController.text.trim()),
                      expenseDateTime,
                      selectedCategory,
                    );
                    Navigator.pop(context);
                  } else {
                    Navigator.pop(context);
                    final snackbar = SnackBar(
                      backgroundColor: Colors.red,
                      content: Text('Fill up the form'),
                      duration: Duration(seconds: 2),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackbar);
                  }
                },
                child: Text(
                  "Add Expense",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        );
      },
    );
  }

  void addExpense(String title, double amount, DateTime date, String category) {
    setState(() {
      expense.add(
        Expense(title: title, amount: amount, date: date, category: category),
      );
      total += amount;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey.shade50,
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text(
          'Expense Tracker',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        actions: [
          IconButton(
            onPressed: () {
              showForm(context);
            },
            icon: Icon(Icons.add),
            color: Colors.white,
          ),
        ],
        centerTitle: true,
        elevation: 2,
        shadowColor: Colors.black,
      ),

      body: Column(
        children: [
          Center(
            child: Card(
              color: Colors.orange,
              margin: EdgeInsets.all(20),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 100,
                  right: 100,
                  top: 50,
                  bottom: 50,
                ),
                child: Text(
                  'Total : $total',
                  style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: expense.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.blueAccent,
                      child: Text(expense[index].category[0]),
                    ),
                    title: Text(expense[index].title),
                    subtitle: Text(
                      DateFormat.yMMMd().format(expense[index].date),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showForm(context);
        },
        child: Icon(Icons.add_box_outlined),
      ),
    );
  }
}
