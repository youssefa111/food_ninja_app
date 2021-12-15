import 'dart:convert';

class MenuItem {
  final int menuItemID;
  final int restaurantID;
  final String imagePath;
  final String foodName;
  final String restaurantName;
  final double price;
  final bool isLiked;
  final bool isPopular;
  final int ordersNum;
  final double rate;

  MenuItem({
    required this.menuItemID,
    required this.restaurantID,
    required this.imagePath,
    required this.foodName,
    required this.restaurantName,
    required this.price,
    this.isLiked = false,
    this.isPopular = false,
    this.ordersNum = 0,
    this.rate = 0,
  });

  Map<String, dynamic> toMap() {
    return {
      'menuItemID': menuItemID,
      'restaurantID': restaurantID,
      'imagePath': imagePath,
      'foodName': foodName,
      'restaurantName': restaurantName,
      'price': price,
      'isLiked': isLiked,
      'isPopular': isPopular,
      'ordersNum': ordersNum,
      'rate': rate,
    };
  }

  factory MenuItem.fromMap(Map<String, dynamic> map) {
    return MenuItem(
      menuItemID: map['menuItemID']?.toInt() ?? 0,
      restaurantID: map['restaurantID']?.toInt() ?? 0,
      imagePath: map['imagePath'] ?? '',
      foodName: map['foodName'] ?? '',
      restaurantName: map['restaurantName'] ?? '',
      price: map['price']?.toDouble() ?? 0.0,
      isLiked: map['isLiked'] ?? false,
      isPopular: map['isPopular'] ?? false,
      ordersNum: map['ordersNum']?.toInt() ?? 0,
      rate: map['rate']?.toDouble() ?? 0.0,
    );
  }

  String toJson() => json.encode(toMap());

  factory MenuItem.fromJson(String source) =>
      MenuItem.fromMap(json.decode(source));
}
