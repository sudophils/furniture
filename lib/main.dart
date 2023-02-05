import 'package:flutter/material.dart';
import 'package:furniture/screens/furniture_detail_screen.dart';
import 'package:furniture/util/constants.dart';
import 'package:furniture/widgets/furniture_display_tile.dart';
import 'package:furniture/widgets/furniture_menu_item.dart';

import 'data/furniture_data.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //Header
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0),
                    child: Text(
                      "Explore \nCollections",
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge
                          ?.copyWith(fontWeight: FontWeight.w700, fontSize: 25),
                    ),
                  ),
                  //Searchbar

                  Container(
                    height: 60,
                    width: 45,
                    decoration: const BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black12,
                              offset: Offset(0, 0),
                              blurRadius: 0.5,
                              blurStyle: BlurStyle.outer)
                        ]),
                    child: const Center(
                      child: Icon(Icons.search),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 32,
              ),

              SizedBox(
                height: 50,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    FurnitureMenuItem(
                      isSelected: true,
                      icon: Icons.event_seat,
                      onTap: () {},
                    ),
                    FurnitureMenuItem(
                      icon: Icons.lightbulb_outline_rounded,
                      onTap: () {},
                    ),
                    FurnitureMenuItem(
                      icon: Icons.business_center_outlined,
                      onTap: () {},
                    ),
                    FurnitureMenuItem(
                      icon: Icons.airline_seat_legroom_extra_rounded,
                      onTap: () {},
                    ),
                    FurnitureMenuItem(
                      icon: Icons.event_seat,
                      onTap: () {},
                    )
                  ],
                ),
              ),
              // Trends

              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text.rich(TextSpan(
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                        children: [
                          TextSpan(text: "Trendy"),
                          TextSpan(
                              text: " Collections",
                              style: TextStyle(
                                  color: primaryColor,
                                  fontWeight: FontWeight.bold))
                        ])),
                  ),
                  Row(
                    children: const [
                      Text("The Week",
                          style: TextStyle(color: Colors.grey, fontSize: 12)),
                      Padding(
                        padding: EdgeInsets.only(right: 8.0),
                        child: Icon(
                          Icons.keyboard_arrow_down_rounded,
                          color: Colors.grey,
                        ),
                      )
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: 8,
              ),

              Expanded(
                  child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  ...furnitureData.map((item) => FurnitureDisplayTile(
                      photoUrl: item.furnitureImageUrl,
                      name: item.furnitureName,
                      price: item.furniturePrice,
                      rating: item.furnitureRating,
                      id: item.id,
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => FurnitureDetailScreen(
                                      item: item,
                                    )));
                      }))
                ],
              ))
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 80,
        width: MediaQuery.of(context).size.width,
        margin: const EdgeInsets.only(bottom: 16),
        decoration: const BoxDecoration(color: Colors.white),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Icon(
              Icons.home_filled,
              color: primaryColor,
            ),
            const Icon(
              Icons.favorite,
              color: Colors.black26,
            ),
            Container(
              height: 50,
              width: 50,
              decoration: const BoxDecoration(
                  color: primaryColor, shape: BoxShape.circle),
              child: const Icon(
                Icons.shopping_bag,
                color: activeIconColor,
              ),
            ),
            const Icon(
              Icons.settings,
              color: Colors.black26,
            ),
            const Icon(
              Icons.person,
              color: Colors.black26,
            )
          ],
        ),
      ),
    );
  }
}
