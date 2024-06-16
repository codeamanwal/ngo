import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ngo/features/data/model/donor.dart';
import 'package:ngo/features/presentation/bloc/profile/profile_bloc.dart';
import 'package:ngo/features/presentation/bloc/profile/profile_event.dart';
import 'package:ngo/features/presentation/bloc/profile/profile_state.dart';
import 'package:ngo/features/presentation/widgets/product_card.dart';

import '../widgets/popUpDialog.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(builder: (context, state) {
      final width = MediaQuery.of(context).size.width;
      final height = MediaQuery.of(context).size.height;

      return Stack(children: [
        Image.asset(
          "assets/images/bg.png",
          height: height,
          fit: BoxFit.fitHeight,
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: _buildbody(context, state, width, height),
        )
      ]);
    });
  }

  Widget _buildbody(
      BuildContext context, ProfileState state, double width, double height) {
    if (state is InitializingState) {
      final args =
          ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>? ??
              {};
      final productList = args['productList'];
      final donorModel = args['donorModel'];
      BlocProvider.of<ProfileBloc>(context).add(InitalizeDonorProfileEvent(
          productList: productList, donorModel: donorModel));
    }
    if (state is LoadingState) {
      return LoadingWidget(width, height, null);
    }
    if (state is InitialState) {
      final DonorModel donorModel = state.donorModel!;
      return SafeArea(
        child: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              pinned: true,
              expandedHeight: height / 3,
              flexibleSpace: FlexibleSpaceBar(
                title: const Text(
                  "Your Donations",
                  style: TextStyle(color: Colors.black),
                ),
                background: Card(
                  child: Container(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        infoChild(width, Icons.person, donorModel.donor_name),
                        infoChild(
                            width, Icons.phone, donorModel.donor_mob_number),
                        infoChild(width, Icons.email, donorModel.donor_email),
                        infoChild(width, Icons.home, donorModel.donor_address),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            // SliverToBoxAdapter(
            //     child: Column(
            //   children: [
            //     headerChild(donorModel.donor_name ?? "No Name"),
            //     infoChild(width, Icons.phone, donorModel.donor_mob_number),
            //     infoChild(width, Icons.email, donorModel.donor_email),
            //     infoChild(width, Icons.home, donorModel.donor_address),
            //   ],
            // )),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    child: Center(
                        child: ProductCard(
                      height: height,
                      width: width,
                      onPressed: () {},
                      product: state.donorProducts![index],
                    )),
                  );
                },
                childCount: donorModel.donor_products?.length ?? 0,
              ),
            ),
          ],
        ),
      );
    }
    return const SizedBox();
  }

  Widget infoChild(double width, IconData? icon, String? data) => Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: InkWell(
          child: Row(
            children: <Widget>[
              SizedBox(
                width: width / 10,
              ),
              Icon(
                icon,
                size: 36.0,
              ),
              SizedBox(
                width: width / 20,
              ),
              Text(
                data!,
                maxLines: 3,
              ),
              SizedBox(
                width: width / 10,
              ),
            ],
          ),
          onTap: () {
            print('Info Object selected');
          },
        ),
      );
}
