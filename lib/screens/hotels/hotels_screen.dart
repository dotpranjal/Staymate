// lib/screens/products/products_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  final CardSwiperController controller = CardSwiperController();

  // Sample product data
  final List<Map<String, dynamic>> products = [
    {
      'name': 'Lint Cleaner',
      'price': 499,
      'rating': 4.8,
      'location': 'Nova',
      'description': 'An all purpose lint cleaner',
      'amenities': ['Cheap', 'Nova', 'Lint', 'Recommended'],
      'image': 'https://m.media-amazon.com/images/I/71urPVaYv8L.jpg',
    },
    {
      'name': 'Sports Bag',
      'price': 299,
      'rating': 4.6,
      'location': 'Skybags',
      'description': 'Multi purpose bag',
      'amenities': ['Private', 'Spa', 'Water Sports', 'Infinity Pool'],
      'image': 'https://nwscdn.com/media/wysiwyg/2021/BagOpen_-_Soccer-Bag.jpg',
    },
    {
      'name': 'Toblerone',
      'price': 199,
      'rating': 4.7,
      'location': 'Swiss Alps',
      'description': 'Cadbury chocolate with smooth texture',
      'amenities': ['Smooth', 'Chocolates', 'Fireplace', 'Trails'],
      'image': 'https://media.istockphoto.com/id/458095163/photo/toblerone-chocolate-bar.jpg?s=612x612&w=0&k=20&c=kLwKfMtCswfN0SWzkEMW-PrpgGAfCK-hZBrJdtCOzDE=',
    },
    {
      'name': 'Deodrant Inspire',
      'price': 249,
      'rating': 4.5,
      'location': 'KS',
      'description': 'Modern luxury',
      'amenities': ['Bar', 'Deo', 'Restore', 'Fragnance'],
      'image': 'https://m.media-amazon.com/images/I/61HJyR+i8LL.jpg',
    },
    {
      'name': 'Tropical Chocolates',
      'price': 399,
      'rating': 4.9,
      'location': 'Cadbury',
      'description': 'Luxurious chocolates',
      'amenities': ['Pool', 'Yoga Bar', 'Access', 'Sweets'],
      'image': 'https://m.media-amazon.com/images/I/41ywosPQZyL._AC_UF1000,1000_QL80_.jpg',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          // Search and filter section
          Container(
            margin: const EdgeInsets.only(bottom: 16),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: const TextField(
                      decoration: InputDecoration(
                        icon: Icon(Icons.search),
                        hintText: 'Search products...',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                IconButton(
                  onPressed: () {
                    // Add filter functionality
                  },
                  icon: const Icon(Icons.filter_list),
                ),
              ],
            ),
          ),
          // Swiper section
          Expanded(
            child: CardSwiper(
              controller: controller,
              cardsCount: products.length,
              onSwipe: _onSwipe,
              onUndo: _onUndo,
              numberOfCardsDisplayed: 2,
              backCardOffset: const Offset(40, 40),
              padding: const EdgeInsets.all(24.0),
              cardBuilder: (context, index, horizontalThreshold, verticalThreshold) => 
                ProductSwipeCard(product: products[index]),
            ),
          ),
          const SizedBox(height: 20),
          // Action buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildActionButton(
                onTap: () => controller.swipeLeft(),
                icon: Icons.close,
                backgroundColor: Colors.red,
              ),
              _buildActionButton(
                onTap: () => controller.swipeTop(),
                icon: Icons.star,
                backgroundColor: Colors.blue,
              ),
              _buildActionButton(
                onTap: () => controller.swipeRight(),
                icon: Icons.favorite,
                backgroundColor: Colors.green,
              ),
            ],
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _buildActionButton({
    required VoidCallback onTap,
    required IconData icon,
    required Color backgroundColor,
  }) {
    return FloatingActionButton(
      onPressed: onTap,
      backgroundColor: backgroundColor,
      child: Icon(icon),
    );
  }

  bool _onSwipe(int previousIndex, int? currentIndex, CardSwiperDirection direction) {
    final product = products[previousIndex];
    switch (direction) {
      case CardSwiperDirection.right:
        debugPrint('Liked: ${product['name']}');
        break;
      case CardSwiperDirection.left:
        debugPrint('Disliked: ${product['name']}');
        break;
      case CardSwiperDirection.top:
        debugPrint('Saved: ${product['name']}');
        break;
      default:
        break;
    }
    return true;
  }

  bool _onUndo(int? previousIndex, int currentIndex, CardSwiperDirection direction) {
    debugPrint('Undo swipe');
    return true;
  }
}

class ProductSwipeCard extends StatelessWidget {
  final Map<String, dynamic> product;

  const ProductSwipeCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Stack(
          children: [
            // product image (placeholder)
            Image.network(
                product['image'],
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.cover),

            
            // product information
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                      Colors.black.withOpacity(0.9),
                      Colors.transparent,
                    ],
                  ),
                ),
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            product['name'],
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            '\$${product['price']}',
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Icon(
                          Icons.location_on,
                          color: Colors.white.withOpacity(0.8),
                          size: 16,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          product['location'],
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.8),
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(width: 16),
                        const Icon(
                          Icons.star,
                          color: Colors.amber,
                          size: 16,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          '${product['rating']}',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      product['description'],
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.8),
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: (product['amenities'] as List<String>)
                          .map((amenity) => Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 8,
                                  vertical: 4,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.2),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Text(
                                  amenity,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                  ),
                                ),
                              ))
                          .toList(),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  
}