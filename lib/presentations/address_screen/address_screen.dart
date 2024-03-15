import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:timbo/logic/address/address_cubit.dart';
import '../../constants/app_colors.dart';
import '../../constants/app_sizes.dart';
import '../../constants/app_strings.dart';
import '../../logic/comman/action_chip_cubit.dart';
import '../../model/address_response_model/address_response_model.dart';
import '../../utils/app_utils/app_utils/app_utils.dart';
import '../../widgets/address_item_widget.dart';
import '../../widgets/address_saved_as_chips_widget.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_skeleton_loader.dart';
import '../../widgets/text_widget.dart';
import '../../widgets/textformfield_widget.dart';

class AddressScreen extends StatefulWidget {
  const AddressScreen({super.key});

  @override
  State<AddressScreen> createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
  @override
  void initState() {
    context.read<AddressCubit>().getAddress();
    super.initState();
  }

  final TextEditingController streetAddressControllerTxt =
      TextEditingController(text: "");
  final TextEditingController localityControllerTxt =
      TextEditingController(text: "");
  final TextEditingController cityControllerTxt =
      TextEditingController(text: "");
  final TextEditingController stateControllerTxt =
      TextEditingController(text: "");
  final TextEditingController zipCodeControllerTxt =
      TextEditingController(text: "");
  final TextEditingController tagsControllerText =
      TextEditingController(text: "");

  var _oneValue = '';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        appBar: AppBar(
          systemOverlayStyle: systemOverLayStyle,
          automaticallyImplyLeading: true,
          elevation: 0,
          iconTheme:
              IconThemeData(color: Theme.of(context).secondaryHeaderColor),
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          title: Textwidget(
            fontSize: 18.sp,
            text: AppStrings.addresses,
            fontWeight: FontWeight.bold,
          ),
          centerTitle: true,
        ),
        body: BlocBuilder<AddressCubit, AddressState>(
          builder: (context, state) {
            if (state is AddressLoading) {
              return Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: AppSizes.horizontalScreen8pxPaddingPhone,
                ),
                child: CustomSkeletonCard(
                  context: context,
                  cardHeight: 100,
                  listCount: 10,
                ),
              );
            }
            if (state is AddressLoaded &&
                (state.addressResponseModel.data?.addresses?.isEmpty ??
                    false)) {
              return const Center(child: Textwidget(text: "No Address"));
            }
            return ListView.builder(
              itemCount:
                  state.addressResponseModel.data?.addresses?.length ?? 0,
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                state.addressResponseModel.data?.addresses?[index].isdefault ??
                        false
                    ? _oneValue =
                        state.addressResponseModel.data?.addresses![index].id ??
                            ""
                    : _oneValue = "";
                return Column(
                  children: [
                    AddressItemWidget(
                      groupValue: _oneValue,
                      onSelectedChanged: (value) {
                        setState(() {
                          _oneValue = value.toString();
                          context
                              .read<AddressCubit>()
                              .setDefaultAddress(context, _oneValue);
                        });
                      },
                      addressItem:
                          state.addressResponseModel.data?.addresses?[index],
                      editClick: () {
                        editAddressBottomSheet(context,
                            state.addressResponseModel.data?.addresses?[index]);
                      },
                    ),
                    // RadioListTile(
                    //   title: const Text("Default Address"),
                    //   value:
                    //       state.addressResponseModel.data?.addresses?[index].id,
                    //   groupValue: _oneValue,
                    //   onChanged: (value) {
                    //     setState(() {
                    //       _oneValue = value.toString();
                    //     });
                    //   },
                    // ),
                  ],
                );
              },
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            _addAddressBottomSheet(context);
          },
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          child: Icon(FontAwesomeIcons.plus,
              color:
                  Theme.of(context).floatingActionButtonTheme.backgroundColor,
              size: 18.0.h),
        ),
      ),
    );
  }

  void clearData() {
    Future.delayed(const Duration(milliseconds: 5000), () {
      tagsControllerText.clear();
      cityControllerTxt.clear();
      localityControllerTxt.clear();
      stateControllerTxt.clear();
      streetAddressControllerTxt.clear();
      zipCodeControllerTxt.clear();
      context.read<ActionChipCubit>().getActionChipItem(0);
    });
  }

  void editAddressBottomSheet(
      BuildContext context, AddressModel? addressModel) {
    final List<String> items = [
      'Home',
      'Work',
      'Family',
      'Friends',
      'Other',
    ];

    tagsControllerText.text = addressModel?.tag ?? "";
    localityControllerTxt.text = addressModel?.locality ?? "";
    streetAddressControllerTxt.text = addressModel?.street ?? "";
    cityControllerTxt.text = addressModel?.city ?? "";
    stateControllerTxt.text = addressModel?.state ?? "";
    zipCodeControllerTxt.text = addressModel?.zip ?? "";

    if (addressModel?.tag == items[0]) {
      context.read<ActionChipCubit>().getActionChipItem(0);
    } else if (addressModel?.tag == items[1]) {
      context.read<ActionChipCubit>().getActionChipItem(1);
    } else if (addressModel?.tag == items[2]) {
      context.read<ActionChipCubit>().getActionChipItem(2);
    } else if (addressModel?.tag == items[3]) {
      context.read<ActionChipCubit>().getActionChipItem(3);
    } else {
      context.read<ActionChipCubit>().getActionChipItem(4);
    }
    showModalBottomSheet(
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12.r),
                topRight: Radius.circular(12.r))),
        context: context,
        builder: (BuildContext context) {
          return Padding(
            padding: EdgeInsets.only(
              left: AppSizes.horizontalScreen12pxPaddingPhone,
              right: AppSizes.horizontalScreen12pxPaddingPhone,
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: AppSizes.content12pxHeight,
                ),
                Textwidget(
                    text: "Edit Address",
                    fontSize: AppSizes.large16pxTextSize,
                    fontWeight: FontWeight.bold),
                SizedBox(
                  height: AppSizes.content12pxHeight,
                ),
                Divider(
                  color: AppColors.lightTheme.dividerColor.withOpacity(0.5),
                  height: 1,
                ),
                SizedBox(
                  height: AppSizes.content12pxHeight,
                ),
                Textwidget(
                    text: "Save as",
                    fontSize: AppSizes.medium14pxTextSize,
                    fontWeight: FontWeight.bold),
                SizedBox(
                  height: AppSizes.content8pxHeight,
                ),
                BlocBuilder<ActionChipCubit, ActionChipState>(
                    builder: (context, state) {
                  return SizedBox(
                    height: 35.h,
                    child: ListView.builder(
                        itemCount: items.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.only(right: 5.w),
                            child: AddressSavedAsChipWidget(
                              text: items[index],
                              isSelected: state.index == index,
                              onTapFunction: () {
                                tagsControllerText.text = items[index];
                                context
                                    .read<ActionChipCubit>()
                                    .getActionChipItem(index);
                              },
                            ),
                          );
                        }),
                  );
                }),
                SizedBox(height: 10.h),
                SizedBox(
                  height: AppSizes.content8pxHeight,
                ),
                TextformFieldWidget(
                  fontSize: 14.sp,
                  controller: streetAddressControllerTxt,
                  hintText: AppStrings.addressHouseStreet,
                ),
                SizedBox(
                  height: AppSizes.content12pxHeight,
                ),
                TextformFieldWidget(
                  controller: localityControllerTxt,
                  hintText: AppStrings.locality,
                  fontSize: 14.sp,
                ),
                SizedBox(
                  height: AppSizes.content12pxHeight,
                ),
                TextformFieldWidget(
                  controller: cityControllerTxt,
                  hintText: AppStrings.city,
                  fontSize: 14.sp,
                ),
                SizedBox(
                  height: AppSizes.content12pxHeight,
                ),
                TextformFieldWidget(
                  controller: stateControllerTxt,
                  hintText: AppStrings.state,
                  fontSize: 14.sp,
                ),
                SizedBox(
                  height: AppSizes.content12pxHeight,
                ),
                TextformFieldWidget(
                  controller: zipCodeControllerTxt,
                  hintText: AppStrings.zip,
                  fontSize: 14.sp,
                ),
                SizedBox(
                  height: AppSizes.content12pxHeight,
                ),
                BlocBuilder<AddressCubit, AddressState>(
                  builder: (context, state) {
                    return CustomButton(
                      inProgress: state is AddressLoading ? true : false,
                      buttonText: AppStrings.save,
                      onPress: () {
                        context.read<AddressCubit>().updateAddress(
                              context,
                              addressId: addressModel?.id,
                              tag: tagsControllerText.text.trim(),
                              city: cityControllerTxt.text.trim(),
                              locality: localityControllerTxt.text.trim(),
                              state: stateControllerTxt.text.trim(),
                              streetAddress:
                                  streetAddressControllerTxt.text.trim(),
                              zipCode: zipCodeControllerTxt.text.trim(),
                            );
                        clearData();
                      },
                    );
                  },
                ),
                SizedBox(
                  height: AppSizes.content12pxHeight,
                ),
              ],
            ),
          );
        });
  }

  void _addAddressBottomSheet(BuildContext context) {
    final List<String> items = [
      'Home',
      'Work',
      'Family',
      'Friends',
      'Other',
    ];
    tagsControllerText.text = 'Home';
    showModalBottomSheet(
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12.r),
                topRight: Radius.circular(12.r))),
        context: context,
        builder: (BuildContext context) {
          return Padding(
            padding: EdgeInsets.only(
              left: AppSizes.horizontalScreen12pxPaddingPhone,
              right: AppSizes.horizontalScreen12pxPaddingPhone,
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: AppSizes.content12pxHeight,
                ),
                Textwidget(
                    text: "Add New Address",
                    fontSize: AppSizes.large16pxTextSize,
                    fontWeight: FontWeight.bold),
                SizedBox(
                  height: AppSizes.content12pxHeight,
                ),
                Divider(
                  color: AppColors.lightTheme.dividerColor.withOpacity(0.5),
                  height: 1,
                ),
                SizedBox(
                  height: AppSizes.content12pxHeight,
                ),
                Textwidget(
                    text: "Save as",
                    fontSize: AppSizes.medium14pxTextSize,
                    fontWeight: FontWeight.bold),
                SizedBox(
                  height: AppSizes.content8pxHeight,
                ),
                BlocBuilder<ActionChipCubit, ActionChipState>(
                    builder: (context, state) {
                  return SizedBox(
                    height: 35.h,
                    child: ListView.builder(
                        itemCount: items.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.only(right: 5.w),
                            child: AddressSavedAsChipWidget(
                              text: items[index],
                              isSelected: state.index == index,
                              onTapFunction: () {
                                tagsControllerText.text = items[index];
                                context
                                    .read<ActionChipCubit>()
                                    .getActionChipItem(index);
                              },
                            ),
                          );
                        }),
                  );
                }),
                SizedBox(height: 10.h),
                SizedBox(
                  height: AppSizes.content8pxHeight,
                ),
                TextformFieldWidget(
                  fontSize: 14.sp,
                  controller: streetAddressControllerTxt,
                  hintText: AppStrings.addressHouseStreet,
                ),
                SizedBox(
                  height: AppSizes.content12pxHeight,
                ),
                TextformFieldWidget(
                  controller: localityControllerTxt,
                  hintText: AppStrings.locality,
                  fontSize: 14.sp,
                ),
                SizedBox(
                  height: AppSizes.content12pxHeight,
                ),
                TextformFieldWidget(
                  controller: cityControllerTxt,
                  hintText: AppStrings.city,
                  fontSize: 14.sp,
                ),
                SizedBox(
                  height: AppSizes.content12pxHeight,
                ),
                TextformFieldWidget(
                  controller: stateControllerTxt,
                  hintText: AppStrings.state,
                  fontSize: 14.sp,
                ),
                SizedBox(
                  height: AppSizes.content12pxHeight,
                ),
                TextformFieldWidget(
                  controller: zipCodeControllerTxt,
                  hintText: AppStrings.zip,
                  fontSize: 14.sp,
                ),
                SizedBox(
                  height: AppSizes.content12pxHeight,
                ),
                BlocBuilder<AddressCubit, AddressState>(
                  builder: (context, state) {
                    return CustomButton(
                      inProgress: state is AddressLoading ? true : false,
                      buttonText: AppStrings.save,
                      onPress: () {
                        context.read<AddressCubit>().saveAddress(
                              context,
                              tag: tagsControllerText.text.trim(),
                              city: cityControllerTxt.text.trim(),
                              locality: localityControllerTxt.text.trim(),
                              state: stateControllerTxt.text.trim(),
                              streetAddress:
                                  streetAddressControllerTxt.text.trim(),
                              zipCode: zipCodeControllerTxt.text.trim(),
                            );
                        clearData();
                      },
                    );
                  },
                ),
                SizedBox(
                  height: AppSizes.content12pxHeight,
                ),
              ],
            ),
          );
        });
  }
}
