import 'package:flutter/material.dart';
import 'dart:math'; // ใช้สำหรับสุ่มค่า

import 'package:provider/provider.dart';
import '../provider/dark_theme_provider.dart';
import '../widgets/text_widgets.dart';

class CategoriesGrid extends StatelessWidget {
  const CategoriesGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeState = Provider.of<DarkThemeProvider>(context);
    final Color color = themeState.getDarkTheme ? Colors.white : Colors.black;

    // ข้อมูลจำลอง (Dummy Data) สำหรับหมวดหมู่
    final List<Map<String, String>> categories = [
      {'name': 'Vegetables', 'image': 'assets/images/cat/veg.png'},
      {'name': 'Nuts', 'image': 'assets/images/cat/nuts.png'},
      {'name': 'Grains', 'image': 'assets/images/cat/grains.png'},
      {'name': 'Spinach', 'image': 'assets/images/cat/Spinach.png'},
      {'name': 'Fruits', 'image': 'assets/images/cat/fruits.png'},
      {'name': 'Spices', 'image': 'assets/images/cat/spices.png'},
    ];

    return Scaffold(
      body: GridView.builder(
        padding: const EdgeInsets.all(10),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // จำนวนคอลัมน์
          crossAxisSpacing: 10, // ระยะห่างระหว่างคอลัมน์
          mainAxisSpacing: 10, // ระยะห่างระหว่างแถว
          childAspectRatio: 3 / 4, // อัตราส่วนความกว้างต่อความสูง
        ),
        itemCount: categories.length,
        itemBuilder: (context, index) {
          // สร้างสีแบบสุ่ม
          final randomColor = _generateRandomColor();
          return CategoryItem(
            name: categories[index]['name']!,
            imagePath: categories[index]['image']!,
            color: color,
            backgroundColor: randomColor,
          );
        },
      ),
    );
  }

  // ฟังก์ชันสำหรับสร้างสีแบบสุ่ม
  Color _generateRandomColor() {
    final Random random = Random();
    return Color.fromRGBO(
      random.nextInt(256), // ค่า R (0-255)
      random.nextInt(256), // ค่า G (0-255)
      random.nextInt(256), // ค่า B (0-255)
      0.2 + random.nextDouble() * 0.6, // ความโปร่งใส (0.2-0.8)
    );
  }
}

class CategoryItem extends StatelessWidget {
  final String name;
  final String imagePath;
  final Color color;
  final Color backgroundColor;

  const CategoryItem({
    Key? key,
    required this.name,
    required this.imagePath,
    required this.color,
    required this.backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        print('Tapped on $name');
      },
      child: Container(
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: Colors.red.withOpacity(0.7),
            width: 2,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Image Section
            Container(
              height: 80,
              width: 80,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(imagePath),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 10),
            // Name Section
            TextWidget(
              text: name,
              color: color,
              textSize: 16,
              isTitle: true,
            ),
          ],
        ),
      ),
    );
  }
}
