import 'package:flutter/material.dart';

class WorkoutCategoryCard extends StatelessWidget {
  final String categoryName;
  final String description;
  final String imagePath; // Add imagePath
  final VoidCallback onTap;

  const WorkoutCategoryCard({
    super.key,
    required this.categoryName,
    required this.description,
    required this.imagePath,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        child: Row(
          children: [
            Image.asset(
              imagePath, // Use the provided image path
              width: 90,
              height: 150,
              fit: BoxFit.cover,
            ),
            const SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  categoryName,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
