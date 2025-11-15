import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:freelancer_flutter_ui/core/utils/responsive.dart';
import 'package:freelancer_flutter_ui/domain/providers/popular_services_provider.dart';
import 'package:freelancer_flutter_ui/presentation/widgets/category_tile.dart';
import 'package:freelancer_flutter_ui/presentation/widgets/job_tile.dart';
import 'package:freelancer_flutter_ui/presentation/widgets/freelancers_tile.dart';
import 'package:freelancer_flutter_ui/presentation/widgets/promo_banner.dart';
import 'package:provider/provider.dart';
import '../../core/constants.dart';
import '../../domain/providers/home_provider.dart';
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
      context.read<PopularServiceProvider>().loadPopularServices();
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<PopularServiceProvider>();

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

                  // Popular services list (horizontal)
                  // SizedBox(
                  //   height: Responsive.scaleWidth(context, 220),
                  //   child: ListView.separated(
                  //     scrollDirection: Axis.horizontal,
                  //     itemCount: services.length,
                  //     separatorBuilder: (_, _) => const SizedBox(width: 12),
                  //     itemBuilder: (ctx, i) {
                  //       return ServiceCard(service: services[i]);
                  //     },
                  //   ),
                  // ),
                  // LayoutBuilder(
                  //   builder: (context, constraints) {
                  //     return SingleChildScrollView(
                  //       scrollDirection: Axis.horizontal,
                  //       child: Row(
                  //         children: const [
                  //           PopularServicesTile(),
                  //           PopularServicesTile(),
                  //           PopularServicesTile(),
                  //           PopularServicesTile(),
                  //         ],
                  //       ),
                  //     );
                  //   },
                  // ),
                  SizedBox(
                    height: 372,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: provider.servicesData.length,
                      separatorBuilder: (_, __) => const SizedBox(width: 12),
                      itemBuilder: (context, index) {
                        return PopularServicesTile(
                          services: provider.servicesData[index],
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
                  LayoutBuilder(
                    builder: (context, constraints) {
                      return SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: const [
                            ProfileCard(
                              name: 'Esther Howard',
                              profession: 'Flutter Developer',
                              location: 'New York, USA',
                              rating: 4.5,
                              reviewsCount: 125,
                              hourlyRate: 50,
                              profileImageUrl: 'assets/images/avatar.png',
                              skills: ["Flutter", "Dart", "Firebase"],
                              isPro: true,
                            ),
                            ProfileCard(
                              name: 'Esther Howard',
                              profession: 'Flutter Developer',
                              location: 'New York, USA',
                              rating: 4.5,
                              reviewsCount: 125,
                              hourlyRate: 50,
                              profileImageUrl: 'assets/images/avatar.png',
                              skills: ["Flutter", "Dart", "Firebase"],
                              isPro: true,
                            ),
                            ProfileCard(
                              name: 'Esther Howard',
                              profession: 'Flutter Developer',
                              location: 'New York, USA',
                              rating: 4.5,
                              reviewsCount: 125,
                              hourlyRate: 50,
                              profileImageUrl: 'assets/images/avatar.png',
                              skills: ["Flutter", "Dart", "Firebase"],
                              isPro: true,
                            ),
                          ],
                        ),
                      );
                    },
                  ),

                  const SizedBox(height: 12),
                  // ListView(
                  //   children: [
                  //     JobTile(
                  //       title: 'Logo Design for Business Loan Brokerage',
                  //       timeAgo: '2 years ago',
                  //       price: 126,
                  //     ),
                  //     JobTile(
                  //       title: 'Logo Design for Business Loan Brokerage',
                  //       timeAgo: '1 week ago',
                  //       price: 126,
                  //     ),
                  //     JobTile(
                  //       title: 'Logo Design for Business Loan Brokerage',
                  //       timeAgo: '5 months ago',
                  //       price: 126,
                  //     ),
                  //     const SizedBox(height: 8),
                  //     const Text(
                  //       'Top Rated Freelancers',
                  //       style: TextStyle(fontWeight: FontWeight.w600),
                  //     ),
                  //     ...freelancers
                  //         .map((f) => FreelancerTile(freelancer: f))
                  //         .toList(),
                  //   ],
                  // ),
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
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.inbox), label: 'Inbox'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(icon: Icon(Icons.more_horiz), label: 'More'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}
