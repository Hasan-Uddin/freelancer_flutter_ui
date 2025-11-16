import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:freelancer_flutter_ui/core/utils/responsive.dart';
import 'package:freelancer_flutter_ui/domain/providers/freelancer_provider.dart';
import 'package:freelancer_flutter_ui/domain/providers/popular_services_provider.dart';
import 'package:freelancer_flutter_ui/presentation/widgets/category_tile.dart';
import 'package:freelancer_flutter_ui/presentation/widgets/job_tile.dart';
import 'package:freelancer_flutter_ui/presentation/widgets/freelancer_tile.dart';
import 'package:freelancer_flutter_ui/presentation/widgets/promo_banner.dart';
import 'package:provider/provider.dart';
import '../../core/constants.dart';
import '../widgets/popular_service_tile.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  final _searchController = TextEditingController();
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<PopularServiceProvider>().fetchPopularServices();
      context.read<FreelancerProvider>().fetchFreelancers();
    });
  }

  @override
  Widget build(BuildContext context) {
    final popularServiceProvider = context.watch<PopularServiceProvider>();
    final freelancerProfileProvider = context.watch<FreelancerProvider>();

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // welcome
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        Consts.appGreeting,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      const Text(
                        "Leslie Alexander", // API user name
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF1C2431),
                        ),
                      ),
                    ],
                  ),
                  CircleAvatar(
                    backgroundImage: const AssetImage(
                      'assets/images/avatar.png',
                    ),
                    radius: 25,
                  ),
                ],
              ),
            ),

            // Search field
            Padding(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  hoverColor: Colors.white,
                  hintText: 'Search here',
                  prefixIcon: const Icon(Icons.search),
                  suffixIcon: Container(
                    margin: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: Color(0xFFF2F4F5),
                      borderRadius: BorderRadius.circular(7),
                    ),
                    padding: const EdgeInsets.all(9),
                    child: SvgPicture.asset(
                      'assets/icons/filter.svg',
                      width: 25,
                      height: 25,
                      colorFilter: ColorFilter.mode(
                        Color(0xFF1C2431),
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(Consts.cardRadius),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
            ),
            // scroll
            Expanded(
              child: ListView(
                padding: EdgeInsets.symmetric(horizontal: 10),
                children: [
                  // Popular categories
                  Text(
                    'Popular Categories',
                    style: TextStyle(
                      fontSize: Responsive.scaleWidth(context, 20),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 12),
                  LayoutBuilder(
                    builder: (context, constraints) {
                      return SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: const [
                            CategoryTile(
                              label: 'Digital Marketing',
                              iconPath: 'assets/icons/marketing.svg',
                            ),
                            CategoryTile(
                              label: 'Graphics Design',
                              iconPath: "assets/icons/g_design.svg",
                            ),
                            CategoryTile(
                              label: 'Website Development',
                              iconPath: "assets/icons/branding.svg",
                            ),
                            CategoryTile(
                              label: 'Branding Design',
                              iconPath: "assets/icons/development.svg",
                            ),
                          ],
                        ),
                      );
                    },
                  ),

                  const SizedBox(height: 16),

                  // Promo banner
                  const PromoBanner(),

                  const SizedBox(height: 16),

                  // Popular Services title
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        'Popular Services',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        'Explore all',
                        style: TextStyle(color: Consts.black, fontSize: 16),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),

                  SizedBox(
                    height: 372,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: popularServiceProvider.servicesData.length,
                      separatorBuilder: (_, __) => const SizedBox(width: 12),
                      itemBuilder: (context, index) {
                        return PopularServicesTile(
                          services: popularServiceProvider.servicesData[index],
                        );
                      },
                    ),
                  ),

                  // Recent Jobs header and list (compact)
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        'Recent Job Posted',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        'Explore all',
                        style: TextStyle(color: Consts.black, fontSize: 16),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),

                  JobTile(
                    postedAgo: "1 week ago",
                    title:
                        "Logo Design for Business Loan Brokerage fora agency",
                    level: "MidLevel",
                    jobType: "Fixed",
                    isSponsored: true,
                    price: 126,
                    avatarUrl: "assets/images/avatar.png",
                    isSaved: false,
                    onSaveTap: () {},
                  ),

                  JobTile(
                    postedAgo: "1 week ago",
                    title:
                        "Logo Design for Business Loan Brokerage fora agency",
                    level: "MidLevel",
                    jobType: "Fixed",
                    isSponsored: true,
                    price: 126,
                    avatarUrl: "assets/images/avatar.png",
                    isSaved: false,
                    onSaveTap: () {},
                  ),
                  JobTile(
                    postedAgo: "1 week ago",
                    title:
                        "Logo Design for Business Loan Brokerage fora agency",
                    level: "MidLevel",
                    jobType: "Fixed",
                    isSponsored: true,
                    price: 126,
                    avatarUrl: "assets/images/avatar.png",
                    isSaved: false,
                    onSaveTap: () {},
                  ),

                  // load more
                  SizedBox(height: 8),
                  TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                      minimumSize: Size(double.infinity, 52),
                      padding: EdgeInsets.symmetric(vertical: 19),
                      backgroundColor: Colors.white,
                      textStyle: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      overlayColor: Colors.grey[100],
                    ),
                    child: Text(
                      'Load More',
                      style: TextStyle(
                        fontSize: 16,
                        color: Consts.black,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),

                  const SizedBox(height: 16),

                  // Top rated Freelancers
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        'Top Rated Freelancers',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        'Explore all',
                        style: TextStyle(color: Consts.black, fontSize: 16),
                      ),
                    ],
                  ),

                  const SizedBox(height: 12),
                  SizedBox(
                    height: 217,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: freelancerProfileProvider.freelancers.length,
                      separatorBuilder: (_, __) => const SizedBox(width: 12),
                      itemBuilder: (context, index) {
                        return FreelancersTile(
                          isPro: true,
                          freelancer:
                              freelancerProfileProvider.freelancers[index],
                        );
                      },
                    ),
                  ),

                  const SizedBox(height: 14),
                ],
              ),
            ),
          ],
        ),
      ),

      // Bottom navigation
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (i) => setState(() => _currentIndex = i),
        type: BottomNavigationBarType.fixed,
        items: [
          navItem("assets/icons/nav_home.svg", "Home", context),
          navItem("assets/icons/nav_inbox.svg", "Inbox", context),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          navItem("assets/icons/nav_more.svg", "More", context),
          BottomNavigationBarItem(
            icon: logicalProfileIcon(),
            label: 'Profile',
            activeIcon: logicalProfileIcon(active: true),
          ),
        ],
      ),
    );
  }

  Stack logicalProfileIcon({bool active = false}) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        SvgPicture.asset(
          "assets/icons/nav_person.svg",

          colorFilter: (active)
              ? ColorFilter.mode(
                  Theme.of(context).colorScheme.primary,
                  BlendMode.srcIn,
                )
              : null,
        ),
        if (true) // logical profile notification
          Positioned(
            top: -4,
            right: -4,
            child: Container(
              width: 6,
              height: 6,
              decoration: const BoxDecoration(
                color: Colors.redAccent,
                shape: BoxShape.circle,
              ),
            ),
          ),
      ],
    );
  }

  BottomNavigationBarItem navItem(
    String svgPath,
    String label,
    BuildContext context,
  ) => BottomNavigationBarItem(
    icon: SvgPicture.asset(svgPath),
    label: label,

    activeIcon: SvgPicture.asset(
      svgPath,
      colorFilter: ColorFilter.mode(
        Theme.of(context).colorScheme.primary,
        BlendMode.srcIn,
      ),
    ),
  );
}
