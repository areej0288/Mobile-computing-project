import 'package:flutter/material.dart';

class MealLogger extends StatefulWidget {
  final String
      goalTitle; // e.g., "Weight Gain", "Weight Loss", "Weight Maintain"

  const MealLogger({required this.goalTitle, super.key});

  @override
  _MealLoggerState createState() => _MealLoggerState();
}

class _MealLoggerState extends State<MealLogger> {
  final List<Map<String, String>> mealLogs = [];
  final TextEditingController mealController = TextEditingController();
  final TextEditingController caloriesController = TextEditingController();

  int get totalCalories {
    return mealLogs.fold(
      0,
      (sum, meal) => sum + int.tryParse(meal['calories'] ?? '0')!,
    );
  }

  void _addMeal() {
    final mealName = mealController.text;
    final calories = caloriesController.text;

    if (mealName.isNotEmpty && int.tryParse(calories) != null) {
      setState(() {
        mealLogs.add({'name': mealName, 'calories': calories});
        mealController.clear();
        caloriesController.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.goalTitle} - Meal Logger'),
        backgroundColor: Colors.blueGrey[900],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: mealController,
              decoration: const InputDecoration(labelText: 'Meal Name'),
            ),
            TextField(
              controller: caloriesController,
              decoration: const InputDecoration(labelText: 'Calories'),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _addMeal,
              child: const Text('Add Meal'),
            ),
            const SizedBox(height: 20),
            Text(
              'Total Calories: $totalCalories kcal',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: mealLogs.length,
                itemBuilder: (context, index) {
                  final meal = mealLogs[index];
                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    child: ListTile(
                      title: Text(meal['name']!),
                      subtitle: Text('${meal['calories']} kcal'),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete, color: Colors.red),
                        onPressed: () {
                          setState(() {
                            mealLogs.removeAt(index);
                          });
                        },
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
