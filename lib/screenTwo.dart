

import 'package:flutter/material.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:sawara_project/screenThree.dart';

class SuccessPage extends StatefulWidget {
  @override
  _SuccessPageState createState() => _SuccessPageState();
}

class _SuccessPageState extends State<SuccessPage> {
  final PageController _pageController = PageController();
  final List<String> images = [
    'assets/image1.jpeg',
    'assets/image2.jpg',
    'assets/image3.jpg',
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

  void dummy(){
  }

  void redirectDescription(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => DescriptionPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Individual Meetup'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 18.0, right: 18.0),
                child: Container(
                  height: 60,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.blue),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Icon(Icons.search),
                        SizedBox(width: 10),
                        Container(
                          width: 200,
                          height: 50,
                          child: const TextField(
                            decoration: InputDecoration(
                              hintText: "Search",
                              hintStyle: TextStyle(fontSize: 18),
                              border: InputBorder.none, // Remove underline
                            ),
                          ),
                        ),
                        SizedBox(width: 80),
                        Icon(Icons.mic),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Container(
                width: 800,
                height: 250,
                child: Stack(
                  children: [
                    PageView(
                      controller: _pageController,
                      scrollDirection: Axis.horizontal,
                      children: images.map((image) {
                        return Container(
                          margin: EdgeInsets.all(16),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12), // Border radius for the image
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
                      bottom: -6,
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

              SizedBox(height: 40,),
              Padding(
                padding: const EdgeInsets.only( left: 10.0),
                child: Text("Trending Popular People",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: 400,
                  height: 200,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      Container(
                        margin: EdgeInsets.all(8),
                        width: 300,
                        height: 80,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.blue),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(color: Colors.blue),
                                        borderRadius: BorderRadius.circular(50),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Icon(Icons.energy_savings_leaf_outlined),
                                      )),
                                  Text("  Author \n 1,028 Meetups"),
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 8),
                              height: 1,
                              width: 400,
                              color: Colors.grey.shade500,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 4.0,top: 4,),
                                    child: Container(
                                      width: 50,
                                      height: 50,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(color: Colors.white, width: 0),
                                        image: DecorationImage(
                                          image: AssetImage('assets/image1.jpeg'),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 4.0,top: 4,),
                                    child: Container(
                                      width: 50,
                                      height: 50,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(color: Colors.white, width: 0),
                                        image: DecorationImage(
                                          image: AssetImage('assets/image2.jpg'),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 4.0,top: 4,),
                                    child: Container(
                                      width: 50,
                                      height: 50,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(color: Colors.white, width: 0),
                                        image: DecorationImage(
                                          image: AssetImage('assets/image3.jpg'),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 4.0,top: 4,),
                                    child: Container(
                                      width: 50,
                                      height: 50,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(color: Colors.white, width: 0),
                                        image: DecorationImage(
                                          image: AssetImage('assets/image3.jpg'),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 4.0,top: 4,),
                                    child: Container(
                                      width: 50,
                                      height: 50,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(color: Colors.white, width: 0),
                                        image: DecorationImage(
                                          image: AssetImage('assets/image3.jpg'),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 186.0,top: 10),
                              child: Container(
                                width: 100,
                                height: 40,// Match the parent width
                                child: ElevatedButton(
                                  onPressed: dummy,
                                  child: Text("See More",style: TextStyle(fontSize: 12,color: Colors.white),),
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.blue.shade900,
                                    shape: RoundedRectangleBorder(
                                      side: BorderSide(color: Colors.blue,width: 0),
                                      borderRadius: BorderRadius.circular(6),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(8),
                        width: 300,
                        height: 80,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.blue),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(color: Colors.blue),
                                        borderRadius: BorderRadius.circular(50),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Icon(Icons.energy_savings_leaf_outlined),
                                      )),
                                  Text("  Author \n 1,028 Meetups"),
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 8),
                              height: 1,
                              width: 400,
                              color: Colors.grey.shade500,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 4.0,top: 4,),
                                    child: Container(
                                      width: 50,
                                      height: 50,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(color: Colors.white, width: 0),
                                        image: DecorationImage(
                                          image: AssetImage('assets/image1.png'),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 4.0,top: 4,),
                                    child: Container(
                                      width: 50,
                                      height: 50,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(color: Colors.white, width: 0),
                                        image: DecorationImage(
                                          image: AssetImage('assets/image2.jpg'),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 4.0,top: 4,),
                                    child: Container(
                                      width: 50,
                                      height: 50,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(color: Colors.white, width: 0),
                                        image: DecorationImage(
                                          image: AssetImage('assets/image3.jpg'),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 4.0,top: 4,),
                                    child: Container(
                                      width: 50,
                                      height: 50,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(color: Colors.white, width: 0),
                                        image: DecorationImage(
                                          image: AssetImage('assets/image3.jpg'),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 4.0,top: 4,),
                                    child: Container(
                                      width: 50,
                                      height: 50,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(color: Colors.white, width: 0),
                                        image: DecorationImage(
                                          image: AssetImage('assets/image3.jpg'),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 186.0,top: 10),
                              child: Container(
                                width: 100,
                                height: 40,// Match the parent width
                                child: ElevatedButton(
                                  onPressed: dummy,
                                  child: Text("See More",style: TextStyle(fontSize: 12,color: Colors.white),),
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.blue.shade900,
                                    shape: RoundedRectangleBorder(
                                      side: BorderSide(color: Colors.blue,width: 0),
                                      borderRadius: BorderRadius.circular(6),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(8),
                        width: 300,
                        height: 80,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.blue),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(color: Colors.blue),
                                        borderRadius: BorderRadius.circular(50),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Icon(Icons.energy_savings_leaf_outlined),
                                      )),
                                  Text("  Author \n 1,028 Meetups"),
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 8),
                              height: 1,
                              width: 400,
                              color: Colors.grey.shade500,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 4.0,top: 4,),
                                    child: Container(
                                      width: 50,
                                      height: 50,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(color: Colors.white, width: 0),
                                        image: DecorationImage(
                                          image: AssetImage('assets/image1.png'),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 4.0,top: 4,),
                                    child: Container(
                                      width: 50,
                                      height: 50,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(color: Colors.white, width: 0),
                                        image: DecorationImage(
                                          image: AssetImage('assets/image2.jpg'),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 4.0,top: 4,),
                                    child: Container(
                                      width: 50,
                                      height: 50,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(color: Colors.white, width: 0),
                                        image: DecorationImage(
                                          image: AssetImage('assets/image3.jpg'),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 4.0,top: 4,),
                                    child: Container(
                                      width: 50,
                                      height: 50,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(color: Colors.white, width: 0),
                                        image: DecorationImage(
                                          image: AssetImage('assets/image3.jpg'),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 4.0,top: 4,),
                                    child: Container(
                                      width: 50,
                                      height: 50,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(color: Colors.white, width: 0),
                                        image: DecorationImage(
                                          image: AssetImage('assets/image3.jpg'),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 186.0,top: 10),
                              child: Container(
                                width: 100,
                                height: 40,// Match the parent width
                                child: ElevatedButton(
                                  onPressed: dummy,
                                  child: Text("See More",style: TextStyle(fontSize: 12,color: Colors.white),),
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.blue.shade900,
                                    shape: RoundedRectangleBorder(
                                      side: BorderSide(color: Colors.blue,width: 0),
                                      borderRadius: BorderRadius.circular(6),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.only( left: 10.0),
                child: Text("Top Trending Meetups",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: 400,
                  height: 300,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      GestureDetector(
                        onTap: () {
                          redirectDescription(context);
                        },
                        child: Container(
                          margin: EdgeInsets.all(8),
                          width: 170,
                          height: 80,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.blue),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10), // Same radius as the container
                            child: Image.asset(
                              'assets/meet1.jpg',
                              fit: BoxFit.cover, // Adjust the fit as per your requirement
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          redirectDescription(context);
                        },
                        child: Container(
                          margin: EdgeInsets.all(8),
                          width: 170,
                          height: 80,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.blue),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10), // Same radius as the container
                            child: Image.asset(
                              'assets/meet2.jpg',
                              fit: BoxFit.cover, // Adjust the fit as per your requirement
                            ),
                          ),
                        ),
                      ),

                      GestureDetector(
                        onTap: () {
                          redirectDescription(context);
                        },
                        child: Container(
                          margin: EdgeInsets.all(8),
                          width: 170,
                          height: 80,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.blue),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10), // Same radius as the container
                            child: Image.asset(
                              'assets/meet3.jpg',
                              fit: BoxFit.cover, // Adjust the fit as per your requirement
                            ),
                          ),
                        ),
                      ),

                      GestureDetector(
                        onTap: () {
                          redirectDescription(context);
                        },
                        child: Container(
                          margin: EdgeInsets.all(8),
                          width: 170,
                          height: 80,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.blue),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10), // Same radius as the container
                            child: Image.asset(
                              'assets/meet4.jpg',
                              fit: BoxFit.cover, // Adjust the fit as per your requirement
                            ),
                          ),
                        ),
                      ),

                      GestureDetector(
                        onTap: () {
                          redirectDescription(context);
                        },
                        child: Container(
                          margin: EdgeInsets.all(8),
                          width: 170,
                          height: 80,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.blue),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10), // Same radius as the container
                            child: Image.asset(
                              'assets/meet5.jpg',
                              fit: BoxFit.cover, // Adjust the fit as per your requirement
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
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

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
