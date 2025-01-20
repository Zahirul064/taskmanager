import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Home Screen Grid',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  final List<GridItem> gridItems = [
    GridItem("সালাত", Icons.mosque, Colors.green, "Details about সালাত."),
    GridItem("সকাল - সন্ধ্যা", Icons.wb_sunny, Colors.orange, "Details about সকাল ও সন্ধ্যা."),
    GridItem("ঘুম", Icons.nightlight_round, Colors.blue, "Details about ঘুম."),
    GridItem("রামাদান - সিয়াম", Icons.fastfood, Colors.purple, "Details about রামাদান."),
    GridItem("কুরআনের দোয়া", Icons.menu_book, Colors.red, "Details about কুরআনের দোয়া."),
    GridItem("খাদ্য ও পানি", Icons.local_dining, Colors.green, "Details about খাদ্য ও পানি."),
    GridItem("অসুস্থতা - মৃত্যু", Icons.medical_services, Colors.blueAccent, "Details about অসুস্থতা."),
    GridItem("রুকইয়াহ", Icons.healing, Colors.brown, "Details about রুকইয়াহ."),
    GridItem("আশ্রয় প্রার্থনা", Icons.shield, Colors.purple, "Details about আশ্রয় প্রার্থনা."),
    GridItem("সামাজিক", Icons.people, Colors.indigo, "Details about সামাজিক."),
    GridItem("পরিবার", Icons.family_restroom, Colors.brown, "Details about পরিবার."),
    GridItem("সম্পত্তি - রিজিক", Icons.home, Colors.teal, "Details about সম্পত্তি."),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('হিসনুল মুসলিম'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, // 3 columns
            crossAxisSpacing: 10.0,
            mainAxisSpacing: 10.0,
          ),
          itemCount: gridItems.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                // Navigate to DetailScreen with selected grid item
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailScreen(item: gridItems[index]),
                  ),
                );
              },
              child: GridItemWidget(item: gridItems[index]),
            );
          },
        ),
      ),
    );
  }
}

class GridItem {
  final String title;
  final IconData icon;
  final Color color;
  final String description;

  GridItem(this.title, this.icon, this.color, this.description);
}

class GridItemWidget extends StatelessWidget {
  final GridItem item;

  const GridItemWidget({required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            blurRadius: 5,
            offset: Offset(2, 2),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(item.icon, size: 40, color: item.color),
          SizedBox(height: 10),
          Text(
            item.title,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }
}

class DetailScreen extends StatelessWidget {
  final GridItem item;

  const DetailScreen({required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(item.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(item.icon, size: 100, color: item.color),
            SizedBox(height: 20),
            Text(
              item.title,
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: item.color,
              ),
            ),
            SizedBox(height: 20),
            Text(
              item.description,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                color: Colors.black87,
              ),
            ),
          ],
        ),
      ),
    );
  }
}