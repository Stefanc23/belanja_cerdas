// ignore_for_file: import_of_legacy_library_into_null_safe

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:html/parser.dart' as parser;
import 'package:http/http.dart' as http;

import 'package:belanja_cerdas/model/product.dart';
import 'package:belanja_cerdas/model/store.dart';

Color primaryColor = Color(0xFF1E56A0);
Color secondaryColor = Color(0xFFD6E4F0);

class SearchResult extends StatefulWidget {
  final String query;

  SearchResult({required this.query});

  @override
  _SearchResultState createState() => _SearchResultState();
}

class _SearchResultState extends State<SearchResult> {
  bool isLoading = false;
  List<Product> productList = [];

  Future<List<Product>> findProduct(Store store, String query) async {
    List<Product> productsFound = [];

    final response = await http.Client()
        .get(Uri.parse('${store.queryPrefix}$query${store.queryPostfix}'));

    if (response.statusCode == 200) {
      var document = parser.parse(response.body);
      try {
        var names = document
            .getElementsByClassName(store.productNameContainerElementClassName);
        var prices =
            document.getElementsByClassName(store.productPriceElementClassName);
        var imageUrls = document.getElementsByClassName(
            store.productImageUrlContainerElementClassName);
        var siteUrls = document.getElementsByClassName(
            store.productSiteUrlContainerElementClassName);

        for (int i = 0; i < imageUrls.length; ++i) {
          Product product = new Product(
              name: (store.name != 'Bukalapak'
                  ? names[i].text.trim()
                  : names[i].firstChild!.text!.trim()),
              price: prices[i].text.trim().replaceAll(' ', ''),
              imageUrl: (store.name != 'Bukalapak'
                  ? imageUrls[i].firstChild!.attributes['src'].toString()
                  : imageUrls[i].attributes['src'].toString()),
              siteUrl: siteUrls[i].firstChild!.attributes['href'].toString(),
              store: store);

          productsFound.add(product);
        }
        // if (store.name == 'Shopee')
        //   print('${productsFound.toString()} ${document.toString()}');
        return productsFound;
      } catch (e) {
        throw e;
      }
    } else {
      return [];
    }
  }

  @override
  void initState() {
    List<Product> productsFound = [];

    setState(() {
      isLoading = true;
    });

    Future.delayed(Duration.zero, () async {
      for (int i = 0; i < stores.length; ++i) {
        productsFound += await findProduct(stores[i], widget.query);
      }

      productsFound.shuffle();

      setState(() {
        productList = productsFound;
        isLoading = false;
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondaryColor,
      appBar: AppBar(
        title: Text('Belanja Cerdas'),
        centerTitle: true,
        backgroundColor: primaryColor,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    width: double.infinity,
                    height: 36,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(3),
                        color: Colors.white),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: Row(
                              children: [
                                Text('Hasil pencarian dari: '),
                                Expanded(
                                  child: SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Text(
                                      '${widget.query}',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    )),
                SizedBox(
                  height: 10,
                ),
                isLoading
                    ? Expanded(
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      )
                    : Expanded(
                        child: RefreshIndicator(
                          child: GridView.count(
                              primary: false,
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 10,
                              crossAxisCount: 2,
                              childAspectRatio: (1 / 2),
                              children: productList
                                  .map(
                                    (product) => Item(product: product),
                                  )
                                  .toList()),
                          onRefresh: () {
                            return Future.delayed(Duration.zero, () async {
                              List<Product> productsFound = [];

                              for (int i = 0; i < stores.length; ++i) {
                                productsFound +=
                                    await findProduct(stores[i], widget.query);
                              }

                              productsFound.shuffle();

                              setState(() {
                                productList = productsFound;
                              });
                            });
                          },
                        ),
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

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
