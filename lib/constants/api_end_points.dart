class ApiEndPoints {
  static const String baseUrl =
      "https://crotmwego7.execute-api.us-east-2.amazonaws.com/auth/";

  static const String getWayUrl =
      "https://l6v4zdocu3.execute-api.us-east-2.amazonaws.com/";
  // "https://l6v4zdocu3.execute-api.us-east-2.amazonaws.com/authgw/";
  static const String ecommerceBaseUrl =
      "https://t1ojrighqa.execute-api.us-east-2.amazonaws.com/commerce/";

  static const String imageUploadBaseUrl = 'https://oyflwrul24.execute-api.ap-south-1.amazonaws.com/default/';
  static const String imageUpload = 'getS3SignedUrl';



  static const String group = "group";
  static const String order = "order/";
  static const String promotion =
      "promotions/all/getByGroupId/$groupId?pageNumber=1&pageSize=5";
  static const String category = "category/";

  static const String auth = "auth";
  static const String authGw = "authgw/";
  static const String commerceGw = "commerce-gw/";

  static const String orderSummary = "getProductByUserId/$groupId/";
  static const String ordergetByOrderId = "order/getByOrderId/";
  static const String orderGetByuserId = "$order/all/getByGroupId/$groupId?userid=";

  static const String user = "user";
  static const String sendOtpWhatsAPP = "sendotp";
  static const String verifyOtp = "/validateOtp";
  static const String signUp = "/signup";
  static const String saveUserProfile = "userprofile/save/";
  static const String saveUserAddress = "userprofile/address/";
  static const String deleteUserAddress = "userprofile/DeleteAddress/";
  static const String updateUserAddress = "userprofile/updateByAddressId/";
  static const String setDefaultUserAddress =
      "userprofile/setIsDefaultAddress/user/";
  static const String getDefaultUserAddress = "userprofile/getDefaultAddress/";

  static const String getfavoritesCategories = "/all/getByGroupId/";

  static const String groupId = "1687348063136";
  static const String createCompanyId = "6492e35f297b1484891df646";

  static const String companyDetails = "/companydetails/$createCompanyId";
  static const String userDetails = "userprofile/getAllAddress/";

  static const String topSelling =
      "products/find/get-top-selling-products/$groupId";

  static const String topCategory =
      "category/all/getByGroupId/$groupId?pageNumber=1&pageSize=10";

  static const String productByCategoryId =
      "products/all/getByGroupId/$groupId?categoryId=";

  static const String productByProductCode = "products/getByproductcode/";

  static const String productAllProduct =
      "products/all/getByGroupId/$groupId?pageNumber=1&pageSize=100";

  static const String searchProcutByname =
      "products/all/getByGroupId/$groupId?pageNumber=1&pageSize=30&name=";

  ///cart end points
  static const String cart = "cart/";

  static const String getCartByGroupIdAndUserId = "${cart}getProductByUserId/";




      //Events Api
  static const String eventBaseUrl =
      "https://t1ojrighqa.execute-api.us-east-2.amazonaws.com/commerce/";

  static const String cowCompetition = "competition/64f09ff168942a6f1af31d8b";
  static const String calfCompetition = "competition/64f09ff168942a6f1af31d8b";

}
