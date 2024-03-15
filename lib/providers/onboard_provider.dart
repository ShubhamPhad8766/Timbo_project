import 'package:flutter/material.dart';
import 'package:timbo/constants/api_end_points.dart';
import 'package:timbo/model/get_started_response_model.dart';
import 'package:timbo/repositories/get_started_repo/get_started_repo.dart';

class OnBoardProvider with ChangeNotifier {
  List<BannerData> _bannerData = [];
  List<BannerData> get bannerData => _bannerData;
  final PageController _pageController = PageController();
  PageController get pageController => _pageController;
  int _currentPage = 0;
  int get currentPage => _currentPage;
  final GetStartedRepo _getStartedRepo = GetStartedRepo();
  String _errorMessage = "";
  String get errorMessage => _errorMessage;
  GetStartedResponseModel _getStartedResponseModel = GetStartedResponseModel();
  GetStartedResponseModel get getStartedResponseModel =>
      _getStartedResponseModel;

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  void getBanners() async {
    _isLoading = true;
    var response =
        await _getStartedRepo.getBanners(groupId: ApiEndPoints.groupId);
    response.fold((error) {
      _errorMessage = error.message;
      _isLoading = false;
      notifyListeners();
    }, (data) {
      _getStartedResponseModel = data;
      _bannerData = _getStartedResponseModel.data?.banners ?? [];
      _isLoading = false;
      notifyListeners();
    });
  }

  setCurrentPageIndicator(int value) {
    _currentPage = value;
    notifyListeners();
  }
}
