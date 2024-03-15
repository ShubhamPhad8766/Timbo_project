import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/single_child_widget.dart';
import 'package:timbo/logic/address/address_cubit.dart';
import 'package:timbo/logic/cart/cart_cubit.dart';

import 'package:timbo/logic/company_setup/company_setup_cubit.dart';
import 'package:timbo/logic/favorite_category/cubit/favorite_category_cubit.dart';
import 'package:timbo/logic/home/home_cubit.dart';
import 'package:timbo/logic/personal_info/personal_info_cubit.dart';
import 'package:timbo/logic/product_list_cubit/productlist_cubit.dart';
import 'package:timbo/logic/profile/profile_cubit.dart';
import 'package:timbo/logic/promotion/promotion_cubit.dart';
import 'package:timbo/logic/search_product/search_product_cubit.dart';
import 'package:timbo/logic/send_otp/send_otp_cubit.dart';
import 'package:timbo/logic/top_category/top_category_cubit.dart';
import 'package:timbo/logic/top_selling/top_selling_cubit.dart';
import 'package:timbo/logic/verify_otp/verify_otp_cubit.dart';

import '../events/logic/calf_competition/calf_competition_cubit.dart';
import '../events/logic/cow_registration/cow_register_cubit.dart';
import '../logic/address/default_address_cubit/default_address_cubit.dart';
import '../logic/comman/action_chip_cubit.dart';
import '../logic/get_all_product_list/get_all_product_list_cubit.dart';
import '../logic/order/my_orders/my_order_cubit.dart';
import '../logic/order/ordered_bill/ordered_bill_cubit.dart';
import '../logic/order_summary/order_summary_cubit.dart';
import '../logic/payment/payment_cubit.dart';
import '../logic/scanned_barcode/scan_barcode_cubit.dart';
import '../logic/image_upload/image_upload_cubit.dart';

List<SingleChildWidget> blocProviders = [
  BlocProvider(create: (context) => SendOtpCubit()),
  BlocProvider(create: (context) => VerifyOtpCubit()),
  BlocProvider(create: (context) => PersonalInfoCubit()),
  BlocProvider(create: (context) => FavoriteCategoryCubit()),
  BlocProvider(create: (context) => HomeCubit()),
  BlocProvider(create: (context) => ProfileCubit()),
  BlocProvider(create: (context) => CompanySetupCubit()),
  BlocProvider(create: (context) => PromotionCubit()),
  BlocProvider(create: (context) => TopSellingCubit()),
  BlocProvider(create: (context) => TopCategoryCubit()),
  BlocProvider(create: (context) => ProductListCubit()),
  BlocProvider(create: (context) => SearchProductCubit()),
  BlocProvider(create: (context) => GetAllProductCubit()),
  BlocProvider(create: (context) => CartCubit()),
  BlocProvider(create: (context) => AddressCubit()),
  BlocProvider(create: (context) => ActionChipCubit()),
  BlocProvider(create: (context) => OrderSummaryCubit()),
  BlocProvider(create: (context) => DefaultAddressCubit()),
  BlocProvider(create: (context) => PaymentCubit()),
  BlocProvider(create: (context) => OrderedBillCubit()),
  BlocProvider(create: (context) => BarCodeScanCubit()),
  BlocProvider(create: (context) => MyOrderCubit()),

  //Event Cubits
  BlocProvider(create: (context) => ImageUploadCubit()),


  // Event
  BlocProvider(create: (context) => CowRegisterCubit()),
  BlocProvider(create: (context) => CalfCompetitionCubit()),
];
