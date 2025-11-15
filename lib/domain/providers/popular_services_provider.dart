import 'package:flutter/material.dart';
import 'package:freelancer_flutter_ui/data/api_services/popular_services_api.dart';
import 'package:freelancer_flutter_ui/data/models/service_dto.dart';

class PopularServiceProvider with ChangeNotifier {
  final PopularServiceApi _apiService = PopularServiceApi();

  List<PopularServicesData> _servicesData = [];
  List<PopularServicesData> get servicesData => _servicesData;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String? _error;
  String? get error => _error;

  /// Load projects
  Future<void> fetchPopularServices() async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      _servicesData = await _apiService.fetchData();
    } catch (e) {
      _error = e.toString();
    }

    _isLoading = false;
    notifyListeners();
  }
}
