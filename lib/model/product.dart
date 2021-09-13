import 'package:belanja_cerdas/model/store.dart';

class Product {
  String name;
  String price;
  String imageUrl;
  String siteUrl;
  Store store;

  Product({
    required this.name,
    required this.price,
    required this.imageUrl,
    required this.siteUrl,
    required this.store,
  });
}
