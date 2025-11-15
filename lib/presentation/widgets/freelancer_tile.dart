import 'package:flutter/material.dart';
import '../../data/models/freelancer_model.dart';

class FreelancerTile extends StatelessWidget {
  final FreelancerModel freelancer;
  const FreelancerTile({super.key, required this.freelancer});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: AssetImage("assets/images/avatar.png"),
        ), //temp
        title: Text('${freelancer.name} • ${freelancer.title}'),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('${freelancer.rating} (${freelancer.reviews} reviews)'),
            Text(freelancer.location, style: const TextStyle(fontSize: 12)),
          ],
        ),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '\$${freelancer.hourlyRate}/hr',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 6),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.blue.shade50,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                freelancer.levelTag,
                style: const TextStyle(fontSize: 12),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
