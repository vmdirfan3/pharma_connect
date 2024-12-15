import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pharma_connect/modules/home/controller/home_controller.dart';
import 'package:pharma_connect/modules/product_details/controller/product_detail_controller.dart';
import 'package:pharma_connect/utils/index.dart';
import 'package:provider/provider.dart';
import '../../../component/common_widgets.dart';
import '../../../data/model/product_model.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key, required this.data});

  final Product data;

  @override
  Widget build(BuildContext context) {
    final productDetailProvider = Provider.of<ProductDetailController>(context);
    return Scaffold(
      backgroundColor: AppColorConst.dashboardBG,
      appBar: commonAppbar(
        title: data.title ?? "",
        titleSpace: 0,
        onPressedBack: () => Navigator.pop(context),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            CarouselSlider(
              items: [data.image, data.image]
                  .map((url) => Container(
                        margin: const EdgeInsets.symmetric(horizontal: 8),
                        decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(
                                url ?? "",
                              ),
                              fit: BoxFit.fill,
                            ),
                            borderRadius: BorderRadius.circular(8)),
                      ))
                  .toList(),
              options: CarouselOptions(
                viewportFraction: 1,
                padEnds: false,
                autoPlay: false,
                enableInfiniteScroll: false,
                onPageChanged: (index, reason) {
                  productDetailProvider.updateIndex(index);
                },
              ),
            ),
            Center(
              child: DotsIndicator(
                dotsCount: 2,
                position: productDetailProvider.currentIndex.toDouble(),
                decorator: DotsDecorator(
                  activeColor: Colors.transparent,
                  color: AppColorConst.inActivePointer,
                  size: const Size.square(7.0),
                  activeSize: const Size(7.0, 7.0),
                  spacing: const EdgeInsets.all(3),
                  activeShape: RoundedRectangleBorder(
                    side: const BorderSide(width: 1, color: Color(0xFFBEBEBE)),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 18,
            ),
            Text(
              data.title ?? "",
              style: const TextStyle(
                color: Color(0xFF3B3636),
                fontSize: 14,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              children: [
                const Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: 'FREE',
                        style: TextStyle(
                          color: Color(0xFF0D0D0D),
                          fontSize: 12,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      TextSpan(
                        text: ' Sample',
                        style: TextStyle(
                          color: Color(0xFF0D0D0D),
                          fontSize: 12,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 4,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: ShapeDecoration(
                    color: const Color(0xFFCCEEF1),
                    shape: RoundedRectangleBorder(
                      side:
                          const BorderSide(width: 1, color: Color(0xFFC9E8EA)),
                      borderRadius: BorderRadius.circular(2000),
                    ),
                  ),
                  child: const Center(
                    child: Text(
                      'TRIAL',
                      style: TextStyle(
                        color: AppColorConst.darkGreen,
                        fontSize: 9,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              width: double.infinity,
              height: 28,
              decoration: const ShapeDecoration(
                color: Color(0xFFD7ECFF),
                shape: RoundedRectangleBorder(
                  side: BorderSide(width: 1, color: Color(0xFFC5E2FC)),
                ),
              ),
              child: const Center(
                child: Text(
                  'Maximum of 12 unit can be added in the cart.',
                  style: TextStyle(
                    color: Color(0xFF656B72),
                    fontSize: 10,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Container(
              padding: const EdgeInsets.all(16),
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Product Information',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    data.productInformation ?? "",
                    style: const TextStyle(
                      color: Color(0xFF595959),
                      fontSize: 10,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  if (productDetailProvider.isViewMore) ...[
                    const SizedBox(
                      height: 8,
                    ),
                    const Text(
                      'Uses:',
                      style: TextStyle(
                        color: Color(0xFF171414),
                        fontSize: 10,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      data.uses ?? "",
                      style: const TextStyle(
                        color: Color(0xFF595959),
                        fontSize: 10,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    const Text(
                      'Product Features And Specifications:',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 10,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Column(
                      children: (data.productFeatureAndSpecification ?? "")
                          .split('-') // Split on the dash
                          .where((line) =>
                              line.trim().isNotEmpty) // Remove empty lines
                          .map((line) => Padding(
                                padding: const EdgeInsets.only(bottom: 6.0),
                                // Spacing between points
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      '  - ', // Bullet character
                                      style: TextStyle(
                                        fontSize: 10,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFF595959),
                                      ),
                                    ),
                                    Expanded(
                                      child: Text(
                                        line.trim(), // Trim spaces
                                        style: const TextStyle(
                                          color: Color(0xFF595959),
                                          fontSize: 10,
                                          fontFamily: 'Roboto',
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ))
                          .toList(),
                    ),
                    const Text(
                      'Directions For Use:',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 10,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      data.directionForUse ?? "",
                      style: const TextStyle(
                        color: Color(0xFF595959),
                        fontSize: 10,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    const Text(
                      'Safety Information:',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 10,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      data.safteyInformation ?? "",
                      style: const TextStyle(
                        color: Color(0xFF595959),
                        fontSize: 10,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                  const SizedBox(
                    height: 8,
                  ),
                  GestureDetector(
                    onTap: () => productDetailProvider.isViewMore =
                        !productDetailProvider.isViewMore,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          'View ${productDetailProvider.isViewMore ? 'Less' : 'More'}',
                          style: const TextStyle(
                              color: Color(0xFF1890FF),
                              fontSize: 10,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w600,
                              decoration: TextDecoration.underline,
                              decorationColor: Color(0xFF1890FF)),
                        ),
                        const SizedBox(
                          width: 3,
                        ),
                        Transform.rotate(
                            angle:
                                productDetailProvider.isViewMore ? -1.6 : 1.6,
                            child: const Icon(
                              Icons.arrow_forward_ios,
                              size: 5,
                              color: Color(0xFF1890FF),
                            ))
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 16,
                  ),
                  const Text(
                    'Especially for you',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  const Text(
                    'List of drugs assigned to you',
                    style: TextStyle(
                      color: Color(0xFF90979C),
                      fontSize: 12,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 200,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount: Provider.of<HomeController>(context)
                          .productList
                          .length,
                      itemBuilder: (context, index) {
                        Product data = Provider.of<HomeController>(context)
                            .productList[index];
                        return productCard(context: context, data: data);
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return const SizedBox(
                          width: 17,
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Row(
        children: [
          Container(
            height: 48,
            color: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 10),
            child: Container(
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                  side: const BorderSide(width: 1, color: Color(0xFFB8B8B8)),
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
              child: Container(
                color: Colors.white,
                width: MediaQuery.of(context).size.width * 0.3,
                padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InkWell(
                        onTap: () {
                          if(productDetailProvider.cartValue>1)productDetailProvider.cartValue--;
                        }, child: const Icon(CupertinoIcons.minus,size: 12,)),
                    Text(
                      "${productDetailProvider.cartValue}",
                      style: const TextStyle(
                        color: Color(0xFF41464B),
                        fontSize: 13,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w500,
                        height: 0,
                      ),
                    ),
                    InkWell(
                        onTap: () {
                          print(int.parse(data.unit??'0')>=productDetailProvider.cartValue);
                          if(int.parse(data.unit??'0')>productDetailProvider.cartValue)productDetailProvider.cartValue++;
                        }, child: const Icon(CupertinoIcons.add,size: 12,)),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: SizedBox(
              height: 48,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: AppColorConst.darkGreen,shape: const RoundedRectangleBorder()),
                  onPressed: () {},
                  child: const Text(
                    'Place Order',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w500,
                    ),
                  )),
            ),
          )
        ],
      ),
    );
  }
}
