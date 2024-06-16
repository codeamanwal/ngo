import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ngo/features/presentation/bloc/register_donor/register_donor_bloc.dart';
import 'package:ngo/features/presentation/bloc/register_donor/register_donor_event.dart';
import 'package:ngo/features/presentation/bloc/register_donor/register_donor_state.dart';
import 'package:ngo/features/presentation/widgets/app_bar_with_title.dart';
import 'package:ngo/features/presentation/widgets/checkbox.dart';
import 'package:ngo/features/presentation/widgets/drop_down_menu.dart';
import 'package:ngo/features/presentation/widgets/overlay_widget.dart';
import 'package:ngo/features/presentation/widgets/popUpDialog.dart';

import '../widgets/buttons.dart';
import '../widgets/text_field.dart';

class RegisterDonor extends StatelessWidget {
  const RegisterDonor({super.key});
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
        resizeToAvoidBottomInset: true,
        backgroundColor: Colors.transparent.withOpacity(0.3),
        appBar: BuildAppBarWithTitle(context, 'Register'),
        body: _buildBody(context, width, height),
      )
    ]);
  }

  _buildBody(BuildContext context, double width, double height) {
    return BlocListener<RegisterDonorBloc, RegisterDonorState>(
      listener: (context, state) {
        final width = MediaQuery.of(context).size.width;
        final height = MediaQuery.of(context).size.height;
        OverlayWidget overlayWidget = OverlayWidget(context: context);
        if (state.isLoading == true) {
          overlayWidget.show(
              widget: LoadingWidget(width, height, overlayWidget));
        } else {
          overlayWidget.hide();
        }
      },
      child: BlocBuilder<RegisterDonorBloc, RegisterDonorState>(
          builder: (context, state) {
        bool? isChecked = false;

        if (state is InitialState) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  InputText(
                    label: "Donor Name",
                    hintText: "Donor Name",
                    onChanged: (value) =>
                        BlocProvider.of<RegisterDonorBloc>(context)
                            .add(TextChangeEvent(value, 1)),
                  ),
                  InputText(
                    label: "Phone No.",
                    hintText: "Phone No.",
                    onChanged: (value) =>
                        BlocProvider.of<RegisterDonorBloc>(context)
                            .add(TextChangeEvent(value, 2)),
                  ),
                  InputText(
                    label: "Donor Address",
                    hintText: "Donor Address",
                    onChanged: (value) =>
                        BlocProvider.of<RegisterDonorBloc>(context)
                            .add(TextChangeEvent(value, 3)),
                  ),
                  InputText(
                    label: "Donor Email",
                    hintText: "Donor Email",
                    onChanged: (value) =>
                        BlocProvider.of<RegisterDonorBloc>(context)
                            .add(TextChangeEvent(value, 4)),
                  ),
                  // InputText(
                  //   label: "Donor Id Type",
                  //   hintText: "Donor Id Type",
                  //   onChanged: (value) =>
                  //       BlocProvider.of<RegisterDonorBloc>(context)
                  //           .add(TextChangeEvent(value, 5)),
                  // ),
                  DropdownMenuWidget(
                      menuOptions: ["Aadhar Card", "PAN Card"],
                      onChanged: (value) => {
                            BlocProvider.of<RegisterDonorBloc>(context)
                                .add(TextChangeEvent(value, 5))
                          }),
                  InputText(
                    label: "Donor Id No.",
                    hintText: "Donor Id No.",
                    onChanged: (value) =>
                        BlocProvider.of<RegisterDonorBloc>(context)
                            .add(TextChangeEvent(value, 6)),
                  ),
                  InputText(
                    label: "Donor PAN No.",
                    hintText: "Donor PAN No.",
                    onChanged: (value) =>
                        BlocProvider.of<RegisterDonorBloc>(context)
                            .add(TextChangeEvent(value, 7)),
                  ),
                  CheckBoxWithText(
                      title: "Keep Identity Anonymous",
                      isChecked: isChecked,
                      onChanged: (value) =>
                          BlocProvider.of<RegisterDonorBloc>(context)
                              .add(TextChangeEvent(value.toString(), 8))),
                  Row(
                    children: [
                      LargeButton(
                          label: "Register",
                          onPressed: () =>
                              BlocProvider.of<RegisterDonorBloc>(context)
                                  .add(RegisterDonorSubmittedEvent())),
                    ],
                  ),
                ],
              ),
            ),
          );
        }
        return const SizedBox();
      }),
    );
  }
}
