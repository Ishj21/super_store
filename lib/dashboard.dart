import 'package:flutter/cupertino.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:super_store/products_class.dart';
import 'api_fetcher.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:google_fonts/google_fonts.dart';

import 'product_info.dart';
import 'package:page_transition/page_transition.dart';

class DashBoard extends StatefulWidget {
  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  List<Products> _products;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Fetcher.getProducts().then((products) {
      _products = products;
      print("Loaded");
    });
    //
  }

  int _value = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Image.asset(
          "lib/images/shop.png",
          scale: 20,
        ),
        title: Text('SuperStore'),
        actions: [
          IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () {
                Navigator.pushNamed(context, '/cart');
              })
        ],
      ),
      body: SingleChildScrollView(
        physics: ScrollPhysics(),
        child: Column(
          children: [
            CarouselSlider(
                items: [
                  Image.asset('lib/images/image.jpg'),
                  Image.asset('lib/images/image2.jpg'),
                  Image.asset('lib/images/image3.jpg'),
                  Image.asset('lib/images/image4.jpg'),
                  Image.asset('lib/images/image5.jpg'),
                ],
                options: CarouselOptions(
                  height: 270,
                  autoPlayInterval: Duration(seconds: 4),
                  autoPlayAnimationDuration: Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  viewportFraction: 1.2,
                  autoPlay: true,
                )),
            Divider(
              height: 5,
              color: Colors.red,
              thickness: 2.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Text("Newly Added Items",
                      style: GoogleFonts.roboto(
                          fontSize: 20, fontWeight: FontWeight.w600)),
                ),
                DropdownButton(
                    iconEnabledColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    value: _value,
                    items: [
                      DropdownMenuItem(
                        child: Row(
                          children: [
                            Icon(Icons.sort),
                            Text(" Sort By:"),
                          ],
                        ),
                        value: 1,
                      ),
                      DropdownMenuItem(
                        child: Text("Price"),
                        value: 2,
                        onTap: () {
                          setState(() {
                            _products
                                .sort((a, b) => a.price.compareTo(b.price));
                          });
                        },
                      ),
                      DropdownMenuItem(
                        child: Text("Rating"),
                        value: 3,
                        onTap: () {
                          setState(() {
                            _products
                                .sort((b, a) => a.rating.compareTo(b.rating));
                          });
                        },
                      ),
                    ],
                    onChanged: (value) {
                      setState(() {
                        print(_products.length);
                      });
                    }),
              ],
            ),
            Divider(
              height: 5,
              color: Colors.red,
              thickness: 2.0,
            ),
            FutureBuilder(
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.data == null) {
                  return Container(
                    child: Center(
                      child: SpinKitCircle(
                        color: Colors.red,
                      ),
                    ),
                  );
                } else {
                  return ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: _products == null ? 0 : _products.length,
                      itemBuilder: (context, index) {
                        Products products = _products[index];
                        print(_products.length);
                        return Container(
                          child: Column(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      PageTransition(
                                          type: PageTransitionType.rightToLeft,
                                          child: ProductInfo(
                                            product: _products[index],
                                          )));
                                },
                                child: Card(
                                  child: Container(
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                right: 5.0),
                                            child: Image.network(
                                              products.image,
                                              gaplessPlayback: true,
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 3,
                                          child: Column(
                                            children: [
                                              Align(
                                                child: Text(
                                                  products.name,
                                                  maxLines: 2,
                                                  style: GoogleFonts.notoSans(
                                                      fontSize: 24,
                                                      fontWeight:
                                                          FontWeight.w300),
                                                ),
                                                alignment: Alignment.centerLeft,
                                              ),
                                              Text(
                                                products.description,
                                                maxLines: 2,
                                                style: GoogleFonts.nunito(
                                                  fontSize: 15,
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                        Expanded(
                                          flex: 1,
                                          child: Column(
                                            children: [
                                              Align(
                                                child: Text(
                                                  "\u20B9" +
                                                      products.price.toString(),
                                                  style:
                                                      TextStyle(fontSize: 20.0),
                                                ),
                                                alignment:
                                                    Alignment.centerRight,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: [
                                                  Icon(
                                                    Icons.star,
                                                    color: Colors.green,
                                                    size: 20.0,
                                                  ),
                                                  Text(products.rating
                                                      .toString()),
                                                ],
                                              ),
                                              Align(
                                                alignment:
                                                    Alignment.bottomRight,
                                                child: GestureDetector(
                                                  onTap: () {},
                                                  child: Icon(Icons
                                                      .shopping_cart_outlined),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    padding: EdgeInsets.all(15.0),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      });
                }
              },
              future: Fetcher.getProducts(),
            )
          ],
        ),
      ),
    );
  }
}
