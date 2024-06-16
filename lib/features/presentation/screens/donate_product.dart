import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ngo/features/presentation/widgets/app_bar_with_title.dart';
import 'package:ngo/features/presentation/widgets/overlay_widget.dart';

import '../bloc/donation_form/donate_product_bloc.dart';
import '../bloc/donation_form/donate_product_event.dart';
import '../bloc/donation_form/donate_product_state.dart';
import '../widgets/buttons.dart';
import '../widgets/image_picker.dart';
import '../widgets/popUpDialog.dart';
import '../widgets/text_field.dart';

class DonateProduct extends StatelessWidget {
  const DonateProduct({super.key});
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
        appBar: BuildAppBarWithTitle(context, 'Donate'),
        body: _buildBody(context, width, height),
      )
    ]);
  }

  _buildBody(BuildContext context, double width, double height) {
    OverlayWidget overlayWidget = OverlayWidget(context: context);
    return BlocListener<DonateProductBloc, DonateProductState>(
      listener: (context, state) {
        if (state is SuccessState) {
          Navigator.pop(context);
        }
        if (state.isLoading == true) {
          overlayWidget.show(
              widget: LoadingWidget(width, height, overlayWidget));
        } else {
          overlayWidget.hide();
        }
      },
      child: BlocBuilder<DonateProductBloc, DonateProductState>(
          builder: (context, state) {
        bool? isChecked = false;
        if (state is ErrorState) {
          return Text(state.error as String);
        }
        if (state is InitialState) {
          return SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ImagePickerWidget(
                      onImagesSelected: (imageFiles) {
                        BlocProvider.of<DonateProductBloc>(context)
                            .add(ImageAddingEvent(imageFiles: imageFiles));
                      },
                    ),
                    InputText(
                      label: "Title",
                      hintText: "Title",
                      onChanged: (value) =>
                          BlocProvider.of<DonateProductBloc>(context)
                              .add(TextChangeEvent(value, 1)),
                    ),
                    InputText(
                      label: "Category",
                      hintText: "Category",
                      onChanged: (value) =>
                          BlocProvider.of<DonateProductBloc>(context)
                              .add(TextChangeEvent(value, 2)),
                    ),
                    InputText(
                      label: "Description",
                      hintText: "Description",
                      onChanged: (value) =>
                          BlocProvider.of<DonateProductBloc>(context)
                              .add(TextChangeEvent(value, 3)),
                    ),
                    InputText(
                      label: "Defects",
                      hintText: "Defects",
                      onChanged: (value) =>
                          BlocProvider.of<DonateProductBloc>(context)
                              .add(TextChangeEvent(value, 4)),
                    ),
                    InputText(
                      label: "Area of Donation",
                      hintText: "Area of Donation",
                      onChanged: (value) =>
                          BlocProvider.of<DonateProductBloc>(context)
                              .add(TextChangeEvent(value, 5)),
                    ),
                    Row(
                      children: [
                        LargeButton(
                            label: "Donate",
                            onPressed: () =>
                                BlocProvider.of<DonateProductBloc>(context)
                                    .add(DonateProductSubmitted())),
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        }
        return const SizedBox();
      }),
    );
  }
}
