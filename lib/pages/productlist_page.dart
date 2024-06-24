import 'package:devsnode_ecommerce_app/pages/productdetails_page.dart';
import 'package:devsnode_ecommerce_app/pages/widgets/productform.dart';
import 'package:devsnode_ecommerce_app/providers/product_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductlistPage extends StatefulWidget {
  const ProductlistPage({super.key});

  @override
  State<ProductlistPage> createState() => _ProductlistPageState();
}

class _ProductlistPageState extends State<ProductlistPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color(0xFF4A00E0),
                      Color(0xFF8E2DE2),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20.0),
                      bottomRight: Radius.circular(20.0))),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.list,
                        size: 30.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 25.0,
                  ),
                  TextField(
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.only(left: 10.0),
                      // contentPadding: const EdgeInsets.symmetric(
                      //     horizontal: 20.0, vertical: 15.0),
                      //filled: true,
                      //fillColor: Colors.white,
                      border: InputBorder.none,
                      suffixIcon: OutlinedButton(
                        onPressed: () {},
                        child: Icon(
                          Icons.search,
                          color: Colors.white,
                        ),
                        style: OutlinedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(0.0),
                          ),
                          side: BorderSide(color: Colors.white),
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.zero,
                        borderSide: BorderSide(color: Colors.white, width: 2),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.zero,
                        borderSide: BorderSide(color: Colors.white, width: 2),
                      ),
                    ),
                    style: TextStyle(color: Colors.white),
                    cursorColor: Colors.white,
                  ),
                  SizedBox(
                    height: 25.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Product List',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25.0,
                            color: Colors.white),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) => ProductForm(),
                          );
                        },
                        child: const Text(
                          'Add Product',
                          style: TextStyle(color: Colors.black),
                        ),
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(2.0)),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 25.0,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Expanded(
              child: Consumer<ProductProvider>(
                builder: (context, productProvider, child) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListView.builder(
                      itemCount: productProvider.products.length,
                      itemBuilder: (context, index) {
                        final product = productProvider.products[index];
                        // return Card(
                        //   elevation: 5.0,
                        //   shape: RoundedRectangleBorder(
                        //     borderRadius: BorderRadius.zero,
                        //     side: BorderSide(color: Colors.black, width: 1.0),
                        //   ),
                        //   child: Padding(
                        //     padding: const EdgeInsets.all(10.0),
                        //     child: Column(
                        //       mainAxisSize: MainAxisSize.min,
                        //       crossAxisAlignment: CrossAxisAlignment.start,
                        //       children: [
                        //         Text(
                        //           '${product.name}',
                        //           style: TextStyle(
                        //               fontWeight: FontWeight.bold,
                        //               fontSize: 20.0),
                        //         ),
                        //         SizedBox(
                        //           height: 5.0,
                        //         ),
                        //         Text('Color: ${product.color}'),
                        //         SizedBox(
                        //           height: 5.0,
                        //         ),
                        //         Text('Size: ${product.size}'),
                        //         SizedBox(
                        //           height: 5.0,
                        //         ),
                        //         Container(
                        //           decoration: BoxDecoration(
                        //             gradient: LinearGradient(
                        //               colors: [
                        //                 Color(0xFF4A00E0),
                        //                 Color(0xFF8E2DE2),
                        //               ],
                        //               begin: Alignment.topLeft,
                        //               end: Alignment.bottomRight,
                        //             ),
                        //
                        //           ),
                        //           child: ElevatedButton(
                        //             style: ElevatedButton.styleFrom(
                        //               shape: RoundedRectangleBorder(
                        //                 borderRadius: BorderRadius.zero,
                        //               ),
                        //               backgroundColor: Colors.transparent,
                        //               shadowColor: Colors.transparent,
                        //             ),
                        //             onPressed: () {
                        //               Navigator.push(
                        //                   context,
                        //                   MaterialPageRoute(
                        //                       builder: (context) =>
                        //                           ProductDetailsPage(
                        //                               product: product)));
                        //             },
                        //             child: const Text('Details', style: TextStyle(color: Colors.white),),
                        //           ),
                        //         ),
                        //       ],
                        //     ),
                        //   ),
                        // );
                        return Card(
                          clipBehavior: Clip.antiAlias,
                          child: Column(
                            children: [
                              ListTile(
                                leading: Icon(Icons.arrow_drop_down_circle),
                                title: Text(product.name),
                                subtitle: Text(
                                  product.code,
                                  style: TextStyle(
                                      color: Colors.black.withOpacity(0.6)),
                                ),
                              ),
                              SizedBox(
                                height: 100,
                                width: double.infinity,
                                child: Image.asset('assets/images/guchchi_bag.jpg', fit: BoxFit.fill,),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Text(
                                  'Greyhound divisively hello coldly wonderfully marginally far upon excluding.',
                                  style: TextStyle(
                                      color: Colors.black.withOpacity(0.6)),
                                ),
                              ),
                              ButtonBar(
                                alignment: MainAxisAlignment.start,
                                children: [
                                  TextButton(
                                    onPressed: () {},
                                    child: const Text('DELETE'),
                                  ),
                                  TextButton(
                                    onPressed: () {},
                                    child: const Text('UPDATE'),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ListTile(
//
// title: Text(product.name),
// subtitle: Text('Code: ${product.code}, Size: ${product.size}, Color: ${product.color}'),
// trailing: IconButton(
// onPressed: () {
// showDialog(
// context: context,
// builder: (context) => ProductForm(
// index: index,
// product: product,
// ),
// );
// },
// icon: Icon(Icons.edit),
// ),
// onTap: () {
// Navigator.push(context, MaterialPageRoute(builder: (context) => ProductDetailsPage(product: product)));
// },
// );
