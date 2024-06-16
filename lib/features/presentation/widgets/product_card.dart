import 'package:flutter/material.dart';
import 'package:ngo/features/presentation/widgets/image_list_view_buttons.dart';

import '../../data/model/product.dart';

class ProductCard extends StatefulWidget {
  ProductModel product;
  final Function() onPressed;
  final double width;
  final double height;
  ProductCard(
      {super.key,
      required this.product,
      required this.onPressed,
      required this.width,
      required this.height});

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onPressed,
      child: Card(
          color: Colors.white.withOpacity(0.9),
          child: Container(
            padding: EdgeInsets.all(10.0),
            child: Row(
              children: [
                Expanded(
                  flex: 4,
                  child: Center(
                    child: ImageListViewWithButtons(
                      imageUrls: widget.product.product_pictures_before,
                      isFile: false,
                      width: widget.width / 3,
                      height: 100,
                      isButtonVisible: false,
                    ),
                  ),
                ),
                Expanded(
                  flex: 6,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.product.product_title ?? "NO Title",
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            const Text(
                              "Category : ",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 15),
                            ),
                            Text(
                              widget.product.product_category ?? "No Catgory",
                              style: const TextStyle(fontSize: 15),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          widget.product.product_description_before ??
                              "NO Description",
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
