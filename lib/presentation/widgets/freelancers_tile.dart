import 'package:flutter/material.dart';
import 'package:freelancer_flutter_ui/core/utils/responsive.dart';

class ProfileCard extends StatelessWidget {
  final String name;
  final String profession;
  final String location;
  final double rating;
  final int reviewsCount;
  final double hourlyRate;
  final String profileImageUrl;
  final List<String> skills;
  final bool isPro;
  final bool isVerified;

  const ProfileCard({
    super.key,
    required this.name,
    required this.profession,
    required this.location,
    required this.rating,
    required this.reviewsCount,
    required this.hourlyRate,
    required this.profileImageUrl,
    required this.skills,
    required this.isPro,
    this.isVerified = true,
  });

  @override
  Widget build(BuildContext context) {
    final skillDisplay = skills.take(2).toList();
    final extraCount = skills.length - skillDisplay.length;

    return Container(
      width: Responsive.scaleWidth(context, 315),
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
        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 12),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// ---------------------- TOP ROW -----------------------
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Profile Image
                    ClipRRect(
                      borderRadius: BorderRadius.circular(40),
                      child: Image.asset(
                        profileImageUrl,
                        width: 45,
                        height: 45,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(width: 5),
                    // Name + Profession Column
                    SizedBox(
                      height: 45,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // Name + Verified
                          Row(
                            children: [
                              Text(
                                name,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(width: 5),
                              if (isVerified)
                                Icon(
                                  Icons.check_circle_sharp,
                                  color: Theme.of(context).colorScheme.primary,
                                  size: 18,
                                ),
                            ],
                          ),
                          // Use Align to position profession at the bottom
                          Align(
                            alignment: Alignment
                                .bottomLeft, // Align it to the bottom of the Column
                            child: Text(
                              profession,
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey.shade600,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),

                /// ---------------------- SKILLS -----------------------
                Row(
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

                const SizedBox(height: 16),

                /// ---------------------- REVIEW -----------------------
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                    Text(
                      "$rating ($reviewsCount reviews)",
                      style: const TextStyle(fontSize: 13),
                    ),
                  ],
                ),

                const SizedBox(height: 6),

                /// ---------------------- LOCATION -----------------------
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                    Text(
                      location,
                      style: const TextStyle(fontSize: 13),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),

                const SizedBox(height: 6),
                // rate
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                    Text(
                      "\$${hourlyRate.toStringAsFixed(2)}/hr",
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),

            // pro tag
            Positioned(
              top: 0,
              right: 0,
              child: Row(
                children: [
                  if (isPro)
                    Container(
                      margin: const EdgeInsets.only(left: 8),
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
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
