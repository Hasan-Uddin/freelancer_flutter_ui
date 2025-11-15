import 'package:flutter/material.dart';

class JobTile extends StatelessWidget {
  final String postedAgo;
  final String title;
  final String level;
  final String jobType;
  final bool isSponsored;
  final double price;
  final String avatarUrl;
  final bool isSaved;
  final VoidCallback onSaveTap;

  const JobTile({
    super.key,
    required this.postedAgo,
    required this.title,
    required this.level,
    required this.jobType,
    required this.isSponsored,
    required this.price,
    required this.avatarUrl,
    required this.isSaved,
    required this.onSaveTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 0.7,
            offset: Offset(0, 1),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Header row
          Row(
            children: [
              CircleAvatar(
                radius: 18,
                backgroundImage: NetworkImage(avatarUrl),
              ),
              const SizedBox(width: 10),
              Text(
                "Posted $postedAgo",
                style: TextStyle(color: Colors.grey.shade600, fontSize: 13),
              ),
              const Spacer(),
              InkWell(
                onTap: onSaveTap,
                child: Icon(
                  isSaved ? Icons.favorite : Icons.favorite_border,
                  color: isSaved ? Colors.red : Colors.grey.shade600,
                ),
              ),
            ],
          ),

          const SizedBox(height: 12),

          /// Title
          Text(
            title,
            style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
          ),

          const SizedBox(height: 12),

          /// Tags row
          Wrap(
            spacing: 8,
            children: [
              _tag(
                label: level,
                icon: Icons.lock_outline,
                bg: Colors.green.shade50,
                color: Colors.green.shade700,
              ),
              _tag(
                label: jobType,
                bg: Colors.purple.shade50,
                color: Colors.purple,
              ),
              if (isSponsored)
                _tag(
                  label: "Sponsored",
                  bg: Colors.grey.shade200,
                  color: Colors.grey.shade700,
                ),
            ],
          ),

          const SizedBox(height: 16),

          /// Footer price
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Fixed Price",
                  style: TextStyle(fontSize: 15, color: Colors.grey),
                ),
                Text(
                  "\$${price.toStringAsFixed(0)}",
                  style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// Resuable - tags
  Widget _tag({
    required String label,
    Color? bg,
    Color? color,
    IconData? icon,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(17),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) ...[
            Icon(icon, size: 14, color: color),
            const SizedBox(width: 4),
          ],
          Text(
            label,
            style: TextStyle(
              color: color,
              fontSize: 13,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}

// @override
// Widget build(BuildContext context) {
//   return ListTile(
//     contentPadding: EdgeInsets.zero,
//     title: Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
//     subtitle: Text(timeAgo),
//     trailing: Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         Text(
//           '\$${price.toStringAsFixed(0)}',
//           style: const TextStyle(fontWeight: FontWeight.bold),
//         ),
//         const SizedBox(height: 4),
//         Container(
//           padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
//           decoration: BoxDecoration(
//             color: Colors.grey.shade100,
//             borderRadius: BorderRadius.circular(8),
//           ),
//           child: const Text('Fixed', style: TextStyle(fontSize: 12)),
//         ),
//       ],
//     ),
//   );
// }
