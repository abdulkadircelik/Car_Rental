import 'package:flutter/foundation.dart';

class Brand with ChangeNotifier {
  final String name;
  final String imageUrl;

  Brand({
    required this.name,
    required this.imageUrl,
  });
}

class Brands with ChangeNotifier {}
