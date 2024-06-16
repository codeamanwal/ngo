import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:ngo/features/data/model/donor.dart';
import 'package:ngo/features/presentation/widgets/overlay_widget.dart';

import '../../data/model/product.dart';
import '../bloc/home/home_bloc.dart';
import '../bloc/home/home_event.dart';

Widget LoadingWidget(
    double width, double height, OverlayWidget? overlayWidget) {
  return Container(
    width: width,
    height: height,
    color: Colors.black.withOpacity(0.5),
    child: Center(
      child: Card(
        color: Colors.white.withOpacity(0.95),
        child: Container(
          width: width / 2,
          height: width / 2,
          color: Colors.transparent,
          child: Center(
            child: SpinKitFadingCircle(
              size: width / 4,
              color: Colors.black.withOpacity(0.5),
            ),
          ),
        ),
      ),
    ),
  );
}

Widget menuDialogLoggedIn(
  BuildContext context,
  OverlayWidget overlayWidget,
  List<ProductModel>? productList,
  DonorModel donorModel,
) {
  return Center(
    child: Container(
      height: 300,
      margin: EdgeInsets.symmetric(horizontal: 50),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(20)),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                    onPressed: () {
                      overlayWidget.hide();
                      BlocProvider.of<HomeBloc>(context)
                          .add(ToggleMenuDialogEvent());
                    },
                    icon: Icon(Icons.cancel_outlined))
              ],
            ),
          ),
          Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  FilledButton(
                    onPressed: () {
                      overlayWidget.hide();
                      BlocProvider.of<HomeBloc>(context)
                          .add(ToggleMenuDialogEvent());
                      Navigator.pushNamed(context, '/profile', arguments: {
                        'productList': productList,
                        'donorModel': donorModel
                      });
                    },
                    child: Text("Profile"),
                  ),
                  FilledButton(
                    onPressed: () {
                      overlayWidget.hide();
                      BlocProvider.of<HomeBloc>(context)
                          .add(ToggleMenuDialogEvent());
                      Navigator.pushNamed(context, '/donate').whenComplete(() =>
                          BlocProvider.of<HomeBloc>(context)
                              .add(GetProductsEvent()));
                    },
                    child: Text("Donate"),
                  ),
                  FilledButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateColor.resolveWith(
                            (states) => Colors.redAccent)),
                    onPressed: () {
                      overlayWidget.hide();
                      BlocProvider.of<HomeBloc>(context).add(LogOutEvent());
                    },
                    child: Text("Log Out"),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

Widget menuDialogNotLoggedIn(
    BuildContext context, OverlayWidget overlayWidget) {
  return Center(
    child: Container(
      height: 300,
      margin: EdgeInsets.symmetric(horizontal: 50),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(20)),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                    onPressed: () {
                      overlayWidget.hide();
                      BlocProvider.of<HomeBloc>(context)
                          .add(ToggleMenuDialogEvent());
                    },
                    icon: Icon(Icons.cancel_outlined))
              ],
            ),
          ),
          Expanded(
            child: Center(
              child: FilledButton(
                onPressed: () async {
                  overlayWidget.hide();
                  bool? result =
                      await Navigator.pushNamed(context, '/login_donor')
                          as bool?;
                  if (result != null) {
                    BlocProvider.of<HomeBloc>(context).add(GetProductsEvent());
                  }
                },
                child: Text("Login"),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
