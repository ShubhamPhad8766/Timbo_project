import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:timbo/events/constants/event_app_colors.dart';
import 'package:timbo/events/constants/event_app_strings.dart';
import 'package:timbo/events/widget/sizedbox_widget.dart';
import 'package:timbo/widgets/text_widget.dart';
import '../../../logic/image_upload/image_upload_cubit.dart';
import '../../logic/cow_registration/cow_register_cubit.dart';
import '../../widget/event_textformfield_widget.dart';

class CowEventRegistrationSCreen extends StatefulWidget {
  const CowEventRegistrationSCreen({super.key});

  @override
  State<CowEventRegistrationSCreen> createState() =>
      _CowEventRegistrationSCreenState();
}

class _CowEventRegistrationSCreenState
    extends State<CowEventRegistrationSCreen> {
  String? imageUrl = '';
  final TextEditingController _username = TextEditingController();
  final TextEditingController _village = TextEditingController();
  final TextEditingController _taluka = TextEditingController();
  final TextEditingController _dist = TextEditingController();
  final TextEditingController _userMobile = TextEditingController();
  final TextEditingController _doctorMobile = TextEditingController();
  final TextEditingController _cowCaste = TextEditingController();
  final TextEditingController _milkCapacity = TextEditingController();
  final TextEditingController _tagNo = TextEditingController();
  final TextEditingController _condition = TextEditingController();

  bool isCheckboxChecked = false;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
           backgroundColor: EventAppColors.appbarBackgroundColor,
          bottom: TabBar(
            tabs: [
              Textwidget(
                text: 'स्पर्धक नोंदणी',
                fontSize: 14.sp,
                fontWeight: FontWeight.bold,
              ),
              Textwidget(
                text: 'स्पर्धेचे नियम',
                fontSize: 14.sp,
                fontWeight: FontWeight.bold,
              ),
            ],
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  Future.delayed(const Duration(milliseconds: 1500), () {
                    _username.clear();
                    _village.clear();
                    _taluka.clear();
                    _dist.clear();
                    _userMobile.clear();
                    _doctorMobile.clear();
                    _cowCaste.clear();
                    _milkCapacity.clear();
                    _tagNo.clear();
                    _condition.clear();
                    context.read<ImageUploadCubit>().clearData();
                    context.pop();
                  });
                  Navigator.of(context).pop();
                },
              ),
              const Text('दुग्ध उत्पादन स्पर्धा'),
            ],
          ),
        ),
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xffECF7BF), Color(0xff6F9101)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Stack(children: [
            TabBarView(
              children: [
                _registrationWidget(),
                _ruleWidget(),
              ],
            ),
          ]),
        ),
      ),
    );
  }

  _registrationWidget() {
    return Center(
      child: SingleChildScrollView(
        child: BlocBuilder<CowRegisterCubit, CowRegisterState>(
          builder: (context, cowState) {
            if (cowState is CowRegisterLoaded) {
              Future.delayed(const Duration(milliseconds: 2000), () {
                _username.clear();
                _village.clear();
                _taluka.clear();
                _dist.clear();
                _userMobile.clear();
                _doctorMobile.clear();
                _cowCaste.clear();
                _milkCapacity.clear();
                _tagNo.clear();
                _condition.clear();
                context.read<ImageUploadCubit>().clearData();
                context.pop();
              });
              return Container(
                child: Lottie.asset("assets/json/green_check_animation.json"),
              );
            }
            return Padding(
              padding: const EdgeInsets.all(20),
              child: Column(children: [
                Container(
                  height: 120.h,
                  width: MediaQuery.of(context).size.width,
                  color: EventAppColors.textformFieldColor,
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          'assets/event_icon/cow.svg',
                          height: 100,
                        ),
                        const SizedBoxWidget(
                          width: 5,
                        ),
                        Expanded(
                          child: Textwidget(
                            text:
                                "स्पर्धेबरोबरच दैनंदिन शेतीतील अलीकडच्या प्रगतीवर एक दिवसीय परिषद होणार असून तेथे तज्ञ पशुवैद्य शेतकऱ्यांना मार्गदर्शन करतील",
                            fontSize: 13.sp,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBoxWidget(
                  height: 10,
                ),
                Center(
                  child: BlocBuilder<ImageUploadCubit, ImageUploadState>(
                    builder: (context, state) {
                      if (state is ImageUploadLoading) {
                        return SizedBox(
                          height: 125.h,
                          child: Container(
                            height: 125.h,
                            width: 125.h,
                            color: EventAppColors.textformFieldColor,
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
                                  height: 125.h,
                                  width: 125.h,
                                  color: EventAppColors.textformFieldColor,
                                  child: const Center(
                                    child: Textwidget(
                                      text: 'फोटो अपलोड करावा',
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
                                  height: 125.h,
                                  width: 125.w,
                                  color: EventAppColors.textformFieldColor,
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
                          height: 125.h,
                          width: 125.h,
                          decoration: BoxDecoration(
                            color: EventAppColors.textformFieldColor,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(10),
                            child: Center(
                              child: Textwidget(
                                text: 'गायीचा फोटो',
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBoxWidget(
                  height: 10,
                ),
                EventTextformFieldWidget(
                  hintText: 'पशुपालकाचे नाव', 
                  controller: _username,
                ),
                const SizedBoxWidget(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    EventTextformFieldWidget(
                      width: 150.w,
                      hintText: 'गाव',
                      controller: _village,
                    ),
                    const SizedBoxWidget(
                      width: 10,
                    ),
                    EventTextformFieldWidget(
                      width: 150.w,
                      hintText: 'तालुका',
                      controller: _taluka,
                    ),
                  ],
                ),
                const SizedBoxWidget(
                  height: 10,
                ),
                EventTextformFieldWidget(
                  hintText: 'जिल्हा',
                  controller: _dist,
                ),
                const SizedBoxWidget(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    EventTextformFieldWidget(
                      width: 150.w,
                      hintText: 'पशुपालकाचा मोबाईल ',
                      controller: _userMobile,
                      textInputType: TextInputType.number,
                      inputFormater: [LengthLimitingTextInputFormatter(10)],
                    ),
                    const SizedBoxWidget(
                      width: 10,
                    ),
                    EventTextformFieldWidget(
                      width: 150.w,
                      hintText: 'डॉक्टरचा  मोबाईल ',
                      controller: _doctorMobile,
                      textInputType: TextInputType.number,
                      inputFormater: [LengthLimitingTextInputFormatter(10)],
                    ),
                  ],
                ),
                const SizedBoxWidget(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    EventTextformFieldWidget(
                      width: 150.w,
                      hintText: 'गायीची जात',
                      controller: _cowCaste,
                    ),
                    const SizedBoxWidget(
                      width: 10,
                    ),
                    EventTextformFieldWidget(
                      width: 150.w,
                      hintText: 'दूध लिटर/प्रती दिन ',
                      controller: _milkCapacity,
                    ),
                  ],
                ),
                const SizedBoxWidget(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    EventTextformFieldWidget(
                      width: 150.w,
                      hintText: 'इनाफ टॅग क्रमांक (१२ अंकी)',
                      controller: _tagNo,
                    ),
                    const SizedBoxWidget(
                      width: 10,
                    ),
                    EventTextformFieldWidget(
                      width: 150.w,
                      hintText: 'गाभण/दुधाळ ',
                      controller: _condition,
                    ),
                  ],
                ),
                const SizedBoxWidget(
                  height: 30,
                ),
                CheckboxListTile(
                    title: Textwidget(
                        text: EventAppStrings.confirmationText,
                        fontSize: 17.sp,
                        color: EventAppColors.textGrayColor),
                    value: isCheckboxChecked,
                    controlAffinity: ListTileControlAffinity.leading,
                    activeColor: Colors.green,
                    onChanged: (bool? value) {
                      setState(() {
                        isCheckboxChecked = value!;
                      });
                    }),
                const SizedBoxWidget(
                  height: 10,
                ),
                Center(
                  child: Container(
                      height: 40.h,
                      width: 100.w,
                      decoration: BoxDecoration(
                        color: EventAppColors.registerButtonColor,
                        borderRadius: BorderRadius.circular(
                            32), // Adjust the radius value as needed
                      ),
                      child: TextButton(
                          onPressed: isCheckboxChecked
                              ? () {
                                  context.read<CowRegisterCubit>().postCowInfo(
                                      username: _username.text,
                                      village: _village.text,
                                      taluka: _taluka.text,
                                      dist: _dist.text,
                                      userMobile: _userMobile.text,
                                      doctorMobile: _doctorMobile.text,
                                      cowCaste: _cowCaste.text,
                                      milkCapacity: _milkCapacity.text,
                                      tagNo: _tagNo.text,
                                      condition: _condition.text);                    
                          
                      } : null,

                          child: const Text('नोंदणी करा'))),
                )
              ]),
            );
          },
        ),
      ),
    );
  }

  _ruleWidget() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Textwidget(
              color: EventAppColors.textGrayColor,
              text:
                  '1. जवळच्या सरकारी पशुवैद्यकीय दवाखान्यात नोंदणीकृत असलेल्या, कानात 12-अंकी युनिक आयडी टॅग असलेल्या गायींनाच भाग घेण्याची परवानगी आहे.',
            ),
            const Textwidget(
              color: EventAppColors.textGrayColor,
              text:
                  '2. स्पर्धेच्या वेळी सर्व आवश्यक लसीकरण प्रमाणपत्र सादर करणे अनिवार्य आहे.',
            ),
            const Textwidget(
              color: EventAppColors.textGrayColor,
              text:
                  '3. वेगवेगळ्या वयोगटातील स्पर्धेसाठी नोंदणीकृत गायींची पूर्वनिवड केली जाईल आणि शरीराची रचना आणि प्रजनन क्षमतेच्या आधारे आमंत्रित केले जाईल.',
            ),
            const Textwidget(
              color: EventAppColors.textGrayColor,
              text:
                  '4. स्पर्धेसाठी नोंदणीकृत उच्च दूध क्षमता असलेल्या गायींची डिसेंबर महिन्यात स्पर्धेपूर्वी दुग्धोत्पादनासाठी व्यवस्थापन समितीकडून तपासणी केली जाईल आणि त्यांना स्पर्धेसाठी आमंत्रित केले जाईल.',
            ),
            const Textwidget(
              color: EventAppColors.textGrayColor,
              text:
                  '5. तुमचा सहभाग निश्चित करण्यासाठी मोबाइल अँप द्वारे फॉर्म भरून तुमची नोंदणी पूर्ण करा.',
            ),
            const Textwidget(
              color: EventAppColors.textGrayColor,
              text:
                  '6. पंचांचा निर्णय अंतिम असेल, सहभागींकडून कोणताही युक्तिवाद स्वीकार केला जाणार नाही.',
            ),
            const SizedBoxWidget(
              height: 30,
            ),
            Textwidget(
              text: "सुविधा :",
              fontSize: 15.sp,
              fontWeight: FontWeight.bold,
            ),
            const Textwidget(
              text:
                  "1. स्पर्धा कालावधीसाठी हिरवा चारा, सुका चारा आणि पशुखाद्य आयोजक पुरवतील. ",
              color: EventAppColors.textGrayColor,
            ),
            const Textwidget(
              text:
                  "2. खनिज मिश्रण, प्रोबायोटिक्स, टॉक्सिन बाइंडर आणि यकृत टॉनिक यांसारखे पूरक आहार मालकाने स्वतः घेऊन यावे.",
              color: EventAppColors.textGrayColor,
            ),
            const Textwidget(
              text: "3. वाहतूक खर्च आयोजक करतील ",
              color: EventAppColors.textGrayColor,
            ),
            const Textwidget(
              text:
                  "4. सावली, पाणी, मिल्किंग मशीन, दूध संकलनाची सुविधा उपलब्ध करून दिली जाईल.",
              color: EventAppColors.textGrayColor,
            ),
            const Textwidget(
              text:
                  "4. सावली, पाणी, मिल्किंग मशीन, दूध संकलनाची सुविधा उपलब्ध करून दिली जाईल.",
              color: EventAppColors.textGrayColor,
            ),
          ],
        ),
      ),
    );
  }
}
