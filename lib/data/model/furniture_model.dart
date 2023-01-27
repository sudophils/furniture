class Furniture {
  final String id;
  final String furnitureName;
  final String furniturePrice;
  final String furnitureRating;
  final String furnitureDescription;
  final String furnitureImageUrl;
  final List<String> furnitureThumbNailsUrl;

  Furniture(
      {required this.id,
      required this.furnitureName,
      required this.furniturePrice,
      required this.furnitureRating,
      required this.furnitureDescription,
      required this.furnitureImageUrl,
      required this.furnitureThumbNailsUrl});

  static get randomId {
    final random = Random();
    const availableChars =
        'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
    final randomString = List.generate(10,
            (index) => availableChars[random.nextInt(availableChars.length)])
        .join();
    return randomString;
  }

  static get randomColor {
    final random = Random();
    return Colors.primaries[random.nextInt(Colors.primaries.length)]
        .withOpacity(.1);
  }
}
