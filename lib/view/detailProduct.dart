import 'package:flutter/material.dart';
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
    Widget judul = Container(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Text(
                      datadetailproduk!.title,
                      style: Theme.of(context).textTheme.headline6,
                    )),
                Text("Brand: ${datadetailproduk!.brand}"),
                Text("Category: ${datadetailproduk!.category}"),
                Text("Price: ${datadetailproduk!.price}"),
              ],
            ),
          )
        ],
      ),
    );

    Widget deskripsi = Container(
      padding: const EdgeInsets.all(16),
      child: Text(
        datadetailproduk!.description,
        style: const TextStyle(height: 1.5, fontSize: 14),
        softWrap: true,
        textAlign: TextAlign.justify,
      ),
    );

    Widget gambar = Image.network(
      datadetailproduk!.thumbnail,
      width: 600,
      fit: BoxFit.cover,
    );

    return Scaffold(
      body: ListView(
        children: <Widget>[gambar, judul, deskripsi],
      ),
    );
  }
}
