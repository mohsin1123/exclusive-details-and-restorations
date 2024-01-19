import 'package:exclusive_details_and_restorations/const/text.dart';
import 'package:exclusive_details_and_restorations/views/product_detail.dart';
import 'package:flutter/material.dart';
import 'package:woocommerce_api/woocommerce_api.dart';

class EcommerceTest extends StatefulWidget {
  EcommerceTest({
    Key? key,
  }) : super(key: key);

  @override
  _EcommerceTestState createState() => _EcommerceTestState();
}

class _EcommerceTestState extends State<EcommerceTest> {
  Future _getProducts() async {
    // Initialize the API
    WooCommerceAPI wooCommerceAPI = WooCommerceAPI(
        url: "https://exclusive-details.com/",
        consumerKey: "ck_d61953caad0c6c99ca5d42ea8c47ce579d1d037c",
        consumerSecret: "cs_e2474096c2361bcaae48810631a3a6d4b3b44cf4");

    // Get data using the "products" endpoint
    var products = await wooCommerceAPI.getAsync("products");
    return products;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            const Color.fromRGBO(0, 40, 70, 100),
            Colors.red.shade900,
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: const Color.fromRGBO(0, 40, 70, 100),
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.white),
          backgroundColor: const Color.fromRGBO(0, 40, 70, 100),
          title: const CustomText(
            text: "Shop",
            color: Colors.white,
          ),
          actions: [
            SizedBox(
              width: 100,
              child: Image.asset("assets/images/exclusive-details-rename.png"),
            )
          ],
        ),
        body: FutureBuilder(
          future: _getProducts(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              // Create a list of products
              return GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 8,
                    crossAxisSpacing: 8,
                    mainAxisExtent: 300,
                  ),
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProductDetailView(
                              img: snapshot.data[index]["images"][0]["src"]
                                  .toString(),
                              text: snapshot.data[index]["name"].toString(),
                              category: snapshot.data[index]["categories"][0]
                                      ["name"]
                                  .toString(),
                              desc: snapshot.data[index]["description"],
                              price: snapshot.data[index]["price"],
                            ),
                          ),
                        );
                      },
                      child: Column(
                        children: [
                          Image.network(
                              snapshot.data[index]["images"][0]["src"]),
                          CustomText(
                            text: snapshot.data[index]["name"],
                            color: Colors.white,
                            size: 18,
                          ),
                          ElevatedButton(
                              style: const ButtonStyle(
                                  backgroundColor:
                                      MaterialStatePropertyAll<Color>(
                                          Colors.black)),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ProductDetailView(
                                      img: snapshot.data[index]["images"][0]
                                              ["src"]
                                          .toString(),
                                      text: snapshot.data[index]["name"]
                                          .toString(),
                                      category: snapshot.data[index]
                                              ["categories"][0]["name"]
                                          .toString(),
                                      desc: snapshot.data[index]["description"],
                                      price: snapshot.data[index]["price"],
                                    ),
                                  ),
                                );
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: CustomText(
                                  text: "Buy now for \$" +
                                      snapshot.data[index]["price"],
                                  size: 12,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              )),
                        ],
                      ),
                    );
                  });
            }

            // Show a circular progress indicator while loading products
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}
