// widgets/meal_category_card.dart
import 'package:flutter/material.dart';

class MealCategoryCard extends StatelessWidget {
  final String category;
  final List<Map<String, dynamic>> meals;
  final Function(String) onAddMeal;
  final Function(String, int) onRemoveMeal;

  const MealCategoryCard({
    super.key,
    required this.category,
    required this.meals,
    required this.onAddMeal,
    required this.onRemoveMeal,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              category,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            ...meals.map((mealData) {
              int mealIndex = meals.indexOf(mealData);
              return ListTile(
                title: Text(mealData['meal']),
                subtitle: Text('${mealData['calories']} calories'),
                trailing: IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () => onRemoveMeal(category, mealIndex),
                ),
                onTap: () {
                  // You can show a dialog with more details about the meal
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text(mealData['meal']),
                        content: Text(mealData['description']),
                        actions: <Widget>[
                          TextButton(
                            child: const Text('Close'),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    },
                  );
                },
              );
            }),
            ElevatedButton(
              onPressed: () => onAddMeal(category),
              child: const Text('Add Meal'),
            ),
          ],
        ),
      ),
    );
  }
}
