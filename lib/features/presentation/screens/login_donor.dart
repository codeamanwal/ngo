import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ngo/features/presentation/bloc/login_donor/login_donor_bloc.dart';
import 'package:ngo/features/presentation/bloc/login_donor/login_donor_state.dart';
import 'package:ngo/features/presentation/widgets/app_bar_with_title.dart';
import 'package:ngo/features/presentation/widgets/overlay_widget.dart';

import '../bloc/login_donor/login_donor_event.dart';
import '../widgets/buttons.dart';
import '../widgets/popUpDialog.dart';
import '../widgets/text_field.dart';

class LoginDonor extends StatelessWidget {
  const LoginDonor({super.key});
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Stack(children: [
      Image.asset(
        "assets/images/bg.png",
        height: height,
        fit: BoxFit.fitHeight,
      ),
      Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.transparent.withOpacity(0.3),
        appBar: BuildAppBarWithTitle(context, 'Login'),
        body: _buildBody(context, width, height),
      ),
    ]);
  }

  _buildBody(BuildContext context, double width, double height) {
    final OverlayWidget overlayWidget = OverlayWidget(context: context);
    return BlocListener<LoginDonorBloc, LoginDonorState>(
      listener: (context, state) {
        print(state);
        if (state.isLoggedIn == true) {
          state.isLoggedIn = false;
          overlayWidget.hide();
          Navigator.pop(context, true);
        } else if (state.isLoading == true) {
          overlayWidget.show(
              widget: LoadingWidget(width, height, overlayWidget));
        } else {
          overlayWidget.hide();
        }
      },
      child: BlocBuilder<LoginDonorBloc, LoginDonorState>(
          builder: (context, state) {
        print(state);

        if (state is InitialState) {
          return SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    InputText(
                      label: "Donor E-mail",
                      hintText: "Donor E-mail",
                      onChanged: (value) =>
                          BlocProvider.of<LoginDonorBloc>(context)
                              .add(TextChangeEvent(value, 1)),
                    ),
                    InputText(
                      label: "Phone No.",
                      hintText: "Phone No.",
                      onChanged: (value) =>
                          BlocProvider.of<LoginDonorBloc>(context)
                              .add(TextChangeEvent(value, 2)),
                    ),
                    Row(
                      children: [
                        LargeButton(
                            label: "Login",
                            onPressed: () =>
                                BlocProvider.of<LoginDonorBloc>(context)
                                    .add(LoginDonorSubmitted())),
                      ],
                    ),
                    Row(
                      children: [
                        LargeButton(
                            label: "New Donor ?",
                            onPressed: () {
                              Navigator.pushNamed(context, '/register_donor');
                            }),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        }
        if (state is ErrorState) {}

        return const SizedBox();
      }),
    );
  }
}
