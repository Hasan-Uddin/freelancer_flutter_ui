import 'package:flutter/material.dart';
import 'package:freelancer_flutter_ui/core/utils/responsive.dart';
import 'package:freelancer_flutter_ui/data/models/freelancer_dto.dart';

class FreelancersTile extends StatelessWidget {
  final List<String> skills;
  final bool isPro;
  final bool isVerified;
  final FreelancerData freelancer;

  const FreelancersTile({
    super.key,
    this.skills = const ["Flutter", "Dart"],
    required this.isPro,
    required this.freelancer,
    this.isVerified = true,
  });

  @override
  Widget build(BuildContext context) {
    final skillDisplay = skills.take(2).toList();
    final extraCount = skills.length - skillDisplay.length;

    return Container(
      width: Responsive.scaleWidth(context, 350),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white,
      ),
      margin: EdgeInsets.only(
        right: Responsive.scaleWidth(context, 10),
        top: Responsive.scaleWidth(context, 10),
        bottom: Responsive.scaleWidth(context, 10),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // ---------------------- TOP ROW -----------------------
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(40),
                      child: Image.network(
                        freelancer.imageUrl ??
                            "https://xilancer.xgenious.com/assets/static/img/default-profile.png",
                        width: 45,
                        height: 45,
                        fit: BoxFit.cover,
                        // This handles network errors
                        errorBuilder:
                            (
                              BuildContext context,
                              Object error,
                              StackTrace? stackTrace,
                            ) {
                              return Image.asset(
                                'assets/images/avatar.png', // local fallback image
                                width: 45,
                                height: 45,
                                fit: BoxFit.cover,
                              );
                            },
                      ),
                    ),

                    const SizedBox(width: 8),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Name + Verified
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  freelancer.name ?? "Hasan Uddin",
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              if (isVerified)
                                Icon(
                                  Icons.check_circle_sharp,
                                  color: Theme.of(context).colorScheme.primary,
                                  size: 18,
                                ),
                            ],
                          ),
                          const SizedBox(height: 2),
                          Text(
                            freelancer.title ?? "Flutter Developer",
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey.shade600,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 12),

                // ---------------------- SKILLS -----------------------
                SizedBox(
                  height: 28,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      ...skillDisplay.map(
                        (skill) => Container(
                          margin: const EdgeInsets.only(right: 8),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            skill,
                            style: const TextStyle(fontSize: 12),
                          ),
                        ),
                      ),
                      if (extraCount > 0)
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade300,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            '+$extraCount',
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                    ],
                  ),
                ),

                const SizedBox(height: 12),

                // ---------------------- REVIEW -----------------------
                Row(
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.star_border, size: 18),
                        const SizedBox(width: 6),
                        Text(
                          "Review",
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.grey.shade700,
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Expanded(
                      child: Text(
                        "${freelancer.statistics?.averageRating?.toStringAsFixed(1) ?? "0.0"} (${freelancer.statistics?.totalReviews ?? 0} reviews)",
                        style: const TextStyle(fontSize: 13),
                        textAlign: TextAlign.right,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 6),

                // ---------------------- LOCATION -----------------------
                Row(
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.location_on_outlined, size: 18),
                        const SizedBox(width: 6),
                        Text(
                          "Location",
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.grey.shade700,
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Expanded(
                      child: Text(
                        "${freelancer.location?.state ?? ''}, ${freelancer.location?.country ?? ''}",
                        style: const TextStyle(fontSize: 13),
                        textAlign: TextAlign.right,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 6),

                // ---------------------- HOURLY RATE -----------------------
                Row(
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.attach_money, size: 18),
                        const SizedBox(width: 6),
                        Text(
                          "Hourly Rate",
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.grey.shade700,
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Expanded(
                      child: Text(
                        "\$${freelancer.hourly_rate?.toStringAsFixed(2) ?? "0.00"}/hr",
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.right,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ],
            ),

            // ---------------------- PRO TAG -----------------------
            Positioned(
              top: 0,
              right: 0,
              child: isPro
                  ? Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.orange.shade50,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        children: const [
                          Icon(
                            Icons.flash_on,
                            size: 14,
                            color: Colors.deepOrange,
                          ),
                          SizedBox(width: 3),
                          Text(
                            "Pro",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: Colors.deepOrange,
                            ),
                          ),
                        ],
                      ),
                    )
                  : const SizedBox.shrink(),
            ),
          ],
        ),
      ),
    );
  }
}
