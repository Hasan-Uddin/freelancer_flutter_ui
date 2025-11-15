import 'dart:convert';
import 'package:freelancer_flutter_ui/data/models/freelancer_dto.dart';
import 'package:freelancer_flutter_ui/data/models/service_dto.dart';
import 'package:http/http.dart' as http;

class FreelancerApiService {
  // base url
  final String _baseUrl =
      'https://xilancer.xgenious.com/api/v1/freelancers/list';

  Future<List<FreelancerData>> fetchData() async {
    try {
      final response = await http.get(Uri.parse(_baseUrl));

      if (response.statusCode == 200) {
        // Parse the response body as a JSON object
        final Map<String, dynamic> data = json.decode(response.body);

        // Check if the response has data
        if (data['success'] == true) {
          List<dynamic> FreelancerList = data['data'];

          // Convert each project into a Project model and return
          return FreelancerList.map((e) => FreelancerData.fromJson(e)).toList();
        } else {
          throw Exception('Failed to load projects');
        }
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      throw Exception('Error fetching projects: $e');
    }
  }
}
