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

  FreelancerProvider() {
    print("Provider initialized >>");
    fetchFreelancers();
  }

  Future<void> fetchFreelancers() async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final data = await apiService.fetchData();

      print('Fetched ${data.length} freelancers');

      _freelancers = data;
    } catch (e) {
      _errorMessage = e.toString(); // store error only
      print("Error: $_errorMessage");
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void refresh() => fetchFreelancers();
}
