import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DarkThemeProvider with ChangeNotifier {
  bool _darkTheme = false;

  // Getter สำหรับตรวจสอบสถานะธีม
  bool get getDarkTheme => _darkTheme;

  // Setter สำหรับกำหนดสถานะธีม
  set setDarkTheme(bool value) {
    _darkTheme = value;
    notifyListeners(); // อัปเดตผู้ฟังเมื่อสถานะเปลี่ยน
    saveTheme(value); // บันทึกสถานะธีมลงใน SharedPreferences
  }

  // ฟังก์ชันเพื่อบันทึกสถานะธีมใน SharedPreferences
  Future<void> saveTheme(bool isDarkMode) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('darkTheme', isDarkMode);
  }

  // ฟังก์ชันเพื่อดึงสถานะธีมจาก SharedPreferences
  Future<bool> getTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('darkTheme') ??
        false; // คืนค่า false ถ้ายังไม่มีการตั้งค่า
  }
}
