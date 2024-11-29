import 'package:flutter/material.dart';
import 'package:grocery_app/widgets/categories_widget.dart'; // นำเข้า CategoriesWidget

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CategoriesGrid(), // เรียกใช้งาน CategoriesWidget ที่นำเข้า
      ),
    );
  }
}
