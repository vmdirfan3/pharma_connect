import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:pharma_connect/component/common_widgets.dart';
import 'package:pharma_connect/modules/home/controller/home_controller.dart';
import 'package:provider/provider.dart';

import '../../../data/model/product_model.dart';
import '../../../utils/index.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final homeProvider = Provider.of<HomeController>(context);

    return Scaffold(
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
                items: homeProvider.imageUrls
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
                    homeProvider.updateIndex(index);
                  },
                ),
              ),
              Center(
                child: DotsIndicator(
                  dotsCount: homeProvider.imageUrls.length,
                  position: homeProvider.currentIndex.toDouble(),
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
                  ...homeProvider.productList,
                  ...homeProvider.productList
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
                    ...homeProvider.productList,
                    ...homeProvider.productList
                  ][index];
                  return productCard(context: context, data: data);
                },
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      )
    );
  }
}
