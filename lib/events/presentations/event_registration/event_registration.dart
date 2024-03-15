import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:timbo/events/widget/event_textformfield_widget.dart';
import 'package:timbo/events/widget/scaffold_widget.dart';
import 'package:timbo/events/widget/sizedbox_widget.dart';
import 'package:timbo/utils/routes/routes.dart';

import '../../../logic/image_upload/image_upload_cubit.dart';
import '../../../widgets/text_widget.dart';
import '../../constants/event_app_colors.dart';
import '../../constants/event_app_strings.dart';

class EventRegistrationScreen extends StatefulWidget {
  const EventRegistrationScreen({super.key});

  @override
  State<EventRegistrationScreen> createState() =>
      _EventRegistrationScreenState();
}

class _EventRegistrationScreenState extends State<EventRegistrationScreen> {
  String? imageUrl = '';
  @override
  Widget build(BuildContext context) {
    return ScaffoldWidget(
      homeIcon: true,
      text: "Registration for an Event",
      child: Padding(
        padding: const EdgeInsets.only(top: 80),
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
              child: Column(
                children: [
                  _imageWidget(),
                  SizedBox(
                    height: 20.h,
                  ),
                  _infoWidget(),
                  SizedBox(
                    height: 40.h,
                  ),
                  _buttonWidget(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  _imageWidget() {
    return Center(
      child: Column(
        children: [
          Image.asset(
            'assets/event_image/logo.png',
            height: 230.h,
          ),
          Textwidget(
            text: EventAppStrings.digitalPartnerText,
            fontSize: 12.sp,
          ),
          Textwidget(
            text: EventAppStrings.companyText,
            fontSize: 23.sp,
            fontWeight: FontWeight.bold,
            color: EventAppColors.companyTextColor,
          )
        ],
      ),
    );
  }

  _infoWidget() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            BlocBuilder<ImageUploadCubit, ImageUploadState>(
              builder: (context, state) {
                if (state is ImageUploadLoading) {
                  return SizedBox(
                    height: 145.h,
                    child: Container(
                      height: 145.h,
                      width: 120.h,
                      decoration: BoxDecoration(
                        color: EventAppColors.textformFieldColor,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Center(
                        child: CircularProgressIndicator(),
                      ),
                    ),
                  );
                }
                if (state is ImageUploadSuccess) {
                  imageUrl = state.url.toString();
                  return imageUrl == ""
                      ? InkWell(
                          onTap: () {
                            context
                                .read<ImageUploadCubit>()
                                .captureAndUploadImage(context);
                          },
                          child: Container(
                            height: 145.h,
                            width: 120.h,
                            decoration: BoxDecoration(
                              color: EventAppColors.textformFieldColor,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: const Center(
                              child: Textwidget(
                                text: 'फोटो ',
                              ),
                            ),
                          ),
                        )
                      : InkWell(
                          onTap: () {
                            context
                                .read<ImageUploadCubit>()
                                .captureAndUploadImage(context);
                          },
                          child: Container(
                            height: 145.h,
                            width: 120.w,
                            decoration: BoxDecoration(
                              color: EventAppColors.textformFieldColor,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Image.network(
                                width: 125.w,
                                fit: BoxFit.cover,
                                imageUrl ?? ""),
                          ),
                        );
                }
                return InkWell(
                  onTap: () {
                    context
                        .read<ImageUploadCubit>()
                        .captureAndUploadImage(context);
                  },
                  child: Container(
                    height: 145.h,
                    width: 120.h,
                    decoration: BoxDecoration(
                      color: EventAppColors.textformFieldColor,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(10),
                      child: Center(
                        child: Textwidget(
                          text: 'फोटो',
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
            const SizedBoxWidget(
              width: 15,
            ),
            Column(
              children: [
                EventTextformFieldWidget(
                  width: 170.w,
                  hintText: 'नाव',
                ),
                const SizedBoxWidget(
                  height: 7,
                ),
                EventTextformFieldWidget(
                  width: 170.w,
                  hintText: 'आडनाव ',
                ),
                const SizedBoxWidget(
                  height: 7,
                ),
                EventTextformFieldWidget(
                  width: 170.w,
                  hintText: 'मोबाइल',
                ),
              ],
            )
          ],
        ),
        const SizedBoxWidget(
          height: 10,
        ),
        // ignore: prefer_const_constructors
        EventTextformFieldWidget(
          hintText: "गाव ",
        ),
        const SizedBoxWidget(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            EventTextformFieldWidget(
              hintText: "तालुका",
              width: 150.w,
            ),
            EventTextformFieldWidget(
              width: 150.w,
              hintText: "जिल्हा",
            ),
          ],
        )
      ],
    );
  }

  _buttonWidget() {
    return Center(
      child: Container(
          height: 40.h,
          width: 100.w,
          decoration: BoxDecoration(
            color: EventAppColors.registerButtonColor,
            borderRadius:
                BorderRadius.circular(32), // Adjust the radius value as needed
          ),
          child: TextButton(
              onPressed: () {
                context.push(Routes.gatepassScreen);
              },
              child: const Text('Save'))),
    );
  }
}
