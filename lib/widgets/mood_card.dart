import 'package:flutter/material.dart';
import 'package:mental_health_tracker/screens/moodentry_form.dart';

class ItemHomepage {
  final String name;
  final IconData icon;

  ItemHomepage(this.name, this.icon);
}

class ItemCard extends StatelessWidget {
  final ItemHomepage item;

  const ItemCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).colorScheme.secondary,
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        onTap: () {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(content: Text("You pressed the ${item.name} button!")),
            );

          if (item.name == "Add Mood") {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const MoodEntryFormPage(),
              ),
            );
          } else if (item.name == "View Mood") {
            // Add your "View Mood" navigation here
          } else if (item.name == "Logout") {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("You pressed the ${item.name} button!")),
            );
            // Add logout functionality here
          }
        },
        child: Container(
          padding: const EdgeInsets.all(8),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  item.icon,
                  color: Colors.white,
                  size: 30.0,
                ),
                const SizedBox(height: 8.0),
                Text(
                  item.name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
     ),
);
}
}