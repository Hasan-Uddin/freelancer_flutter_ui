// import 'package:flutter/material.dart';
// import '../../data/models/service_model.dart';
// import '../../data/models/freelancer_model.dart';
// import '../../data/mock/mock_data.dart';

// class HomeProvider extends ChangeNotifier {
//   final List<ServiceModel> _services = List.from(mockServices);
//   final List<FreelancerModel> _freelancers = List.from(mockFreelancers);

//   List<ServiceModel> get services => List.unmodifiable(_services);
//   List<FreelancerModel> get freelancers => List.unmodifiable(_freelancers);

//   // Simple search filter on title/subtitle
//   List<ServiceModel> searchServices(String q) {
//     if (q.trim().isEmpty) return services;
//     final key = q.toLowerCase();
//     return _services
//         .where(
//           (s) =>
//               s.title.toLowerCase().contains(key) ||
//               s.subtitle.toLowerCase().contains(key) ||
//               s.description.toLowerCase().contains(key),
//         )
//         .toList();
//   }

//   // Example: toggle sponsorship (toy example to show provider usage)
//   void toggleSponsored(String id) {
//     final i = _services.indexWhere((s) => s.id == id);
//     if (i != -1) {
//       _services[i] = ServiceModel(
//         id: _services[i].id,
//         title: _services[i].title,
//         subtitle: _services[i].subtitle,
//         image: _services[i].image,
//         rating: _services[i].rating,
//         reviews: _services[i].reviews,
//         level: _services[i].level,
//         price: _services[i].price,
//         description: _services[i].description,
//         sponsored: !_services[i].sponsored,
//         tag: '',
//       );
//       notifyListeners();
//     }
//   }
// }
