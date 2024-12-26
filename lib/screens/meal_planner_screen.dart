import 'package:flutter/material.dart';
import 'weight_gain_meals.dart';
import 'weight_loss_meals.dart';
import 'weight_maintain_meals.dart';

class MealPlannerScreen extends StatelessWidget {
  const MealPlannerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meal Planner'),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildMealOption(
              context,
              title: 'Weight Gain Meals',
              imageUrl:
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS0iCghqUBKq4gllaJ5KXJ6rw29osMXzJ9Iu4ThPDsRJO5htP2V7YxTSlqV_elv04CwH4E&usqp=CAU',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const WeightGainMeals(),
                  ),
                );
              },
            ),
            const SizedBox(height: 24.0),
            _buildMealOption(
              context,
              title: 'Weight Loss Meals',
              imageUrl:
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQs1qsUKtGrmnTlEYYv0kA77h1f_8nzk5ZA5mjYCFo7sQOcKhwKjGN0hHDZhl0TqNzVYcU&usqp=CAU',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => WeightLossMeals(),
                  ),
                );
              },
            ),
            const SizedBox(height: 24.0),
            _buildMealOption(
              context,
              title: 'Weight Maintain Meals',
              imageUrl:
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQgsBn2r5CjrGcxaHGIxAV9otb_wveF2t8Sg9UtIxSd1FUlr-rBjrH6et2XoXbkDFH4w1s&usqp=CAU',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => WeightMaintainMeals(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMealOption(
    BuildContext context, {
    required String title,
    required String imageUrl,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 160.0,
        decoration: BoxDecoration(
          color: Colors.teal.withOpacity(0.2),
          borderRadius: BorderRadius.circular(20.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.4),
              blurRadius: 10.0,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20.0),
                bottomLeft: Radius.circular(20.0),
              ),
              child: Image.network(
                imageUrl,
                width: 140.0,
                height: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 24.0),
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.teal,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
