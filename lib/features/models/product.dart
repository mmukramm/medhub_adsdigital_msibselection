import 'package:flutter/foundation.dart';

class Product {
  final String name;
  final double price;
  final double rating;
  final List<String> images;
  final String category;
  final String shortCategory;
  final String productDetails;
  final List<ProductPackageSize> packageSize;

  Product({
    required this.name,
    required this.price,
    required this.rating,
    required this.images,
    required this.category,
    required this.shortCategory,
    required this.productDetails,
    required this.packageSize,
  });

  @override
  bool operator ==(covariant Product other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.price == price &&
        other.rating == rating &&
        listEquals(other.images, images) &&
        other.category == category &&
        other.shortCategory == shortCategory &&
        other.productDetails == productDetails &&
        listEquals(other.packageSize, packageSize);
  }

  @override
  int get hashCode {
    return name.hashCode ^
        price.hashCode ^
        rating.hashCode ^
        images.hashCode ^
        category.hashCode ^
        shortCategory.hashCode ^
        productDetails.hashCode ^
        packageSize.hashCode;
  }

  @override
  String toString() {
    return 'Product(name: $name, price: $price, rating: $rating, images: $images, category: $category, shortCategory: $shortCategory, productDetails: $productDetails, packageSize: $packageSize)';
  }
}

class ProductPackageSize {
  final double price;
  final int pelletTotal;
  ProductPackageSize({
    required this.price,
    required this.pelletTotal,
  });

  @override
  String toString() =>
      'ProductPackageSize(price: $price, pelletTotal: $pelletTotal)';

  @override
  bool operator ==(covariant ProductPackageSize other) {
    if (identical(this, other)) return true;
  
    return 
      other.price == price &&
      other.pelletTotal == pelletTotal;
  }

  @override
  int get hashCode => price.hashCode ^ pelletTotal.hashCode;
}
