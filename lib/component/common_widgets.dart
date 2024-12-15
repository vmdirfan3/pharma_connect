import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pharma_connect/data/model/product_model.dart';

import '../modules/product_details/view/product_detail_screen.dart';
import '../utils/index.dart';

PreferredSizeWidget commonAppbar({double? titleSpace,void Function()? onPressedBack,required String title,String? subTitle}){
  return AppBar(
    leadingWidth: 35,
    titleSpacing: titleSpace,
    leading: onPressedBack !=null?IconButton(onPressed: onPressedBack, icon: SvgPicture.asset(ImageConstant.backIcon,width: 50,)):null,
    title: Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: title,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontFamily: 'HelveticaNeue',
              fontWeight: FontWeight.w700,
            ),
          ),
          if(subTitle !=null)const TextSpan(
            text: 'Connect',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontFamily: 'HelveticaNeue',
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    ),
    flexibleSpace: Container(
      decoration: const BoxDecoration(borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(10),
        bottomRight: Radius.circular(10),
      ),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: AppColorConst.appBarGradient,
        ),
      ),
    ),
    actions: [
      Padding(
        padding: const EdgeInsets.only(right: 8.0),
        child: Stack(
          children: [
            SvgPicture.asset(
              ImageConstant.notification,
            ),
            Positioned(
              right: 7,
              top: 8,
              child: Container(
                width: 6.92,
                height: 6.92,
                decoration: const ShapeDecoration(
                  color: Color(0xFFE63051),
                  shape: OvalBorder(
                    side: BorderSide(width: 1, color: Color(0xFF62B4FF)),
                  ),
                ),
              ),),
          ],
        ),
      ),
    ],
  );
}

Widget productCard({required BuildContext context,required Product data}){
  return GestureDetector(
    onTap: () => Navigator.push(context,MaterialPageRoute(builder: (context) => ProductDetailScreen(data: data),)),
    child: SizedBox(
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
    ),
  );
}