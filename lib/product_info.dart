import 'package:flutter/material.dart';
import 'products_class.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductInfo extends StatelessWidget {
  ProductInfo({@required this.product});
  static const activeButton = Color(0xFFF44336);

  final Products product;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.name),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Expanded(flex: 4, child: Image.network(product.image)),
              Divider(
                height: 2,
                color: Colors.red,
                thickness: 3,
              ),
              Expanded(
                  flex: 1,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(product.name,
                        style: GoogleFonts.notoSans(
                            fontSize: 30, fontWeight: FontWeight.bold)),
                  )),
              Expanded(
                flex: 2,
                child: Text(product.description,
                    style: GoogleFonts.nunito(fontSize: 20)),
              ),
              Expanded(
                flex: 1,
                child: SizedBox.expand(
                  child: Builder(
                    builder: (context) => FlatButton(
                      onPressed: () => _showToast(context),
                      color: activeButton,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      child: Text(
                        "Add to Cart".toUpperCase(),
                        style: TextStyle(color: Colors.white, fontSize: 25),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void _showToast(BuildContext context) {
  final scaffold = Scaffold.of(context);
  scaffold.showSnackBar(
    SnackBar(
      content: const Text('Added to cart'),
    ),
  );
}
