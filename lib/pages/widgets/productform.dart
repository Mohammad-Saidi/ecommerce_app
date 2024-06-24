import 'package:devsnode_ecommerce_app/providers/product_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/product.dart';

class ProductForm extends StatefulWidget {
  final int? index;
  final Product? product;

  const ProductForm({this.index, this.product, super.key});

  @override
  State<ProductForm> createState() => _ProductFormState();
}

class _ProductFormState extends State<ProductForm> {
  final _formKey = GlobalKey<FormState>();
  late String _name, _code, _size, _color;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    if (widget.product != null) {
      _name = widget.product!.name;
      _code = widget.product!.code;
      _size = widget.product!.size;
      _color = widget.product!.color;
    } else {
      _name = '';
      _code = '';
      _size = '';
      _color = '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(widget.product == null ? 'Add Product' : 'Edit Product'),
      content: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                initialValue: _name,
                decoration: InputDecoration(
                  labelText: 'Product Name',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a product name';
                  }
                  return null;
                },
                onSaved: (value) {
                  _name = value!;
                },
              ),
              TextFormField(
                initialValue: _code,
                decoration: InputDecoration(labelText: 'Product Code'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a product code';
                  }
                  return null;
                },
                onSaved: (value) {
                  _code = value!;
                },
              ),
              TextFormField(
                initialValue: _size,
                decoration: InputDecoration(labelText: 'Size'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a size';
                  }
                  return null;
                },
                onSaved: (value) {
                  _size = value!;
                },
              ),
              TextFormField(
                initialValue: _color,
                decoration: InputDecoration(labelText: 'Color'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a color';
                  }
                  return null;
                },
                onSaved: (value) {
                  _color = value!;
                },
              ),
            ],
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              _formKey.currentState!.save();
              if (widget.product == null) {
                Provider.of<ProductProvider>(context, listen: false).addProduct(
                  Product(name: _name, code: _code, size: _size, color: _color),
                );
              } else {
                Provider.of<ProductProvider>(context, listen: false)
                    .editProduct(
                  widget.index!,
                  Product(name: _name, code: _code, size: _size, color: _color),
                );
              }
              Navigator.of(context).pop();
            }
          },
          child: Text(widget.product == null ? 'Add' : 'Save'),
        ),
      ],
    );
  }
}
