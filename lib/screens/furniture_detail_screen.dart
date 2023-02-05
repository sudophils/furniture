import 'package:flutter/material.dart';
import 'package:furniture/data/model/furniture_model.dart';

import '../util/constants.dart';

class FurnitureDetailScreen extends StatefulWidget {
  final Furniture item;

  const FurnitureDetailScreen({Key? key, required this.item}) : super(key: key);

  @override
  State<FurnitureDetailScreen> createState() => _FurnitureDetailScreenState();
}

class _FurnitureDetailScreenState extends State<FurnitureDetailScreen> {
  bool _initialSize = true;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      setState(() {
        _initialSize = !_initialSize;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Details",
          style: TextStyle(color: primaryColor),
        ),
        backgroundColor: Colors.white,
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            )),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 24.0),
            child: Icon(
              Icons.favorite_border_rounded,
              color: Colors.black,
            ),
          )
        ],
      ),
      body: SafeArea(
          child: Column(
        children: [
          AnimatedContainer(
            height: _initialSize ? 250 : 300,
            width: MediaQuery.of(context).size.width,
            duration: const Duration(seconds: 2),
            margin: EdgeInsets.fromLTRB(16, 16, 16, 0),
            decoration: BoxDecoration(
                color: Furniture.randomColor,
                borderRadius: BorderRadius.circular(30)),
            child: Hero(
                tag: widget.item.id,
                child: Image.asset(widget.item.furnitureImageUrl)),
          ),
          SizedBox(
            height: 180,
            width: MediaQuery.of(context).size.width,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                ...widget.item.furnitureThumbNailsUrl.map(
                  (photo) => AnimatedContainer(
                    duration: const Duration(seconds: 2),
                    curve: Curves.easeInCirc,
                    margin: EdgeInsets.all(16),
                    height: _initialSize ? 100 : 180,
                    width: _initialSize ? 100 : 180,
                    decoration: BoxDecoration(
                        color: Furniture.randomColor,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(30))),
                    child: Image.asset(photo),
                  ),
                )
              ],
            ),
          ),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 24.0),
                      child: Text(
                        widget.item.furnitureName,
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            fontWeight: FontWeight.w700, fontSize: 25),
                      ),
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 24.0, top: 8),
                          child: Text(
                            "\$${widget.item.furniturePrice}",
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge
                                ?.copyWith(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 16,
                                    color: Colors.amber),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 24.0, top: 8),
                          child: Text(
                            "Chair price",
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall
                                ?.copyWith(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 12,
                                    color: Colors.black38),
                          ),
                        )
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(24, 8, 24, 0),
                      child: Text(widget.item.furnitureDescription),
                    )
                  ],
                ),
              ),
              Row(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 4.0, top: 8, bottom: 8),
                    child: const Icon(
                      Icons.star_rate_sharp,
                      color: Colors.amber,
                      size: 17,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      right: 24.0,
                      top: 8,
                      bottom: 8,
                    ),
                    child: Text("(${widget.item.furnitureRating})"),
                  )
                ],
              )
            ],
          )
        ],
      )),
      bottomNavigationBar: Container(
        height: 55,
        width: MediaQuery.of(context).size.width,
        margin: const EdgeInsets.all(24),
        decoration: const BoxDecoration(
            color: primaryColor,
            borderRadius: BorderRadius.all(Radius.circular(20))),
        child: const Center(
          child: Text(
            "Add to cart",
            style: TextStyle(color: activeIconColor),
          ),
        ),
      ),
    );
  }
}
