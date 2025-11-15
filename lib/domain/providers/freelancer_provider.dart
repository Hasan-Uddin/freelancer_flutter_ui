import 'package:flutter/material.dart';
import 'package:freelancer_flutter_ui/data/api_services/frelancers_api.dart';
import 'package:freelancer_flutter_ui/data/models/freelancer_dto.dart';

class FreelancerProvider extends ChangeNotifier {
  final FreelancerApiService apiService = FreelancerApiService();

  List<FreelancerData> _freelancers = [];
  List<FreelancerData> get freelancers => _freelancers;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  int _currentPage = 1;
  int get currentPage => _currentPage;

  Future<void> fetchFreelancers({int page = 1}) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final data = await apiService.fetchFreelancers(page: page);
      print('Fetched ${data.length} freelancers');
      if (page == 1) {
        _freelancers = data;
      } else {
        _freelancers.addAll(data);
      }
      _currentPage = page;
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void refresh() {
    fetchFreelancers(page: 1);
  }
}
