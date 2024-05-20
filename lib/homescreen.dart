import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';


class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<String> imgList = [
    'assets/images/slider_image_1.jpg',
    'assets/images/slider_image_2.jpg',
    'assets/images/slider_image_3.jpg',
  ];

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Flutter App'),
        leading: PopupMenuButton<int>(
          icon: Icon(Icons.menu),
          onSelected: (item) => _onMenuItemSelected(item),
          itemBuilder: (context) => [
            PopupMenuItem<int>(value: 0, child: Text('Home')),
            PopupMenuItem<int>(value: 1, child: Text('Find Donor')),
            PopupMenuItem<int>(value: 2, child: Text('Notifications')),
            PopupMenuItem<int>(value: 3, child: Text('Logout')),
          ],
        ),
      ),
      body: Column(
        children: [
          Stack(
            children: [
              CarouselSlider(
                options: CarouselOptions(
                  autoPlay: true,
                  autoPlayInterval: Duration(seconds: 3),
                  height: 200.0,
                  enlargeCenterPage: true,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _currentIndex = index;
                    });
                  },
                ),
                items: imgList.map((item) => Container(
                  margin: EdgeInsets.symmetric(horizontal: 5.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    child: Image.network(item, fit: BoxFit.cover, width: 1000),
                  ),
                )).toList(),
              ),
              Positioned(
                left: 0,
                top: 0,
                bottom: 0,
                child: IconButton(
                  icon: Icon(Icons.arrow_back, color: Colors.white),
                  onPressed: () {
                    setState(() {
                      _currentIndex = (_currentIndex - 1) % imgList.length;
                    });
                  },
                ),
              ),
              Positioned(
                right: 0,
                top: 0,
                bottom: 0,
                child: IconButton(
                  icon: Icon(Icons.arrow_forward, color: Colors.white),
                  onPressed: () {
                    setState(() {
                      _currentIndex = (_currentIndex + 1) % imgList.length;
                    });
                  },
                ),
              ),
            ],
          ),
          // Add more widgets to the body if needed
        ],
      ),
    );
  }

  void _onMenuItemSelected(int item) {
    switch (item) {
      case 0:
        print('Home selected');
        // Navigate to home screen or perform action
        break;
      case 1:
        print('Find Donor selected');
        // Navigate to find donor screen or perform action
        break;
      case 2:
        print('Notifications selected');
        // Navigate to notifications screen or perform action
        break;
      case 3:
        print('Logout selected');
        // Perform logout action
        break;
    }
  }
}
