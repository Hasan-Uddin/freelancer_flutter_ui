import 'package:flutter/material.dart';
import 'package:freelancer_flutter_ui/core/utils/responsive.dart';
import 'package:freelancer_flutter_ui/data/models/service_dto.dart';
import '../../core/constants.dart';

class PopularServicesTile extends StatelessWidget {
  //final ServiceModel service;
  final PopularServices services;
  const PopularServicesTile({super.key, required this.services});

  @override
  Widget build(BuildContext context) {
    final borderRadius = BorderRadius.circular(20);

    final rating = services.statistics.averageRating ?? 0.0;
    final reviews = services.statistics.totalReviews;
    final price = services.basicPrice.regular;

    return Container(
      width: Responsive.scaleWidth(context, 346),
      margin: EdgeInsets.all(1),
      //height: Responsive.scaleWidth(context, 346),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: borderRadius,
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 0.3,
            offset: Offset(0, 1),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // image + overlays
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
                child: Image.network(
                  services.image,
                  height: 172,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              // gradient bottom fade for text readability
              Positioned.fill(
                child: ClipRRect(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(Consts.cardRadius),
                  ),
                  child: Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Colors.transparent, Colors.black26],
                      ),
                    ),
                  ),
                ),
              ),

              // Top-left tag (e.g., Plants Shop)
              Positioned(
                right: 12,
                top: 12,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 6,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Icon(Icons.favorite_border, size: 24), // love icon
                ),
              ),
              // Sponsored pill (top-right)
              if (!services.isPromoted) // no true in the api endpoint
                Positioned(
                  left: 12,
                  top: 12,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(160, 255, 255, 255),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Text(
                      'Sponsored',
                      style: TextStyle(color: Colors.black, fontSize: 13),
                    ),
                  ),
                ),
            ],
          ),

          // content
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 14),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // rating + reviews + level
                Row(
                  children: [
                    const Icon(Icons.star_border, size: 20),
                    const SizedBox(width: 6),

                    Text(
                      '${rating.toStringAsFixed(1)} ($reviews Reviews)',
                      style: TextStyle(fontSize: 14),
                    ),

                    const Spacer(),

                    Row(
                      children: [
                        const SizedBox(width: 4),
                        const Text('Level ', style: TextStyle(fontSize: 14)),
                        Text(
                          '• ${services.freelancer.freelancerLevel}',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),

                const SizedBox(height: 8),
                // Subtitle / short meta
                Container(
                  height: 55,
                  child: Text(
                    services.title ?? "this is title",
                    style: TextStyle(
                      color: Color(0xFF1C2431),
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const SizedBox(height: 8),

                Container(
                  height: 2,
                  width: double.infinity,
                  color: Colors.grey.shade300,
                ),
                const SizedBox(height: 8),

                // price
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF3F5F7),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Starting From",
                        style: TextStyle(
                          color: Colors.grey.shade700,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        "\$$price",
                        style: const TextStyle(
                          color: Color(0xFF1C2431), // dark text color
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
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
    );
  }
}
