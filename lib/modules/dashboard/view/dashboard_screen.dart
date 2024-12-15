import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pharma_connect/component/common_widgets.dart';
import 'package:pharma_connect/modules/dashboard/controller/dashboard_controller.dart';
import 'package:provider/provider.dart';

import '../../../utils/index.dart';

class DashboardScreen extends StatelessWidget {
  DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dashboardProvider = Provider.of<DashboardProvider>(context);

    return Scaffold(
      backgroundColor: AppColorConst.dashboardBG,
      appBar: commonAppbar(title: dashboardProvider.currentIndex==0?'Pharma':dashboardProvider.currentIndex==1?"My Orders":dashboardProvider.currentIndex==2?"Cart":"Profile",onPressedBack: dashboardProvider.currentIndex!=0?() => dashboardProvider.currentIndex=0:null,subTitle: dashboardProvider.currentIndex==0?'Connect':null,titleSpace: dashboardProvider.currentIndex !=0?0:null,),
      body: dashboardProvider.screens[dashboardProvider.currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) => dashboardProvider.currentIndex = value,
        currentIndex: dashboardProvider.currentIndex,
          selectedItemColor: AppColorConst.navBarSelectedColor,
          unselectedItemColor: AppColorConst.navBarColor,
          backgroundColor: Colors.white,
          type: BottomNavigationBarType.fixed,
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
          items: [
            BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.only(bottom: 15.0),
                child: SvgPicture.asset(ImageConstant.homeIcon,colorFilter: ColorFilter.mode(dashboardProvider.currentIndex==0?AppColorConst.navBarSelectedColor:AppColorConst.navBarColor, BlendMode.srcIn),),
              ),
              label: 'Home',
            ), BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.only(bottom: 15.0),
                child: SvgPicture.asset(ImageConstant.orderIcon,colorFilter: ColorFilter.mode(dashboardProvider.currentIndex==1?AppColorConst.navBarSelectedColor:AppColorConst.navBarColor, BlendMode.srcIn),),
              ),
              label: 'My Orders',
            ), BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.only(bottom: 15.0),
                child: SvgPicture.asset(ImageConstant.cartIcon,colorFilter: ColorFilter.mode(dashboardProvider.currentIndex==2?AppColorConst.navBarSelectedColor:AppColorConst.navBarColor, BlendMode.srcIn),),
              ),
              label: 'Cart',
            ), BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.only(bottom: 15.0),
                child: SvgPicture.asset(ImageConstant.profileIcon,colorFilter: ColorFilter.mode(dashboardProvider.currentIndex==4?AppColorConst.navBarSelectedColor:AppColorConst.navBarColor, BlendMode.srcIn),),
              ),
              label: 'Profile',
            ),
          ]),
    );
  }
}
