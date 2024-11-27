import 'dart:io';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:grocery_app/widgets/text_widgets.dart';
import 'package:provider/provider.dart';

import '../provider/dark_theme_provider.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({Key? key}) : super(key: key);

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  final TextEditingController _addressTextController =
      TextEditingController(text: ""); // Line 16

  @override
  Widget build(BuildContext context) {
    final themeState = Provider.of<DarkThemeProvider>(context); // Line 20
    final Color color =
        themeState.getDarkTheme ? Colors.white : Colors.black; // Line 21

    return Scaffold(
      // Line 23
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 15), // Line 31
                RichText(
                  text: TextSpan(
                    text: 'Hi,  ',
                    style: const TextStyle(
                      color: Colors.cyan,
                      fontSize: 27,
                      fontWeight: FontWeight.bold,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Sarawut',
                        style: TextStyle(
                          color: color,
                          fontSize: 25,
                          fontWeight: FontWeight.w600,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            print('My name is pressed');
                          },
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 5),
                TextWidget(
                  text: 'sarawut.sangsu@gmail.com',
                  color: color,
                  textSize: 18,
                ),
                const SizedBox(height: 20),
                const Divider(thickness: 2), // Line 54
                const SizedBox(height: 20),
                _listTiles(
                  title: 'Address',
                  subtitle: 'Update your address',
                  icon: IconlyLight.profile,
                  onPressed: () async {
                    await _showAddressDialog();
                  },
                  color: color,
                ),
                _listTiles(
                  title: 'Orders',
                  icon: IconlyLight.bag,
                  onPressed: () {
                    print('Orders tapped');
                  },
                  color: color,
                ),
                _listTiles(
                  title: 'Wishlist',
                  icon: IconlyLight.heart,
                  onPressed: () {
                    print('Wishlist tapped');
                  },
                  color: color,
                ),
                _listTiles(
                  title: 'Viewed',
                  icon: IconlyLight.show,
                  onPressed: () {
                    print('Viewed tapped');
                  },
                  color: color,
                ),
                _listTiles(
                  title: 'Forget Password',
                  icon: IconlyLight.unlock,
                  onPressed: () {
                    print('Forget Password tapped');
                  },
                  color: color,
                ),
                SwitchListTile(
                  title: TextWidget(
                    text: themeState.getDarkTheme ? 'Dark mode' : 'Light mode',
                    color: color,
                    textSize: 18,
                  ),
                  secondary: Icon(themeState.getDarkTheme
                      ? Icons.dark_mode_outlined
                      : Icons.light_mode_outlined),
                  onChanged: (bool value) {
                    themeState.setDarkTheme = value;
                  },
                  value: themeState.getDarkTheme,
                ),
                _listTiles(
                  title: 'Logout', // Line 104
                  icon: IconlyLight.logout,
                  onPressed: () {
                    _showLogoutDialog(); // Line 108
                  },
                  color: color,
                ),
                const SizedBox(height: 20),
                listTileAsRow(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _listTiles({
    // Line 120
    required String title,
    String? subtitle,
    required IconData icon,
    required Function onPressed,
    required Color color,
  }) {
    return ListTile(
      title: TextWidget(
        text: title,
        color: color,
        textSize: 22,
      ),
      subtitle: subtitle != null
          ? TextWidget(
              text: subtitle,
              color: color,
              textSize: 18,
            )
          : null,
      leading: Icon(icon, color: color),
      trailing: const Icon(IconlyLight.arrowRight2),
      onTap: () {
        onPressed();
      },
    );
  }

  Future<void> _showAddressDialog() async {
    // Line 146
    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Update Address'),
          content: TextField(
            controller: _addressTextController,
            maxLines: 5,
            decoration: const InputDecoration(hintText: "Your address"),
          ),
          actions: [
            TextButton(
              onPressed: () {
                print('Address updated: ${_addressTextController.text}');
                Navigator.of(context).pop();
              },
              child: const Text('Update'),
            ),
          ],
        );
      },
    );
  }

  Widget listTileAsRow() {
    // Line 173
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: <Widget>[
          const Icon(Icons.settings),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'Settings',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              Text(
                'Manage your app settings',
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
          const Spacer(),
          const Icon(Icons.chevron_right),
        ],
      ),
    );
  }

  Future<void> _showLogoutDialog() async {
    // Line 198
    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Do you want to logout ?'), // Line 204
          content:
              const Text('If confirmed, you will exit the app.'), // Line 205
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Line 209
              },
              child: const Text('Cancel'), // Line 211
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Line 214
                _logout(); // Line 215
              },
              child: const Text('Yes'), // Line 217
            ),
          ],
        );
      },
    );
  }

  void _logout() {
    // Line 222
    print('User logged out');
    exit(0);
    // Example: SystemNavigator.pop(); // Uncomment to close the app
  }
}
