import 'package:flutter/material.dart';
import 'package:freelancer_flutter_ui/core/utils/responsive.dart';
import '../../core/constants.dart';

class PromoBanner extends StatelessWidget {
  const PromoBanner({super.key});

  @override
  Widget build(BuildContext context) {
    final height = Responsive.scaleWidth(context, 164);
    return Container(
      height: height,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(Consts.cardRadius),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: Responsive.scaleWidth(context, 22),
      ),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Find the Perfect Freelancer for\nAny Project',
                style: TextStyle(
                  fontSize: Responsive.scaleWidth(context, 16),
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: Responsive.scaleWidth(context, 8)),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Theme.of(context).colorScheme.primary,
                  minimumSize: Size(
                    Responsive.scaleWidth(context, 96),
                    Responsive.scaleWidth(context, 34),
                  ), // width & height
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      Responsive.scaleWidth(context, 20),
                    ),
                  ),
                  elevation: 0,
                ),
                onPressed: () {},
                child: Text(
                  'Explore Now',
                  style: TextStyle(
                    fontSize: Responsive.scaleWidth(context, 12),
                  ),
                ),
              ),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Column(
                children: [
                  Spacer(),
                  SizedBox(
                    height: Responsive.scaleWidth(context, 161),
                    child: Image.asset(
                      'assets/images/promo_person.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
