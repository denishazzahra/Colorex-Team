import 'package:flutter/material.dart';

class CustomNavigationBar extends StatelessWidget {
  final List<CustomNavigationBarItem> items;
  final int currentIndex;
  final ValueChanged<int> onTap;

  const CustomNavigationBar({super.key, 
    required this.items,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue, // Customize the color as needed
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: items.map((item) {
          var index = items.indexOf(item);
          return GestureDetector(
            onTap: () => onTap(index),
            child: Container(
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: currentIndex == index ? Colors.white : Colors.transparent,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: item.icon,
            ),
          );
        }).toList(),
      ),
    );
  }
}

class CustomNavigationBarItem {
  final Widget icon;

  CustomNavigationBarItem({required this.icon});
}
