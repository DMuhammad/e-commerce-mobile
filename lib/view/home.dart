import 'package:flutter/material.dart';
import 'package:uas_mobile/view/detailProduct.dart';
import 'package:uas_mobile/viewmodel/fetchDataProducts.dart';
import 'package:uas_mobile/model/products.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('NIKI Toko'),
      ),
      body: FutureBuilder<List<Product>>(
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
      ),
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
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Image.network(
                      result![index].thumbnail,
                      height: 100,
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                              padding: const EdgeInsets.only(bottom: 8.0),
                              child: Text(
                                result![index].title,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              )),
                          Text("Brand: ${result![index].brand}"),
                          Text("Category: ${result![index].category}"),
                          Text("Price: ${result![index].price}"),
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
