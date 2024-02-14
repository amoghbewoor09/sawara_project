import 'package:flutter/material.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:share_plus/share_plus.dart';

class DescriptionPage extends StatefulWidget {
  @override
  _DescriptionPageState createState() => _DescriptionPageState();
}

class _DescriptionPageState extends State<DescriptionPage> {
  final PageController _pageController = PageController();
  final List<String> images = [
    'assets/des1.jpg', // Replace with actual asset path
    'assets/des2.jpg', // Replace with actual asset path
    'assets/des3.jpg',
    'assets/des4.jpg',
    'assets/des5.jpg',
  ];
  double _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      setState(() {
        _currentPage = _pageController.page ?? 0;
      });
    });
  }

  void share() {
    // This will open the share options provided by the platform
    Share.share('Check out this awesome app!');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Description'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 800,
              height: 300,
              child: Stack(
                children: [
                  PageView(
                    controller: _pageController,
                    scrollDirection: Axis.horizontal,
                    children: images.map((image) {
                      return Container(
                        margin: EdgeInsets.all(16),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10), // Border radius for the image
                          child: Image.asset(
                            image,
                            width: 375,
                            height: 250,
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                  Positioned(
                    left: 0,
                    right: 0,
                    bottom: 16,
                    child: DotsIndicator(
                      dotsCount: images.length,
                      position: _currentPage,
                      decorator: DotsDecorator(
                        color: Colors.grey, // Inactive dot color
                        activeColor: Colors.black, // Active dot color
                      ),
                    ),
                  ),

                ],
              ),

            ),
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5), // Border radius for the container
                child: Container(
                  width: 360,
                  height: 60,
                  color: Colors.grey.withOpacity(0.5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                        icon: FaIcon(FontAwesomeIcons.download),
                        color: Colors.grey.shade700,
                        onPressed: () {
                          // onPressed action for icon5
                        },
                      ),
                      IconButton(
                        icon: FaIcon(FontAwesomeIcons.save),
                        color: Colors.grey.shade700,
                        onPressed: () {
                          // onPressed action for icon5
                        },
                      ),
                      IconButton(
                        icon: FaIcon(FontAwesomeIcons.heart),
                        color: Colors.red,
                        onPressed: () {
                          // onPressed action for icon5
                        },
                      ),
                      IconButton(
                       icon: Icon(Icons.fullscreen,size: 30,),
                        color: Colors.black,
                        onPressed: () {
                          // onPressed action for icon5
                        },
                      ),
                      IconButton(
                        icon: FaIcon(FontAwesomeIcons.star),
                        color: Colors.black,
                        onPressed: () {
                          // onPressed action for icon5
                        },
                      ),
                      IconButton(
                        icon: FaIcon(FontAwesomeIcons.shareNodes),
                        color: Colors.black,
                        onPressed: () {
                          share();
                        },
                      ),
                    ],
                  ),
                ),
            ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(

                children: [
                  IconButton(
                    icon: FaIcon(FontAwesomeIcons.save),
                    color: Colors.black,
                    onPressed: () {
                      // onPressed action for icon5
                    },
                  ),
                  Text("1024"),
                  SizedBox(width: 6,),
                  IconButton(
                    icon: FaIcon(FontAwesomeIcons.heart),
                    color: Colors.black,
                    onPressed: () {
                      // onPressed action for icon5
                    },
                  ),
                  Text("1034"),
                  SizedBox(width: 8,),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20), // Border radius for the container
                    child: Container(
                      height: 40,
                      width: 150,
                      color: Colors.grey,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Icon(Icons.star,size: 15,),
                            Icon(Icons.star,size: 15,),
                            Icon(Icons.star,size: 15,),
                            Icon(Icons.star_border_outlined,size: 15,),
                            Icon(Icons.star_border_outlined,size: 15,),
                          ],
                        ),

                    ),
                  ),
                  SizedBox(width: 4,),
                  Text("3.2"),
                ],
              ),
            ),
            SizedBox(height: 8,),
            Padding(
              padding: const EdgeInsets.only(left: 12.0),
              child: Text("Actor Name",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 12.0),
              child: Text("Indian Actress"),
            ),
            SizedBox(height: 8,),
            Padding(
              padding: const EdgeInsets.only(left: 12.0),
              child: Text("🕐 Duration 20 Mins"),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 12.0),
              child: Text("💵 Total Average Fees ₹9,999"),
            ),
            SizedBox(height: 8,),
            Padding(
              padding: const EdgeInsets.only(left: 12.0),
              child: Text("About",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 12.0,right: 12),
              child: Text("From cardiovascular health to fitness, flexibility, balance, stress relief, better sleep, increased cognitive performance, and more, you can reap all of these benefits in just one session out on the waves. So, you may find yourself wondering what are the benefits of going on a surf camp.",textAlign: TextAlign.justify,),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 320.0,),
              child: Text("See more",style: TextStyle(color: Colors.blueAccent.shade700,fontWeight: FontWeight.bold),),
            ),
              ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed, // Ensure all icons are visible
        currentIndex: 2, // Set the currentIndex to the index of the third item
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_filled),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Prolet',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.handshake_outlined, color: Colors.blueAccent),
            label: 'Meetup',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.travel_explore_sharp),
            label: 'Explore',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Account',
          ),
        ],
      ),

    );
  }
}
