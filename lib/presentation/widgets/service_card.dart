import 'package:flutter/material.dart';
import 'package:freelancer_flutter_ui/core/utils/responsive.dart';
import '../../data/models/service_model.dart';
import '../../core/constants.dart';

class ServiceCard extends StatelessWidget {
  //final ServiceModel service;
  const ServiceCard({super.key});

  @override
  Widget build(BuildContext context) {
    final borderRadius = BorderRadius.circular(
      Responsive.scaleWidth(context, 20),
    );
    return Container(
      width: Responsive.scaleWidth(context, 302),
      //height: Responsive.scaleWidth(context, 346),
      margin: EdgeInsets.only(
        right: Responsive.scaleWidth(context, 10),
        top: Responsive.scaleWidth(context, 10),
        bottom: Responsive.scaleWidth(context, 10),
      ),
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // image + overlays
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(Responsive.scaleWidth(context, 12)),
                ),
                child: Image.asset(
                  "assets/images/avatar.png",
                  height: Responsive.scaleWidth(context, 172),
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
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // rating + reviews + level
                Row(
                  children: [
                    const Icon(Icons.star_border, size: 20),
                    const SizedBox(width: 6),

                    Text('4.5 (13 Reviews)', style: TextStyle(fontSize: 14)),

                    const Spacer(),

                    Row(
                      children: [
                        const SizedBox(width: 4),
                        const Text('Level ', style: TextStyle(fontSize: 14)),
                        const Text(
                          '• 2',
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
                Text(
                  "I will do, and this for you, hire me",
                  style: TextStyle(
                    color: Color(0xFF1C2431),
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
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
                    horizontal: 20,
                    vertical: 16,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(
                      0xFFF3F5F7,
                    ), // light grey like in the image
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
                        "\$126",
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
