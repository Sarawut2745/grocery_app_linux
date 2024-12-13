import 'package:flutter/material.dart';
import 'dart:math'; // สำหรับสุ่มสี

import 'package:grocery_app/widgets/categories_widget.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // ฟังก์ชันสำหรับสร้างสีแบบสุ่ม
    Color getRandomColor() {
      final random = Random();
      return Color.fromRGBO(
        random.nextInt(256), // ค่า Red
        random.nextInt(256), // ค่า Green
        random.nextInt(256), // ค่า Blue
        1, // Opacity
      );
    }

    return Scaffold(
      body: GridView.builder(
        padding: const EdgeInsets.all(16.0),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // จำนวนคอลัมน์ในแต่ละแถว
          crossAxisSpacing: 16.0,
          mainAxisSpacing: 16.0,
        ),
        itemCount: categoriesData.length,
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
              color: getRandomColor(), // กำหนดสีพื้นหลังแบบสุ่ม
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: CategoriesWidget(
              imagePath: categoriesData[index]['imagePath']!,
              categoryName: categoriesData[index]['name']!,
            ),
          );
        },
      ),
    );
  }
}

const List<Map<String, String>> categoriesData = [
  {'name': 'Fruits', 'imagePath': 'assets/images/cat/fruits.png'},
  {'name': 'Vegetables', 'imagePath': 'assets/images/cat/veg.png'},
  {'name': 'Herbs', 'imagePath': 'assets/images/cat/Spinach.png'},
  {'name': 'Nuts', 'imagePath': 'assets/images/cat/nuts.png'},
  {'name': 'Spices', 'imagePath': 'assets/images/cat/spices.png'},
  {'name': 'Grains', 'imagePath': 'assets/images/cat/grains.png'},
];
