import 'package:flutter/material.dart';

import 'package:belanja_cerdas/search_results.dart';

Color primaryColor = Color(0xFF1E56A0);
Color secondaryColor = Color(0xFFD6E4F0);

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final TextEditingController queryController = TextEditingController();
  String _query = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Image.asset('images/logo.png'),
            ),
            SizedBox(
              height: 24,
            ),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(right: 16.0),
                    child: TextField(
                      controller: queryController,
                      onChanged: (String value) {
                        setState(() {
                          _query = value;
                        });
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(100.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: primaryColor),
                          borderRadius: BorderRadius.circular(100.0),
                        ),
                        hintText: 'Cari',
                      ),
                    ),
                  ),
                ),
                Ink(
                  decoration: ShapeDecoration(
                    color: primaryColor,
                    shape: CircleBorder(),
                  ),
                  child: IconButton(
                    icon: Icon(Icons.search_rounded),
                    color: Colors.white,
                    onPressed: () {
                      if (_query.isNotEmpty) {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return SearchResult(query: _query);
                        }));
                      }
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
