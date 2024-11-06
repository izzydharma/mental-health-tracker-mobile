import 'package:flutter/material.dart';
import 'package:mental_health_tracker/widgets/left_drawer.dart';
import 'package:mental_health_tracker/widgets/mood_card.dart'; // Import mood_card.dart

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});

  final String npm = '2306256425'; // NPM
  final String name = 'Made Izzy Prema Dharma'; // Name
  final String className = 'PBP KKI'; // Class

  final List<ItemHomepage> items = [
    ItemHomepage("View Mood", Icons.mood),
    ItemHomepage("Add Mood", Icons.add),
    ItemHomepage("Logout", Icons.logout),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          'Mental Health Tracker',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      drawer: const LeftDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InfoCard(title: 'NPM', content: npm),
                InfoCard(title: 'Name', content: name),
                InfoCard(title: 'Class', content: className),
              ],
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Welcome to Mental Health Tracker',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16.0),
            GridView.count(
              primary: false,
              padding: const EdgeInsets.all(20),
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              crossAxisCount: 3,
              shrinkWrap: true,
              children: items.map((ItemHomepage item) {
                return ItemCard(item: item); // Use ItemCard from mood_card.dart
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}

class InfoCard extends StatelessWidget {
  final String title;
  final String content;

  const InfoCard({super.key, required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      child: Container(
        width: MediaQuery.of(context).size.width / 3.5,
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8.0),
            Text(content),
          ],
        ),
     ),
);
}
}