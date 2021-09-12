import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

Color primaryColor = Color(0xFF1E56A0);
Color secondaryColor = Color(0xFFD6E4F0);

class SearchResult extends StatelessWidget {
  final String query;

  SearchResult({required this.query});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondaryColor,
      appBar: AppBar(
        title: Text('Belanja Cerdas'),
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
                        Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: Row(
                            children: [
                              Text('Hasil pencarian: '),
                              Text(
                                '$query',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.filter_alt_outlined,
                                  color: primaryColor,
                                )),
                            IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.sort,
                                  color: primaryColor,
                                )),
                          ],
                        )
                      ],
                    )),
                SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: GridView.count(
                    primary: false,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    crossAxisCount: 2,
                    childAspectRatio: (1 / 2),
                    children: <Widget>[
                      InkWell(
                        onTap: () {
                          _launchURL('https://google.com');
                        },
                        child: Card(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.network(
                                'https://images.tokopedia.net/img/cache/200-square/VqbcmM/2021/5/23/c52f45d8-19bb-4ff6-b5b4-5d43e7a064d8.jpg.webp?ect=4g',
                                fit: BoxFit.fill,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  'Apple Macbook Air 13inch M1 2021 - Garansi Resmi - Grey, 256 gb',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text('Rp 14.899.000'),
                              ),
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text('Tokopedia',
                                    style: TextStyle(
                                      color: Colors.green,
                                      fontSize: 12.0,
                                    )),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
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

_launchURL(url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not open $url';
  }
}
