import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:restaurant_app/screen/filter_screen.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  Widget buildListTile(IconData icon, String title, VoidCallback tapHandler) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        title,
        style: GoogleFonts.robotoCondensed(
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: tapHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 120,
            width: double.infinity,
            color: Theme.of(context).colorScheme.primary,
            child: Center(
              child: Text(
                'Cooking Up',
                style: GoogleFonts.raleway(
                  color: Colors.white,
                  fontWeight: FontWeight.w900,
                  fontSize: 30,
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          buildListTile(Icons.restaurant, 'Meals', () {
            Navigator.pushReplacementNamed(context, '/');
          }),
          buildListTile(Icons.settings, 'Filter', () {
            Navigator.pushReplacementNamed(context, FilterScreen.routeName);
          }),
        ],
      ),
    );
  }
}
