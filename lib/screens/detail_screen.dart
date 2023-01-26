import 'package:flutter/material.dart';
import 'package:furniture/data/model/furniture_model.dart';
import 'package:furniture/util/constants.dart';

class FurnitureDetailScreen extends StatefulWidget {
  final Furniture furniture;

  const FurnitureDetailScreen({Key? key, required this.furniture})
      : super(key: key);

  @override
  State<FurnitureDetailScreen> createState() => _FurnitureDetailScreenState();
}

class _FurnitureDetailScreenState extends State<FurnitureDetailScreen> {
  bool _isInitialValue = true;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      setState(() {
        _isInitialValue = !_isInitialValue;
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 24),
            child: Icon(
              Icons.favorite_border_rounded,
              color: Colors.black,
            ),
          )
        ],
        title: const Text(
          "Details",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back_outlined,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AnimatedContainer(
            duration: const Duration(seconds: 2),
            margin: const EdgeInsets.fromLTRB(16, 16, 16, 0),
            height: _isInitialValue ? 250 : 300,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: Furniture.randomColor,
                borderRadius: const BorderRadius.all(Radius.circular(30))),
            child: Hero(
                tag: widget.furniture.id,
                child: Image.asset(widget.furniture.furnitureImageUrl)),
          ),
          SizedBox(
            height: 180,
            width: MediaQuery.of(context).size.width,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                ...widget.furniture.furnitureThumbNailsUrl
                    .map((photo) => AnimatedContainer(
                          duration: const Duration(seconds: 2),
                          curve: Curves.easeInOutCirc,
                          margin: const EdgeInsets.all(16),
                          height: _isInitialValue ? 100 : 180,
                          width: _isInitialValue ? 150 : 180,
                          decoration: BoxDecoration(
                              color: Furniture.randomColor,
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(30))),
                          child: Image.asset(photo),
                        ))
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
                      child: Text(widget.furniture.furnitureName,
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge
                              ?.copyWith(
                                  fontWeight: FontWeight.w700, fontSize: 25)),
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 24.0, top: 8),
                          child: Text("\$${widget.furniture.furniturePrice}",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall
                                  ?.copyWith(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 16,
                                      color: Colors.amber)),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 24.0, top: 8),
                          child: Text("Chair price",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall
                                  ?.copyWith(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 12,
                                      color: Colors.black38)),
                        )
                      ],
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 24.0, top: 8, right: 24),
                      child: Text(widget.furniture.furnitureDescription),
                    )
                  ],
                ),
              ),
              Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 4.0, top: 8, bottom: 8),
                    child: Icon(
                      Icons.star_rate_sharp,
                      color: Colors.amber,
                      size: 17,
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 8.0, bottom: 8, right: 24),
                    child: Text(
                      "(${widget.furniture.furnitureRating})",
                      style: const TextStyle(color: Colors.black38),
                    ),
                  )
                ],
              )
            ],
          )
        ],
      )),
      bottomNavigationBar: Container(
        margin: const EdgeInsets.all(24),
        decoration: const BoxDecoration(
            color: primaryColor,
            borderRadius: BorderRadius.all(Radius.circular(20))),
        width: MediaQuery.of(context).size.width,
        height: 55,
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
