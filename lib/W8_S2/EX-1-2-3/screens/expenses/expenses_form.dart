import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_term1/W8_S2/EX-1-2-3/models/expense.dart';

class ExpenseForm extends StatefulWidget {
  final Function(Expense) onCreated;

  const ExpenseForm({super.key, required this.onCreated});

  @override
  State<ExpenseForm> createState() => _ExpenseFormState();
}

class _ExpenseFormState extends State<ExpenseForm> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  Category? _selectedCategory;
  DateTime? _selectedDate;

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  void onCancel() {
    Navigator.pop(context);
  }

  void onAdd() {
    String title = _titleController.text;
    double amount = double.tryParse(_amountController.text) ?? 0;
    DateTime? date = _selectedDate;

    if (title.isEmpty) {
      _showAlert('Invalid input', 'The title cannot be empty.');
      return;
    }
    if (amount <= 0) {
      _showAlert('Invalid input', 'The amount must be a positive number.');
      return;
    }
    if (_selectedCategory == null) {
      _showAlert('Invalid input', 'Please select a category.');
      return;
    }
    if (date == null) {
      _showAlert('Invalid input', 'Please select a date.');
      return;
    }

    Expense expense = Expense(
      title: title,
      amount: amount,
      date: date,
      category: _selectedCategory!,
    );

    widget.onCreated(expense);
    Navigator.pop(context);
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  void _showAlert(String title, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: [
            TextButton(
              child: const Text('Okay'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Title Input
          TextField(
            controller: _titleController,
            maxLength: 50,
            decoration: const InputDecoration(
              label: Text('Title') ,
              counterText: '0/50',
            ),
          ),

          Row(
            children: [
              Flexible(
                child:  TextField(
                 controller: _amountController,
                 maxLength: 50,
                 keyboardType: TextInputType.number,
                 inputFormatters: <TextInputFormatter>[
                   FilteringTextInputFormatter.digitsOnly,
            ],
               decoration: const InputDecoration(
              label: Text('Amount'),
              prefixText: '\$ '
            ),
          ),
        ),
       
        Text(
                _selectedDate == null
                    ? "No date selected"
                    : "${_selectedDate!.toLocal()}".split(" ")[0],
                style: TextStyle(fontSize: 16),
              ),
              IconButton(
                onPressed: () => _selectDate(context),
                icon: Icon(Icons.calendar_today),
              ),
       

            ],

          ),

          // Date Selector
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children:[
              DropdownButton(
                value: _selectedCategory,
                items: const [
                  DropdownMenuItem(child: Text('FOOD'), value: Category.food),
                  DropdownMenuItem(
                      child: Text('TRAVEL'), value: Category.travel),
                  DropdownMenuItem(
                      child: Text('LEISURE'), value: Category.leisure),
                  DropdownMenuItem(child: Text('WORK'), value: Category.work),
                ],
                onChanged: (Category? value) {
                  setState(() {
                    _selectedCategory = value!;
                  });
                },
              ),
              Spacer(),
              SizedBox(
                width: 200,
                child: ElevatedButton(
                  onPressed: onCancel,
                  child: const Text('Cancel'),
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              SizedBox(
                width: 200,
                child: ElevatedButton(
                  onPressed: onAdd,
                  child: const Text('Save Expense'),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.purple[100]),
                ),
              )
            ],
          ),
             
            ],
          ),

           

        
      );
    
  }
}