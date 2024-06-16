import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ngo/features/presentation/bloc/home/home_bloc.dart';
import 'package:ngo/features/presentation/bloc/home/home_state.dart';
import 'package:ngo/features/presentation/widgets/app_bar_with_title.dart';
import 'package:ngo/features/presentation/widgets/overlay_widget.dart';
import 'package:ngo/features/presentation/widgets/product_card.dart';

import '../bloc/home/home_event.dart';
import '../widgets/buttons.dart';
import '../widgets/popUpDialog.dart';
import '../widgets/product_information_widget.dart';

class Home extends StatelessWidget {
  Home({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final overlayWidget = OverlayWidget(context: context);
    return BlocListener<HomeBloc, HomeState>(
      listener: (context, state) {
        if (state.isDisplayingProductDetails == true) {
          overlayWidget.show(
            widget: displayproduct(
                context, state.index!, state, width, height, overlayWidget),
          );
        } else if (state.isDisplayingMenuDialog == true) {
          if (state.isLoggedIn == true) {
            overlayWidget.show(
                widget: menuDialogLoggedIn(
                    context, overlayWidget, state.products, state.donorModel!));
          } else {
            overlayWidget.show(
                widget: menuDialogNotLoggedIn(context, overlayWidget));
          }
        } else if (state.isLoading == true) {
          overlayWidget.show(
              widget: LoadingWidget(width, height, overlayWidget));
        } else {
          overlayWidget.hide();
        }
      },
      child: BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
        return PopScope(
          canPop: state.isDisplayingProductDetails == true ||
                  state.isDisplayingMenuDialog == true
              ? false
              : true,
          onPopInvoked: (pop) {
            if (state.isDisplayingMenuDialog == true) {
              BlocProvider.of<HomeBloc>(context)
                  .add(const ToggleMenuDialogEvent());
            }
            if (state.isDisplayingProductDetails == true) {
              BlocProvider.of<HomeBloc>(context)
                  .add(ToggleProductInformationEvent(state.index!));
            }
          },
          child: Stack(children: [
            Image.asset(
              "assets/images/bg.png",
              height: height,
              fit: BoxFit.fitHeight,
            ),
            Scaffold(
              backgroundColor: Colors.transparent.withOpacity(0.3),
              appBar: _buildAppBar(context),
              body: _buildbody(context, state, width, height),
            ),
          ]),
        );
      }),
    );
  }

  _buildbody(
      BuildContext context, HomeState state, double width, double height) {
    print("HomePage : ${state}");
    if (state is GetProductsDoneState) {
      return Column(
        children: [
          Expanded(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
              child: ListView.builder(
                itemCount: state.products != null ? state.products!.length : 0,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 0),
                    child: ProductCard(
                      product: state.products![index],
                      onPressed: () {
                        BlocProvider.of<HomeBloc>(context)
                            .add(ToggleProductInformationEvent(index));
                      },
                      width: width,
                      height: height,
                    ),
                  );
                },
              ),
            ),
          ),
          Container(
            color: Colors.white.withOpacity(0.5),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Row(
                children: [
                  LargeButton(
                      label: "Donate",
                      onPressed: () async {
                        if (state.isLoggedIn == false) {
                          BlocProvider.of<HomeBloc>(context)
                              .add(ToggleMenuDialogEvent());
                        }
                        if (state.isLoggedIn == true) {
                          Navigator.pushNamed(context, '/donate').whenComplete(
                              () => BlocProvider.of<HomeBloc>(context)
                                  .add(GetProductsEvent()));
                        }
                      }),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.redAccent),
                    child: IconButton(
                        onPressed: () {
                          BlocProvider.of<HomeBloc>(context)
                              .add(ToggleMenuDialogEvent());
                        },
                        icon: const Icon(
                          Icons.list,
                          color: Colors.white,
                        )),
                  )
                ],
              ),
            ),
          )
        ],
      );
    }
    if (state is GetProductsState) {
      BlocProvider.of<HomeBloc>(context).add(GetProductsEvent());
      return LoadingWidget(width, height, null);
    }
    if (state is ErrorState) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [Text("${state.error}")],
      );
    }
    return const SizedBox();
  }

  _buildAppBar(BuildContext context) {
    return BuildAppBarWithTitle(context, "Home",
        automaticallyImplyLeading: false);
  }
}
