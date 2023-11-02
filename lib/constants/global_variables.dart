import 'package:flutter/material.dart';

String uri = 'https://server-hss.onrender.com';

class GlobalVariables {
  // COLORS
  static const appBarGradient = LinearGradient(
    colors: [
      Color.fromARGB(255, 114, 226, 221),
      Color.fromARGB(255, 162, 236, 233),
    ],
    stops: [0.5, 1.0],
  );

  static const secondaryColor = Color.fromARGB(255, 42, 151, 240);
  static const backgroundColor = Colors.white;
  static const Color greyBackgroundCOlor = Color(0xffebecee);
  static var selectedNavBarColor = const Color.fromARGB(255, 22, 148, 232);
  static const unselectedNavBarColor = Colors.black87;

  // STATIC IMAGES
  static const List<String> carouselImages = [
    'https://img.freepik.com/free-psd/flat-design-colorful-supermarket-template_23-2149612619.jpg?w=1800&t=st=1692433820~exp=1692434420~hmac=ce3ba47d8ca424495e7aa32225d2b5522ddd72246a2ffe4fd8c6ee5a6147c2d2',
    'https://img.freepik.com/premium-psd/delicious-cupcakes-social-media-posts_23-2148782360.jpg?w=1800',
    'https://img.freepik.com/premium-psd/healthy-food-instagram-posts-collection_23-2149586045.jpg?w=1800',
  ];

  static const List<Map<String, String>> categoryImages = [
    {
      'title': 'Fruit',
    },
    {
      'title': 'Cake',
    },
    {
      'title': 'Vegetable',
    },
  ];
}
