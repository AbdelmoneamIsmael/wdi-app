class Product {
  final String id;
  final String name;
  final String description;
  final double originalPrice;
  final double discountPrice;
  final int? discountPercentage;
  final double rating;
  final int reviewCount;
  final ProductCondition condition;
  final List<String> tags;
  final String? imageUrl;
  final String? category;
  final DateTime createdAt;
  final DateTime updatedAt;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.originalPrice,
    required this.discountPrice,
    this.discountPercentage,
    required this.rating,
    required this.reviewCount,
    required this.condition,
    required this.tags,
    this.imageUrl,
    this.category,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) : createdAt = createdAt ?? DateTime.now(),
       updatedAt = updatedAt ?? DateTime.now();

  bool get hasDiscount => discountPercentage != null && discountPercentage! > 0;

  double get priceDifference => originalPrice - discountPrice;

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'originalPrice': originalPrice,
      'discountPrice': discountPrice,
      'discountPercentage': discountPercentage,
      'rating': rating,
      'reviewCount': reviewCount,
      'condition': condition.value,
      'tags': tags,
      'imageUrl': imageUrl,
      'category': category,
      'hasDiscount': hasDiscount,
      'priceDifference': priceDifference,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      originalPrice: json['originalPrice'].toDouble(),
      discountPrice: json['discountPrice'].toDouble(),
      discountPercentage: json['discountPercentage'],
      rating: json['rating'].toDouble(),
      reviewCount: json['reviewCount'],
      condition: ProductCondition.values.firstWhere(
        (e) => e.value == json['condition'],
        orElse: () => ProductCondition.regular,
      ),
      tags: List<String>.from(json['tags']),
      imageUrl: json['imageUrl'],
      category: json['category'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
    );
  }

  Product copyWith({
    String? id,
    String? name,
    String? description,
    double? originalPrice,
    double? discountPrice,
    int? discountPercentage,
    double? rating,
    int? reviewCount,
    ProductCondition? condition,
    List<String>? tags,
    String? imageUrl,
    String? category,
  }) {
    return Product(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      originalPrice: originalPrice ?? this.originalPrice,
      discountPrice: discountPrice ?? this.discountPrice,
      discountPercentage: discountPercentage ?? this.discountPercentage,
      rating: rating ?? this.rating,
      reviewCount: reviewCount ?? this.reviewCount,
      condition: condition ?? this.condition,
      tags: tags ?? this.tags,
      imageUrl: imageUrl ?? this.imageUrl,
      category: category ?? this.category,
      createdAt: createdAt,
      updatedAt: DateTime.now(),
    );
  }

  @override
  String toString() {
    return 'Product(id: $id, name: $name, price: $discountPrice, rating: $rating)';
  }
}

enum ProductCondition {
  newArrival('NEW'),
  sale('SALE'),
  regular('REGULAR');

  const ProductCondition(this.value);
  final String value;
}

class ProductCatalog {
  final List<Product> _products = [];

  List<Product> get products => List.unmodifiable(_products);

  void addProduct(Product product) {
    _products.add(product);
  }

  void addProducts(List<Product> products) {
    _products.addAll(products);
  }

  void removeProduct(String productId) {
    _products.removeWhere((product) => product.id == productId);
  }

  Product? getProductById(String productId) {
    try {
      return _products.firstWhere((product) => product.id == productId);
    } catch (e) {
      return null;
    }
  }

  List<Product> getProductsByCondition(ProductCondition condition) {
    return _products
        .where((product) => product.condition == condition)
        .toList();
  }

  List<Product> getDiscountedProducts() {
    return _products.where((product) => product.hasDiscount).toList();
  }

  List<Product> getProductsByRating(double minRating) {
    return _products.where((product) => product.rating >= minRating).toList();
  }

  List<Product> searchProducts(String query) {
    final lowercaseQuery = query.toLowerCase();
    return _products.where((product) {
      return product.name.toLowerCase().contains(lowercaseQuery) ||
          product.description.toLowerCase().contains(lowercaseQuery) ||
          product.tags.any((tag) => tag.toLowerCase().contains(lowercaseQuery));
    }).toList();
  }

  List<Product> sortByPrice({bool ascending = true}) {
    final sorted = List<Product>.from(_products);
    sorted.sort((a, b) {
      final comparison = a.discountPrice.compareTo(b.discountPrice);
      return ascending ? comparison : -comparison;
    });
    return sorted;
  }

  List<Product> sortByRating({bool ascending = false}) {
    final sorted = List<Product>.from(_products);
    sorted.sort((a, b) {
      final comparison = a.rating.compareTo(b.rating);
      return ascending ? comparison : -comparison;
    });
    return sorted;
  }
}

class ProductSampleData {
  static List<Product> generateSampleProducts() {
    return [
      Product(
        id: '1',
        name: 'Wireless Bluetooth',
        description: 'High-quality wireless Bluetooth device',
        originalPrice: 129.00,
        discountPrice: 79.00,
        discountPercentage: 38,
        rating: 4.8,
        reviewCount: 120,
        condition: ProductCondition.sale,
        tags: ['wireless', 'bluetooth', 'audio'],
        imageUrl:
            'https://m.media-amazon.com/images/I/51fJJkkrhRL._AC_SY879_.jpg',
      ),
      Product(
        id: '2',
        name: 'Premium Leather Backpack',
        description: 'Durable premium leather backpack',
        originalPrice: 129.00,
        discountPrice: 79.00,
        discountPercentage: 40,
        rating: 4.7,
        reviewCount: 120,
        condition: ProductCondition.sale,
        tags: ['leather', 'backpack', 'premium'],
        imageUrl:
            'https://artisanartistglobal.com/cdn/shop/files/EXBP4th_100__risultato.jpg?v=1712660424',
      ),
      Product(
        id: '3',
        name: 'Minimalist Desk Lamp with USB',
        description: 'Modern minimalist desk lamp with USB ports',
        originalPrice: 129.00,
        discountPrice: 79.00,
        discountPercentage: null,
        rating: 4.5,
        reviewCount: 120,
        condition: ProductCondition.regular,
        tags: ['lamp', 'desk', 'usb', 'minimalist'],
        imageUrl: 'https://m.media-amazon.com/images/I/61js-G6ERKL.jpg',
      ),
      Product(
        id: '4',
        name: 'Smart Watch Series 8 - Fitness',
        description: 'Advanced smartwatch with fitness tracking',
        originalPrice: 129.00,
        discountPrice: 79.00,
        discountPercentage: null,
        rating: 4.9,
        reviewCount: 120,
        condition: ProductCondition.newArrival,
        tags: ['smartwatch', 'fitness', 'wearable'],
        imageUrl:
            'https://ng.jumia.is/unsafe/fit-in/500x500/filters:fill(white)/product/98/4751932/1.jpg?2891',
      ),
      Product(
        id: '5',
        name: 'Ultra HD 4K Action Camera',
        description: 'Professional 4K action camera',
        originalPrice: 129.00,
        discountPrice: 79.00,
        discountPercentage: null,
        rating: 4.6,
        reviewCount: 120,
        condition: ProductCondition.regular,
        tags: ['camera', '4k', 'action', 'video'],
        imageUrl:
            'https://www.maizic.com/cdn/shop/products/51gtfrp27ql_1_b8d35475-238d-4677-98e1-7c6b3f7fd9bb_500x.jpg?v=1679920948',
      ),
      Product(
        id: '6',
        name: 'Stainless Steel Water Bottle',
        description: 'Eco-friendly stainless steel water bottle',
        originalPrice: 129.00,
        discountPrice: 79.00,
        discountPercentage: null,
        rating: 4.8,
        reviewCount: 120,
        condition: ProductCondition.regular,
        tags: ['water bottle', 'stainless steel', 'eco-friendly'],
        imageUrl:
            'https://f.nooncdn.com/p/pzsku/Z21B9668505C34401AACCZ/45/1757938660/1de1832c-3a30-4f6e-a5b2-0b470c8b3dca.jpg?width=800',
      ),
      Product(
        id: '7',
        name: 'Mechanical Gaming Keyboard',
        description: 'Responsive mechanical gaming keyboard',
        originalPrice: 129.00,
        discountPrice: 79.00,
        discountPercentage: null,
        rating: 4.9,
        reviewCount: 120,
        condition: ProductCondition.regular,
        tags: ['keyboard', 'gaming', 'mechanical'],
        imageUrl:
            'https://m.media-amazon.com/images/I/71fRP7KY9hL._AC_SL1500_.jpg',
      ),
    ];
  }
}
