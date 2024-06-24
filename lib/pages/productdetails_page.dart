import 'package:flutter/material.dart';

import '../models/product.dart';

class ProductDetailsPage extends StatelessWidget {
  final Product product;

  const ProductDetailsPage({required this.product, super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Align(
                alignment: Alignment.topLeft,
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.list,
                    size: 30.0,
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(
                height: 5.0,
              ),

              TextField(
                decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
                  //filled: true,
                  fillColor: Colors.grey[200],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.zero,
                    borderSide:
                        const BorderSide(color: Colors.black, width: 0.0),
                  ),
                  suffixIcon: Icon(Icons.search),
                ),
              ),

              // Card(
              //   elevation: 3.0,
              //   shape: RoundedRectangleBorder(
              //     borderRadius: BorderRadius.zero,
              //   ),
              //   child: Padding(
              //     padding: const EdgeInsets.all(8.0),
              //     child: Column(
              //       crossAxisAlignment: CrossAxisAlignment.start,
              //       children: [
              //         Text(
              //           '${product.name}',
              //           style: TextStyle(
              //               fontWeight: FontWeight.bold, fontSize: 20.0),
              //         ),
              //         SizedBox(
              //           height: 5.0,
              //         ),
              //         Text('Product Code: ${product.code}'),
              //         SizedBox(
              //           height: 5.0,
              //         ),
              //         Text('Size: ${product.size}'),
              //         SizedBox(
              //           height: 5.0,
              //         ),
              //         Text('Color: ${product.color}'),
              //         SizedBox(
              //           height: 5.0,
              //         ),
              //         Table(
              //           border: TableBorder.all(color: Colors.black),
              //           children: [
              //             TableRow(
              //               children: [
              //                 Padding(
              //                   padding: const EdgeInsets.all(8.0),
              //                   child: Text("XL"),
              //                 ),
              //                 Padding(
              //                   padding: const EdgeInsets.all(8.0),
              //                   child: Text("100"),
              //                 ),
              //               ],
              //             ),
              //             TableRow(
              //               children: [
              //                 Padding(
              //                   padding: const EdgeInsets.all(8.0),
              //                   child: Text("XL"),
              //                 ),
              //                 Padding(
              //                   padding: const EdgeInsets.all(8.0),
              //                   child: Text("100"),
              //                 ),
              //               ],
              //             ),
              //             TableRow(
              //               children: [
              //                 Padding(
              //                   padding: const EdgeInsets.all(8.0),
              //                   child: Text("XL"),
              //                 ),
              //                 Padding(
              //                   padding: const EdgeInsets.all(8.0),
              //                   child: Text("100"),
              //                 ),
              //               ],
              //             ),
              //             TableRow(
              //               children: [
              //                 Padding(
              //                   padding: const EdgeInsets.all(8.0),
              //                   child: Text("XL"),
              //                 ),
              //                 Padding(
              //                   padding: const EdgeInsets.all(8.0),
              //                   child: Text("100"),
              //                 ),
              //               ],
              //             ),
              //           ],
              //         ),
              //         SizedBox(
              //           height: 10.0,
              //         ),
              //         Row(
              //           children: [
              //             Expanded(
              //               child: Container(
              //                 decoration: BoxDecoration(
              //                   gradient: LinearGradient(
              //                     colors: [
              //                       Color(0xFF4A00E0),
              //                       Color(0xFF8E2DE2),
              //                     ],
              //                     begin: Alignment.topLeft,
              //                     end: Alignment.bottomRight,
              //                   ),
              //                 ),
              //                 child: ElevatedButton(
              //                   onPressed: () {},
              //                   child: const Text(
              //                     'Order History',
              //                     style: TextStyle(color: Colors.white),
              //                   ),
              //                   style: ElevatedButton.styleFrom(
              //                     shape: RoundedRectangleBorder(
              //                       borderRadius: BorderRadius.zero,
              //                     ),
              //                     shadowColor: Colors.transparent,
              //                     backgroundColor: Colors.transparent,
              //                   ),
              //                 ),
              //               ),
              //             ),
              //           ],
              //         ),
              //         SizedBox(
              //           height: 10.0,
              //         ),
              //       ],
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
