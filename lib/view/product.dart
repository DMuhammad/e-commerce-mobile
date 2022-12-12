import 'package:flutter/material.dart';
import 'package:uas_mobile/model/products.dart';
import 'package:uas_mobile/view/detailProduct.dart';
import 'package:uas_mobile/viewmodel/fetchDataProducts.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Product>>(
      future: fetchProduct(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          const Center(
            child: Text("Gagal ambil data"),
          );
        }
        return snapshot.hasData
            ? ListProduct(product: snapshot.data)
            : const Center(child: CircularProgressIndicator());
      },
    );
  }
}

class ListProduct extends StatefulWidget {
  const ListProduct({Key? key, required this.product}) : super(key: key);
  final List<Product>? product;

  @override
  State<ListProduct> createState() => _ListProductState();
}

class _ListProductState extends State<ListProduct> {
  List<Product>? result;

  @override
  void initState() {
    result = widget.product;
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Widget allProductTitle() {
      return Container(
        child: Text(
          'Popular Products',
          style: GoogleFonts.poppins(
              color: const Color(0xff6C5ECF),
              fontSize: 22,
              fontWeight: FontWeight.w600),
        ),
      );
    }

    return Center(
      child: ListView.builder(
        itemCount: result!.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailProduct(
                      product: result![index],
                    ),
                  ));
            },
            child: Card(
              margin: const EdgeInsets.only(top: 14),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Image.network(
                      result![index].thumbnail,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            result![index].brand,
                            style: GoogleFonts.poppins(
                              color: const Color(0xff999999),
                              fontSize: 12,
                            ),
                          ),
                          Padding(
                              padding:
                                  const EdgeInsets.only(bottom: 2.0, top: 2.0),
                              child: Text(
                                result![index].title,
                                style: GoogleFonts.poppins(
                                  color: const Color(0xff2E2E2E),
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                ),
                              )),
                          Text(result![index].category),
                          Text(
                            "Price: \$${result![index].price}",
                            style: GoogleFonts.poppins(
                              color: const Color(0xff2C96F1),
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
