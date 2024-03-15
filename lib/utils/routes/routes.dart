import 'dart:developer';

import 'package:go_router/go_router.dart';
import 'package:timbo/events/presentations/option_screen/option_screen.dart';
import 'package:timbo/model/address_response_model/default_address_response_model.dart';
import 'package:timbo/model/top_category_response_model/top_category_response_model.dart';
import 'package:timbo/model/top_selling_product_response_model/top_selling_product_response_model.dart';
import 'package:timbo/presentations/about_us/about_us_screen.dart';
import 'package:timbo/presentations/address_screen/address_screen.dart';
import 'package:timbo/presentations/basic_info/basic_info_screen.dart';
import 'package:timbo/presentations/cancellation_refund_policy/cancellation_refund_policy.dart';
import 'package:timbo/presentations/cart_screen/cart_screen.dart';
import 'package:timbo/presentations/company_setup/company_setup_screen.dart';
import 'package:timbo/presentations/contact_us_screen/contact_us_screen.dart';
import 'package:timbo/presentations/edit_profile_screen/edit_profile_screen.dart';
import 'package:timbo/presentations/home_screen/tabs/chat_bot_screen/chat_bot_screen.dart';
import 'package:timbo/presentations/home_screen/home_screen.dart';
import 'package:timbo/presentations/onboard_screen/onboard_screen.dart';
import 'package:timbo/presentations/order_summary/order_summary_screen.dart';
import 'package:timbo/presentations/payment_screen/payment_screen.dart';
import 'package:timbo/presentations/preferences_screen/preference_screen.dart';
import 'package:timbo/presentations/privacy_policy/privacy_policy_screen.dart';
import 'package:timbo/presentations/product_details_screen/product_details_screen.dart';
import 'package:timbo/presentations/product_list/product_list.dart';
import 'package:timbo/presentations/scanner_screen/scanner_screen.dart';
import 'package:timbo/presentations/send_code/send_code_screen.dart';
import 'package:timbo/presentations/about/about.dart';
import 'package:timbo/presentations/splash_screen/splash_screen.dart';
import 'package:timbo/presentations/top_selling_list_screen/top_selling_list_screen.dart';
import 'package:timbo/presentations/verify_code_screen/verify_code_screen.dart';

import '../../events/presentations/book_stall/book_stall_screen.dart';
import '../../events/presentations/competition_registration/cow_event_registration.dart';
import '../../events/presentations/competition_registration/calf_event_registration.dart';
import '../../events/presentations/event_registration/event_registration.dart';
import '../../events/presentations/gatepass/gatepass_screen.dart';
import '../../events/presentations/home_screen/event_home_screen.dart';
import '../../model/order_summary_response_model/order_summary_response_model.dart';
import '../../presentations/about/delete_account_screen/delete_account_screen.dart';
import '../../presentations/my_orders_screen/my_orders_screen.dart';
import '../../presentations/ordered_bill_screen/ordered_bill_screen.dart';
import '../../presentations/ordered_details_screen/ordered_details_screen.dart';
import '../../presentations/top_category_list_screen/top_category_list_screen.dart';

class Routes {
  static String initial = "/";
  static String getStartedScreen = "/get-started";
  static String verifyNumberScreen = "/verify-number";
  static String verifyCodeScreen = "/verify-code";
  static String basicInfoScreen = "/basic-info";
  static String companyInfoScreen = "/company-info";
  static String preferenceScreen = "/preference";
  static String splashScreen = "/splash";
  static String homeScreen = "/home";
  static String chatScreen = "/chat";
  static String cartScreen = "/cart";
  static String scannerScreen = "/scanner";
  static String categoryListScreen = "/category-list";
  static String topSellingListScreen = "/top-selling-list";
  static String productDetailsScreen = "/product-details";
  static String editProfileScreen = "/edit-profile";
  static String productListScreen = "/product-list";
  static String contactUsScreen = "/contact_us";
  static String aboutUsScreen = "/about_us";
  static String orderSummaryScreen = "/order_Summary";
  static String paymentScreen = "/payment";
  static String orderBillScreen = "/order-bill";
  static String myOrdersScreen = "/my-order";
  static String orderedDetailsScreen = "/order-detail";
  static String addressScreen = "/address";
  static String privacyDeleteAccount = "/privacy/delete-account";

  static String privacyPolicy = "/privacy";
  static String cancellationAndRefundPolicy = "/Cancellation-Refund-Policy";
  // static String settings = "/settings";
  static String about = "/about";

  //event
  static String optionScreen = "/option";
  static String eventHomeScreen = "/event-home";
  static String calfRegistrationScreen = "/calf-registration";
  static String cowRegistrationScreen = "/cow-registration";
  static String eventRegistrationScreen = "/event-registration";
  static String gatepassScreen = "/gatepass";
  static String bookStallScreen = "/book-stall";

  GoRouter get router => _goRouter;

  late final GoRouter _goRouter = GoRouter(
    initialLocation: splashScreen,
    routes: [
      GoRoute(
        path: "$productListScreen/:categoryName",
        builder: (context, state) {
          var data = state.extra as Map<String, String>;
          String? categoryName = data["categoryName"];
          String? categoryId = data["categoryId"];
          return ProductListScreen(
            categoryName: categoryName,
            categoryId: categoryId,
          );
        },
      ),
      GoRoute(
        path: about,
        builder: (context, state) => const About(),
      ),
      GoRoute(
        path: cancellationAndRefundPolicy,
        builder: (context, state) => const CancellationRefundPolicy(),
      ),
      GoRoute(
        path: privacyPolicy,
        builder: (context, state) => const PrivacyPolicyScreen(),
      ),
      GoRoute(
        path: addressScreen,
        builder: (context, state) => const AddressScreen(),
      ),
      GoRoute(
        path: editProfileScreen,
        builder: (context, state) => const EditProfileScreen(),
      ),
      GoRoute(
        path: splashScreen,
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: getStartedScreen,
        builder: (context, state) => const OnBoardScreen(),
      ),
      GoRoute(
        path: verifyNumberScreen,
        builder: (context, state) => const SendCodeScreen(),
      ),
      GoRoute(
        path: verifyCodeScreen,
        builder: (context, state) {
          var data = state.extra as Map<String, String>;
          String? phoneNumber = data["phoneNumber"];
          return VerifyCodeScreen(
            phoneNumber: phoneNumber,
          );
        },
      ),
      GoRoute(
        path: basicInfoScreen,
        builder: (context, state) {
          log(state.extra.toString());
          var data = state.extra as Map<String, String>;
          String? phoneNumber = data["phoneNumber"];
          return BasicInfoScreen(
            phoneNumber: phoneNumber,
          );
        },
      ),
      GoRoute(
        path: companyInfoScreen,
        builder: (context, state) => const CompanySetupScreen(),
      ),
      GoRoute(
        path: preferenceScreen,
        builder: (context, state) => const PreferencesScreen(),
      ),
      GoRoute(
        path: homeScreen,
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        path: chatScreen,
        builder: (context, state) => const ChatbotScreen(),
      ),
      GoRoute(
        path: scannerScreen,
        builder: (context, state) => const ScannerScreen(),
      ),
      GoRoute(
        path: cartScreen,
        builder: (context, state) => const CartScreen(),
      ),
      GoRoute(
        path: "$productDetailsScreen/:productSlug",
        builder: (context, state) {
          var item = state.extra as TopSellingItem;
          return ProductDetailsScreen(
            item: item,
          );
        },
      ),
      GoRoute(
        path: topSellingListScreen,
        builder: (context, state) {
          var list = state.extra as List<TopSellingItem>;
          return TopSellingListScreen(
            list: list,
          );
        },
      ),
      GoRoute(
          path: categoryListScreen,
          builder: (context, state) {
            var item = state.extra as List<CategoryItem>;
            return CategoryListScreen(
              list: item,
            );
          }),
      GoRoute(
        path: contactUsScreen,
        builder: (context, state) => const ContactUsScreen(),
      ),
      GoRoute(
        path: aboutUsScreen,
        builder: (context, state) => const AboutUsScreen(),
      ),
      GoRoute(
        path: orderSummaryScreen,
        builder: (context, state) => const OrderSummaryScreen(),
      ),
      GoRoute(
          path: paymentScreen,
          builder: (context, state) {
            var data = state.extra as Map<String, Object?>;
            AddressModel? defaultAddress =
                data["defaultAddress"] as AddressModel?;
            ProductData? orderedProduct =
                data["orderedProduct"] as ProductData?;
            int? totalAmount = data["totalAmount"] as int?;
            return PaymentScreen(
                addressModel: defaultAddress,
                orderedProduct: orderedProduct,
                totalAmount: totalAmount);
          }),
      GoRoute(
          path: orderBillScreen,
          builder: (context, state) {
            var data = state.extra as Map<String, int?>;
            return OrderBillScreen(orderId: data["orderId"]);
          }),
      GoRoute(
        path: myOrdersScreen,
        builder: (context, state) => const MyOrdersScreen(),
      ),
      GoRoute(
        path: privacyDeleteAccount,
        builder: (context, state) => const DeleteAccountScreen(),
      ),

      GoRoute(
          path: orderedDetailsScreen,
          builder: (context, state) {
            var data = state.extra as Map<String, String>;
            return OrderedDetailsScreen(
              orderedId: data["orderId"],
            );
          }),


          //Event
        GoRoute(
        path: optionScreen,
        builder: (context, state) => const OptionScreen(),
      ),
        GoRoute(
        path: eventHomeScreen,
        builder: (context, state) => const EventHomeScreen(),
      ),
        GoRoute(
        path: calfRegistrationScreen,
        builder: (context, state) => const CalfRegistrationScreen(),
      ),
        GoRoute(
        path: cowRegistrationScreen,
        builder: (context, state) => const CowEventRegistrationSCreen(),
      ),
    
        GoRoute(
        path: eventRegistrationScreen,
        builder: (context, state) => const EventRegistrationScreen(),
      ),
        GoRoute(
        path: gatepassScreen,
        builder: (context, state) => const GatepassScreen(),
      ),
        GoRoute(
        path: bookStallScreen,
        builder: (context, state) => const BookStallScreen(),
      ),
    ],
    redirect: (context, state) async {
      return null;
    },
  );
}
