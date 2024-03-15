import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timbo/constants/app_sizes.dart';
import 'package:timbo/utils/app_utils/app_utils/app_utils.dart';

import '../../constants/app_strings.dart';
import '../../widgets/text_widget.dart';

class PrivacyPolicyScreen extends StatefulWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  State<PrivacyPolicyScreen> createState() => _PrivacyPolicyScreenState();
}

class _PrivacyPolicyScreenState extends State<PrivacyPolicyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        appBar: AppBar(
          surfaceTintColor: Theme.of(context).scaffoldBackgroundColor,
          systemOverlayStyle: systemOverLayStyle,
          iconTheme:
              IconThemeData(color: Theme.of(context).secondaryHeaderColor),
          automaticallyImplyLeading: true,
          elevation: 0,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          title: Textwidget(
            fontSize: 18.sp,
            text: AppStrings.privacyPolicy,
            fontWeight: FontWeight.bold,
          ),
          centerTitle: true,
        ),
        body: Scrollbar(
          thickness: 4.0,
          thumbVisibility: true,
          radius: Radius.circular(15.r),
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: AppSizes.horizontalScreen20pxPaddingPhone,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Textwidget(
                    fontSize: AppSizes.small12pxTextSize,
                    textAlign: TextAlign.justify,
                    text:
                        "This privacy policy sets out how BAAP Experience Pvt Ltd uses and protects any information that you give BAAP Experience centre when you use this website. BAAP Experience Centre is committed to ensuring that your privacy isprotected. Should we ask you to provide certain information by which you can be identified when using this website, and then you can be assured that it will only be used in accordance with this privacy statement.",
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Textwidget(
                    fontSize: AppSizes.small12pxTextSize,
                    textAlign: TextAlign.justify,
                    text:
                        "BAAP Experience Centre may change this policy from time to time by updating this page. You should check this page from time to time to ensure that you are happy with any changes.",
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Textwidget(
                    fontSize: AppSizes.medium14pxTextSize,
                    textAlign: TextAlign.justify,
                    fontWeight: FontWeight.bold,
                    text: "What we collect?",
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Textwidget(
                    fontSize: AppSizes.small12pxTextSize,
                    textAlign: TextAlign.justify,
                    text: "We may collect the following information:",
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Textwidget(
                    fontSize: AppSizes.small12pxTextSize,
                    textAlign: TextAlign.start,
                    text: "\u2022 name",
                  ),
                  Textwidget(
                    fontSize: AppSizes.small12pxTextSize,
                    textAlign: TextAlign.start,
                    text: "\u2022 contact information including email address",
                  ),
                  Textwidget(
                    fontSize: AppSizes.small12pxTextSize,
                    textAlign: TextAlign.start,
                    text:
                        "\u2022 demographic information such as postcode, preferences and interests",
                  ),
                  Textwidget(
                    fontSize: AppSizes.small12pxTextSize,
                    textAlign: TextAlign.start,
                    text:
                        "\u2022 other information relevant to customer surveys and/or offers",
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Textwidget(
                    fontSize: AppSizes.medium14pxTextSize,
                    textAlign: TextAlign.start,
                    fontWeight: FontWeight.bold,
                    text: "What we do with the information we gather",
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Textwidget(
                    fontSize: AppSizes.small12pxTextSize,
                    textAlign: TextAlign.justify,
                    text:
                        "We require this information to understand your needs and provide you with a better service, and in particular for the following reasons:",
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Textwidget(
                    fontSize: AppSizes.small12pxTextSize,
                    textAlign: TextAlign.start,
                    text: "\u2022 Internal record keeping.",
                  ),
                  Textwidget(
                    fontSize: AppSizes.small12pxTextSize,
                    textAlign: TextAlign.justify,
                    text:
                        "\u2022 We may use the information to improve our products and services.",
                  ),
                  Textwidget(
                    fontSize: AppSizes.small12pxTextSize,
                    textAlign: TextAlign.justify,
                    text:
                        "\u2022 We may periodically send promotional emails about new products, special offers or other information which we think you may find interesting using the email address which you have provided.",
                  ),
                  Textwidget(
                    fontSize: AppSizes.small12pxTextSize,
                    textAlign: TextAlign.justify,
                    text:
                        "\u2022 From time to time, we may also use your information to contact you for market research purposes. We may contact you by email, phone, fax or mail. We may use the information to customise the website according to your interests.",
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Textwidget(
                    fontSize: AppSizes.medium14pxTextSize,
                    textAlign: TextAlign.start,
                    fontWeight: FontWeight.bold,
                    text: "Security",
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Textwidget(
                    fontSize: AppSizes.small12pxTextSize,
                    textAlign: TextAlign.justify,
                    text:
                        "We are committed to ensuring that your information is secure. In order to prevent unauthorised access or disclosure we have put in place suitable physical, electronic and managerial procedures to safeguard and secure the information we collect online.",
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Textwidget(
                    fontSize: AppSizes.medium14pxTextSize,
                    textAlign: TextAlign.start,
                    fontWeight: FontWeight.bold,
                    text: "How we use cookies",
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Textwidget(
                    fontSize: AppSizes.small12pxTextSize,
                    textAlign: TextAlign.justify,
                    text:
                        "A cookie is a small file which asks permission to be placed on your computers hard drive. Once you agree, the file is added and the cookie helps analyses web traffic or lets you know when you visit a particular site. Cookies allow web applications to respond to you as an individual. The web application can tailor its operations to your needs, likes and dislikes by gathering and remembering information about your preferences.",
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Textwidget(
                    fontSize: AppSizes.small12pxTextSize,
                    textAlign: TextAlign.justify,
                    text:
                        "We use traffic log cookies to identify which pages are being used. This helps us analyses data about webpage traffic and improve our website in order to tailor it to customer needs. We only use this information for statistical analysis purposes and then the data is removed from the system.",
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Textwidget(
                    fontSize: AppSizes.small12pxTextSize,
                    textAlign: TextAlign.justify,
                    text:
                        "Overall, cookies help us provide you with a better website, by enabling us to monitor which pages you find useful and which you do not. A cookie in no way gives us access to your computer or any information about you, other than the data you choose to share with us.",
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Textwidget(
                    fontSize: AppSizes.small12pxTextSize,
                    textAlign: TextAlign.justify,
                    text:
                        "You can choose to accept or decline cookies. Most web browsers automatically accept cookies, but you can usually modify your browser setting to decline cookies if you prefer. This may prevent you from taking full advantage of the website.",
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Textwidget(
                    fontSize: AppSizes.medium14pxTextSize,
                    textAlign: TextAlign.start,
                    fontWeight: FontWeight.bold,
                    text: "Links to other websites",
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Textwidget(
                    fontSize: AppSizes.small12pxTextSize,

                    textAlign: TextAlign.justify,
                    text:
                        "Our website may contain links to other websites of interest. However, once you have used these links to leave our site, you should note that we do not have any control over that other website. Therefore, we cannot be responsible for the protection and privacy of any information which you provide whilst visiting such sites and such sites are not governed by this privacy statement. You should exercise caution and look at the privacy statement applicable to the website in question.",
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Textwidget(
                      fontSize: AppSizes.medium14pxTextSize,
                      textAlign: TextAlign.start,
                      fontWeight: FontWeight.bold,
                      text: "Controlling your personal information"),
                  SizedBox(
                    height: 5.h,
                  ),
                  Textwidget(
                      fontSize: AppSizes.small12pxTextSize,
                      textAlign: TextAlign.justify,
                      text: "You may choose to restrict the collection or use of your personal information in the following ways:"),
                  SizedBox(
                    height: 5.h,
                  ),
                  Textwidget(
                    fontSize: AppSizes.small12pxTextSize,
                    textAlign: TextAlign.justify,
                    text:
                    "\u2022 whenever you are asked to fill in a form on the website, look for the box that you can click to indicate that you do not want the information to be used by anybody for direct marketing purposes",
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Textwidget(
                    fontSize: AppSizes.small12pxTextSize,
                    textAlign: TextAlign.justify,
                    text:
                    "\u2022 if you have previously agreed to us using your personal information for direct marketing purposes, you may change your mind at any time by writing to or emailing us at experiences@baapcompany.com",
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Textwidget(
                    fontSize: AppSizes.small12pxTextSize,
                    textAlign: TextAlign.justify,
                    text:
                    "If you believe that any information we are holding on you is incorrect or incomplete, please write to or email us as soon as possible, at the above address. We will promptly correct any information found to be incorrect.",
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Textwidget(
                    fontSize: AppSizes.medium14pxTextSize,
                    textAlign: TextAlign.start,
                    fontWeight: FontWeight.bold,
                    text:
                    "Contacting Us",
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Textwidget(
                    fontSize: AppSizes.small12pxTextSize,
                    textAlign: TextAlign.justify,

                    text:
                    "If there are any questions regarding this privacy policy you may contact us using the information below",
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Textwidget(
                    fontSize: AppSizes.small12pxTextSize,
                    textAlign: TextAlign.justify,
                    text:
                    "experiences@baapcompany.com",
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
