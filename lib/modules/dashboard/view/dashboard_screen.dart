import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pharma_connect/modules/dashboard/controller/dashboard_provider.dart';
import 'package:provider/provider.dart';
import '../../../data/model/product_model.dart';
import '../../../utils/index.dart';

class DashboardScreen extends StatelessWidget {
  DashboardScreen({super.key});

  final List<String> imageUrls = [
    'assets/images/carousel_1.png',
    'assets/images/carousel_2.png',
  ];

  @override
  Widget build(BuildContext context) {
    final dashboardProvider = Provider.of<DashboardProvider>(context);

    return Scaffold(
      backgroundColor: AppColorConst.dashboardBG,
      appBar: AppBar(
        title: const Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: 'Pharma',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontFamily: 'HelveticaNeue',
                  fontWeight: FontWeight.w700,
                  height: 0,
                ),
              ),
              TextSpan(
                text: 'Connect',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontFamily: 'HelveticaNeue',
                  fontWeight: FontWeight.w500,
                  height: 0,
                ),
              ),
            ],
          ),
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
        ),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: AppColorConst.appBarGradient,
            ),
          ),
        ),
        actions: [
          GestureDetector(
            child: SvgPicture.asset(
              'assets/icons/notification.svg',
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              CarouselSlider(
                items: imageUrls
                    .map((url) => Container(
                          margin: const EdgeInsets.symmetric(horizontal: 8),
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(
                                  url,
                                ),
                                fit: BoxFit.fill,
                              ),
                              borderRadius: BorderRadius.circular(8)),
                        ))
                    .toList(),
                options: CarouselOptions(
                  viewportFraction: 0.8,
                  padEnds: false,
                  autoPlay: false,
                  enableInfiniteScroll: false,
                  onPageChanged: (index, reason) {
                    dashboardProvider.updateIndex(index);
                  },
                ),
              ),
              Center(
                child: DotsIndicator(
                  dotsCount: imageUrls.length,
                  position: dashboardProvider.currentIndex.toDouble(),
                  decorator: DotsDecorator(
                    activeColor: Colors.transparent,
                    color: AppColorConst.inActivePointer,
                    size: const Size.square(7.0),
                    activeSize: const Size(7.0, 7.0),
                    spacing: const EdgeInsets.all(3),
                    activeShape: RoundedRectangleBorder(
                      side:
                          const BorderSide(width: 1, color: Color(0xFFBEBEBE)),
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              const Text(
                'Sample Drugs',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w600,
                  height: 0,
                ),
              ),
              const SizedBox(
                height: 2,
              ),
              const Text(
                'List of drugs assigned to you',
                style: TextStyle(
                  color: Color(0xFF90979C),
                  fontSize: 12,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w400,
                  height: 0,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: [
                  ...dashboardProvider.productList,
                  ...dashboardProvider.productList
                ].length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 17,
                  mainAxisSpacing: 20,
                  childAspectRatio:
                      1.0, // Adjust the aspect ratio to control item proportions
                ),
                itemBuilder: (context, index) {
                  Product data = [
                    ...dashboardProvider.productList,
                    ...dashboardProvider.productList
                  ][index];
                  return SizedBox(
                    width: 163,
                    child: Column(
                      children: [
                        Container(
                          height: 145,
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          decoration: ShapeDecoration(
                            color: data.bgColor,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(39),
                                bottomLeft: Radius.circular(39),
                              ),
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 2, horizontal: 5),
                                decoration: ShapeDecoration(
                                  color: data.textBGColor,
                                  shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(15),
                                      bottomRight: Radius.circular(15),
                                    ),
                                  ),
                                ),
                                child: Text(
                                  'Allotted: ${data.unit} units',
                                  style: const TextStyle(
                                    color: AppColorConst.lightGrey,
                                    fontSize: 11,
                                    fontFamily: 'Roboto',
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Center(
                                child: Image.asset(
                                  data.image ?? "",
                                  height: 80,
                                  width: 100,
                                  fit: BoxFit.fill,
                                ),
                              ),
                              Transform.translate(
                                offset: const Offset(0, -10),
                                child: Align(
                                  alignment: AlignmentDirectional.bottomEnd,
                                  child: Container(
                                    height: 24,
                                    width: 24,
                                    margin: const EdgeInsets.only(right: 8),
                                    decoration: ShapeDecoration(
                                      color: AppColorConst.darkGreen,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                    ),
                                    child: const Icon(
                                      Icons.arrow_forward_ios_outlined,
                                      color: Colors.white,
                                      size: 16,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Text(
                          data.title ?? "",
                          style: const TextStyle(
                            color: AppColorConst.cardTitleColor,
                            fontSize: 12,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w500,
                            height: 0,
                          ),
                        )
                      ],
                    ),
                  );
                },
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: AppColorConst.navBarSelectedColor,
          unselectedItemColor: AppColorConst.navBarColor,
          showUnselectedLabels: true,
          selectedLabelStyle: const TextStyle(
            color: AppColorConst.navBarSelectedColor,
            fontSize: 12,
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w600,
            height: 0.14,
          ),
          unselectedLabelStyle: const TextStyle(
            color: AppColorConst.navBarColor,
            fontSize: 12,
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w400,
            height: 0.14,
          ),
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_filled),
              label: 'Home',
            ), BottomNavigationBarItem(
              icon: Icon(Icons.bookmark_add_outlined),
              label: 'My Orders',
            ), BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
              label: 'Cart',
            ), BottomNavigationBarItem(
              icon: Icon(Icons.face),
              label: 'Profile',
            ),
          ]),
    );
  }
}
