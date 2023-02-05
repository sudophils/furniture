import 'package:flutter/material.dart';

import '../data/model/furniture_model.dart';
import '../util/constants.dart';

class FurnitureDisplayTile extends StatelessWidget {
  final String photoUrl;
  final String name;
  final String price;
  final String rating;
  final String id;
  final Function() onTap;

  const FurnitureDisplayTile(
      {Key? key,
      required this.photoUrl,
      required this.name,
      required this.price,
      required this.rating,
      required this.id,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.all(16),
        width: size.width / 1.2,
        decoration: BoxDecoration(
            color: Furniture.randomColor,
            borderRadius: BorderRadius.all(Radius.circular(40))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Hero(
                tag: id,
                child: Image.asset(
                  photoUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 24.0),
              child: Text(
                name,
                style: Theme.of(context)
                    .textTheme
                    .titleLarge
                    ?.copyWith(fontWeight: FontWeight.w700, fontSize: 20),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 24.0),
              child: Text(
                "\$$price",
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                    color: Colors.amber),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 24.0),
                      child: Text(
                        "Chair price",
                        style: Theme.of(context).textTheme.titleSmall?.copyWith(
                            fontWeight: FontWeight.w700,
                            fontSize: 12,
                            color: Colors.black38),
                      ),
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Container(
                      width: 65,
                      height: 30,
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      child: Row(
                        children: [
                          const Padding(
                            padding:
                                EdgeInsets.only(left: 4.0, top: 8, bottom: 8),
                            child: Icon(
                              Icons.star_rate_sharp,
                              size: 17,
                              color: Colors.amber,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                right: 4.0, top: 8, bottom: 8),
                            child: Text(
                              "($rating)",
                              style: const TextStyle(color: Colors.black38),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.only(right: 24.0),
                  child: CircleAvatar(
                    backgroundColor: primaryColor,
                    child: Icon(
                      Icons.add,
                      color: activeIconColor,
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
