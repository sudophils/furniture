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
    return DateTime.now().millisecondsSinceEpoch.toString();
  }
}
