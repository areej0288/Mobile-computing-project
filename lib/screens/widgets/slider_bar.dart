import 'package:flutter/material.dart';

class SliderBar extends StatelessWidget {
  final int itemCount;
  final int currentIndex;
  final Function(int) onItemSelected;

  const SliderBar({
    super.key,
    required this.itemCount,
    required this.currentIndex,
    required this.onItemSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      color: Colors.black.withOpacity(0.8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(itemCount, (index) {
          return GestureDetector(
            onTap: () {
              onItemSelected(index);
            },
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: currentIndex == index ? Colors.green : Colors.white,
              ),
            ),
          );
        }),
      ),
    );
  }
}
