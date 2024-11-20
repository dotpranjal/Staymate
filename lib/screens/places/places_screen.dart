// lib/screens/places/places_screen.dart
import 'package:flutter/material.dart';

class TrendingScreen extends StatelessWidget {
  const TrendingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Trending Products',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: ListView.builder(
              itemCount: samplePlaces.length,
              itemBuilder: (context, index) {
                final place = samplePlaces[index];
                return TrendingCard(place: place);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class TrendingCard extends StatelessWidget {
  final Map<String, dynamic> place;

  const TrendingCard({super.key, required this.place});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      elevation: 4,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 200,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(15),
              ),
            ),
            child: Center(
              child: Image.network(
                place['image'],
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.cover),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  place['name'],
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  place['description'],
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Icon(Icons.star, color: Colors.amber[600], size: 20),
                    const SizedBox(width: 4),
                    Text(
                      place['rating'].toString(),
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Icon(Icons.location_on, color: Colors.blue[600], size: 20),
                    const SizedBox(width: 4),
                    Text(
                      place['location'],
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

final List<Map<String, dynamic>> samplePlaces = [
  {
    'name': 'Lint Cleaner',
    'description': 'Iconic lint cleaning machine.',
    'rating': 4.8,
    'location': 'Philips',
    'image': 'https://img.kwcdn.com/product/temu-avi/image-crop/e52d59d7-ac7c-4846-bcb7-d52ebec9931b.jpg',
  },
  {
    'name': 'White House',
    'description': 'Ancient amphitheater in the heart of US.',
    'rating': 4.7,
    'location': 'USA',
    'image': 'https://media.architecturaldigest.com/photos/6559735fb796d428bef00d25/16:9/w_1280,c_limit/GettyImages-1731443210.jpg'
  },
  // Add more places as needed
];