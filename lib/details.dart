import 'package:flutter/material.dart';
import 'package:favorite_button/favorite_button.dart';
import 'login.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({super.key});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    const homeImage = 'assets/background.jpg';
    const rowImage1 = 'assets/row1.jpg';
    const rowImage2 = 'assets/row2.jpeg';
    const rowImage3 = 'assets/row3.jpeg';
    const rowImage4 = 'assets/row4.jpg';
    return Scaffold(
      backgroundColor: Colors.red,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.pushNamed(context, "/login");
        },
        label: Text("Book Now"),
        icon: Icon(Icons.add),

      ),
      appBar: AppBar(
        title: const Text("Mission 1",
            style: TextStyle(
                fontFamily: 'Raleway',
                fontWeight: FontWeight.w700,
                fontSize: 20)),
      ),
      body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.blue,
                Colors.white,
              ],
            ),
          ),
          width: double.infinity,
          height: double.infinity,
          child: Column(
            children: [
              Flexible(
                flex: 2,
                child: Stack(
                  children: [
                    Image.asset(
                      homeImage,
                      width: double.infinity,
                      height: 195,
                      fit: BoxFit.cover,
                    ),
                    Positioned(
                        //Relative Position
                        top: 15,
                        right: 10,
                        child: CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 28.0,
                            child: FavoriteButton(
                              valueChanged: (_) {},
                              iconSize: 35,
                            ))),
                  ],
                ),
              ),
              const SizedBox(height: 8),
              Flexible(
                flex: 1,
                child: Row(
                  children: [
                    const SizedBox(width: 5),
                    Expanded(
                        flex: 1,
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                                height: double.infinity,
                                rowImage1,
                                fit: BoxFit.cover))),
                    const SizedBox(width: 8),
                    Expanded(
                        flex: 1,
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                                height: double.infinity,
                                rowImage2,
                                fit: BoxFit.cover))),
                    const SizedBox(width: 8),
                    Expanded(
                        flex: 1,
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                                height: double.infinity,
                                rowImage3,
                                fit: BoxFit.cover))),
                    const SizedBox(width: 8),
                    Expanded(
                        flex: 1,
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                                height: double.infinity,
                                rowImage4,
                                fit: BoxFit.cover))),
                    const SizedBox(width: 5),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              const Text("Welcome to Golden Tulip Holland Batu",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Raleway',
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                  )),
              Flexible(
                  flex: 4,
                  child: ListView(
                    padding: const EdgeInsets.only(
                        top: 5, left: 5, right: 5, bottom: 5),
                    children: const [
                      SizedBox(height: 8),
                      Text(
                          "The 5-star Golden Tulip Holland Resort is ideally located in the heart of leisure place in Batu, with easy access to family recreational place and entertainments. It offers two food & beverage venues, swimming pools, a spa, a fitness center, a kids playground and meeting room facilities which cater up to 2000 person.",
                          style: TextStyle(
                              fontFamily: 'Raleway',
                              fontWeight: FontWeight.w500,
                              fontSize: 16)),
                      SizedBox(height: 20),
                      Text(
                          "Golden Tulip Holland Resort offers the kind of facilities and services that make travelling with children a breeze. The hotel is geared towards the needs and requirements of all families, big and small. Our hotel offers various activities for kids, along with a pool/slide.",
                          style: TextStyle(
                              fontFamily: 'Raleway',
                              fontWeight: FontWeight.w500,
                              fontSize: 16)),
                      SizedBox(height: 20),
                      Text(
                          "Food and beverage is an important part of life. This is why we want each and every meal to be a culinary experience regardless if you are travelling or just popping in at a nearby hotel for breakfast, brunch, lunch or dinner! Hanging in the bar should be fun and easy, or simply relaxing. Enjoy your dining experiences at Golden Tulip Holland Resort Batu",
                          style: TextStyle(
                              fontFamily: 'Raleway',
                              fontWeight: FontWeight.w500,
                              fontSize: 16)),
                      SizedBox(height: 20),
                      Text(
                          "Food and beverage is an important part of life. This is why we want each and every meal to be a culinary experience regardless if you are travelling or just popping in at a nearby hotel for breakfast, brunch, lunch or dinner! Hanging in the bar should be fun and easy, or simply relaxing. Enjoy your dining experiences at Golden Tulip Holland Resort Batu",
                          style: TextStyle(
                              fontFamily: 'Raleway',
                              fontWeight: FontWeight.w500,
                              fontSize: 16))
                    ],
                  ))
            ],
          )),
    );
  }
}
