import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uas_mobile/model/products.dart';
import 'package:uas_mobile/model/detailProduct.dart';
import 'package:uas_mobile/viewmodel/fetchDetailDataProducts.dart';

class DetailProduct extends StatelessWidget {
  const DetailProduct({Key? key, required this.product}) : super(key: key);
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail Product"),
        backgroundColor: const Color(0xff242231),
      ),
      body: FutureBuilder<DetailProduk>(
        future: fetchDetailProduct(product.id),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            const Center(
              child: Text("Gagal ambil data"),
            );
          }
          return snapshot.hasData
              ? TampilDetailProduct(datadetailproduk: snapshot.data)
              : const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}

class TampilDetailProduct extends StatelessWidget {
  const TampilDetailProduct({Key? key, required this.datadetailproduk})
      : super(key: key);
  final DetailProduk? datadetailproduk;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff242231),
      body: ListView(
        children: [
          CarouselSlider(
            items: datadetailproduk!.images
                .map((image) => Center(
                      child: Image.network(
                        image,
                        width: 600,
                        fit: BoxFit.cover,
                      ),
                    ))
                .toList(),
            options: CarouselOptions(
              aspectRatio: 2.0,
              enlargeCenterPage: true,
              enlargeStrategy: CenterPageEnlargeStrategy.scale,
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.only(bottom: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              datadetailproduk!.title,
                              style: GoogleFonts.poppins(
                                  color: const Color(0xffE1E1E1),
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600),
                            ),
                            Text(
                              "\$${datadetailproduk!.price}",
                              style: GoogleFonts.poppins(
                                  color: const Color(0xff2C96F1),
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        datadetailproduk!.brand,
                        style:
                            GoogleFonts.poppins(color: const Color(0xff999999)),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Rating : ${datadetailproduk!.rating}/5',
                        style: GoogleFonts.poppins(color: Colors.white),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Stock : ${datadetailproduk!.stock}',
                        style: GoogleFonts.poppins(color: Colors.white),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Description :',
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          height: 1.5,
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        datadetailproduk!.description,
                        style: GoogleFonts.poppins(
                          color: const Color(0xff999999),
                          height: 1.5,
                          fontSize: 12,
                        ),
                      ),
                      // Container(
                      //   padding: const EdgeInsets.all(16),
                      //   child: Column(
                      //     crossAxisAlignment: CrossAxisAlignment.start,
                      //     children: [
                      //     ],
                      //   ),
                      // ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
