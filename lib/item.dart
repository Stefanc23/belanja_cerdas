import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:belanja_cerdas/model/product.dart';

class Item extends StatelessWidget {
  Product product;

  Item({required this.product});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        _launchURL(product.siteUrl);
      },
      child: Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              product.imageUrl,
              fit: BoxFit.fill,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                product.name,
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(product.price),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(product.store.name,
                  style: TextStyle(
                    color: product.store.brandColor,
                    fontSize: 12.0,
                  )),
            )
          ],
        ),
      ),
    );
  }
}

void _launchURL(url) async =>
    await canLaunch(url) ? await launch(url) : throw 'Could not launch $url';
