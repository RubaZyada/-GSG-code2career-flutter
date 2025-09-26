import 'package:flutter/material.dart';
import 'package:gsg_flutter/data/product_model.dart';
import 'package:gsg_flutter/products/product_details.dart';

class ProductWidget extends StatelessWidget {
  const ProductWidget({super.key, required this.model});
  final ProductModel model;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ProductDetails(model: model)),
        );
      },
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: NetworkImage(model.image),
          radius: 40,
        ),
        title: Text(model.title),
        subtitle: Row(
          children: [
            Text(model.rating.toString()),
            Icon(Icons.star, color: Colors.amber, size: 16),
            Text('(${model.ratingCount.toString()})'),
          ],
        ),
        trailing: Text('\$${model.price.toString()}'),
      ),
    );
  }
}
