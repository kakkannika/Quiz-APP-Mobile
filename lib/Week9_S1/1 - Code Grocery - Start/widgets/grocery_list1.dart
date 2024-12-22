import 'package:flutter/material.dart';
import 'package:flutter_term1/Week9_S1/1%20-%20Code%20Grocery%20-%20Start/widgets/new_item1.dart';
import '../data/dummy_items.dart';
import '../models/grocery_item.dart';

class GroceryList extends StatefulWidget {
  const GroceryList({super.key});

  @override
  State<GroceryList> createState() => _GroceryListState();
}

class _GroceryListState extends State<GroceryList> {
  List<GroceryItem> groceries = [];

  @override
  void initState() {
    super.initState();
    groceries = dummyGroceryItems; 
  }

  Future<void> _addNewGrocery() async {
    final newGrocery = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const NewItem()),
    );

    if (newGrocery is GroceryItem) {
      setState(() {
        groceries.add(newGrocery); 
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget content = const Center(child: Text('No items added yet.'));

    if (groceries.isNotEmpty) {
      content = ListView.builder(
        itemCount: groceries.length,
        itemBuilder: (ctx, index) => GroceryTile(groceries[index]),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Groceries'),
        actions: [
          IconButton(
            onPressed: _addNewGrocery, 
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: content,
    );
  }
}

class GroceryTile extends StatelessWidget {
  const GroceryTile(this.groceryItem, {super.key});

  final GroceryItem groceryItem;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(groceryItem.name),
      leading: Container(
        width: 24,
        height: 24,
        color: groceryItem.category.color,
      ),
      trailing: Text(
        groceryItem.quantity.toString(),
      ),
    );
  }
}
