import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ngo/features/presentation/widgets/image_list_view_buttons.dart';

import '../../data/model/product.dart';
import '../bloc/home/home_bloc.dart';
import '../bloc/home/home_event.dart';
import '../bloc/home/home_state.dart';
import 'overlay_widget.dart';

Widget displayproduct(
  BuildContext context,
  int index,
  HomeState state,
  double width,
  double height,
  OverlayWidget overlayWidget,
) {
  ProductModel product = state.products![index];
  return SafeArea(
    child: Padding(
      padding: const EdgeInsets.all(20.0),
      child: Card(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                        onPressed: () {
                          overlayWidget.hide();
                          BlocProvider.of<HomeBloc>(context)
                              .add(ToggleProductInformationEvent(index));
                        },
                        icon: const Icon(Icons.cancel_outlined))
                  ],
                ),
                ImageListViewWithButtons(
                  width: width,
                  height: height / 5,
                  isFile: false,
                  imageUrls: product.product_pictures_before,
                  isButtonVisible: true,
                ),
                const SizedBox(
                  height: 10,
                ),
                Center(
                  child: Text(
                    product.product_title!,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ),
                Center(
                  child: Text(
                    product.product_category!,
                    style: TextStyle(fontSize: 15),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    infoChild(
                        "Description", product.product_description_before),
                    infoChild("Defects", product.product_defects_before),
                    infoChild(
                        "Area of Donation", product.product_area_of_donation),
                    infoChild(
                        "Collection Status",
                        product.product_collection_status == true
                            ? "Collected"
                            : "Not Collected"),
                    infoChild(
                        "Reimbursement Status",
                        product.product_reimbursement_status == true
                            ? "True"
                            : "False"),
                    infoChild(
                        "Repair Status",
                        product.product_repair_status == true
                            ? "Repaired"
                            : "Not Repaired"),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    ),
  );
}

Widget infoChild(String key, String? value) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        key,
        style: TextStyle(color: Colors.black, fontSize: 15),
      ),
      Text(
        value ?? "",
        style: TextStyle(color: Colors.grey, fontSize: 15),
      )
    ],
  );
}
