import 'dart:convert';
import 'package:freelancer_flutter_ui/data/models/freelancer_dto.dart';
import 'package:http/http.dart' as http;

class FreelancerApiService {
  final String baseUrl =
      'https://xilancer.xgenious.com/api/v1/freelancers/list';
  //https://xilancer.xgenious.com/api/v1/freelancers/list?/page=1
  Future<List<FreelancerData>> fetchFreelancers({int page = 1}) async {
    final response = await http.get(Uri.parse('$baseUrl?/page=$page'));
    try {
      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonData = json.decode(response.body);
        return (jsonData['data'] as List)
            .map((item) => FreelancerData.fromJson(item))
            .toList();
      } else {
        throw Exception('Failed to fetch freelancers');
      }
    } on Exception catch (e) {
      throw Exception('Error fetching projects: $e');
    }
  }
}
