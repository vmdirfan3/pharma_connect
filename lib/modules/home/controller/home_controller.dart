import 'package:flutter/foundation.dart';
import 'package:pharma_connect/data/model/product_model.dart';
import 'package:pharma_connect/utils/index.dart';

class HomeController with ChangeNotifier {
  int _currentIndex = 0;

  int get currentIndex => _currentIndex;

  void updateIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }

  List<Product> productList = [
    Product(
        id: 1,
        title: 'Revital Cal 500mg Strip Of 15 Tablets',
        unit: '12',
        image: ImageConstant.prodOne,
        directionForUse: 'Use as directed on the label',
        productFeatureAndSpecification:
        '''
        - It has a portable design which makes it easy to carry anywhere at any time
        - It has a automatic shutdown function which saves power
        - It can support 2 users at a time with 120 memories each
        - It helps to measure irregular heartbeat as well
        - It comes with a large LED display
        - It has dual power modes i.e. it is chargeable with a USB power source or it can be powered with 4 AA alkaline batteries
        - It has an average value function that helps to analyse blood pressure variation
        - It has a one button easy operation''',
        productInformation:
        'Dr. Odin BPCBOA 3H Blood Pressure Machine is a fully automatic digital blood pressure monitor device that enables a high-speed and reliable measurement of systolic and diastolic blood pressure as well as the pulse through the oscillometric method.',
        uses: 'It is used for measuring the blood pressure of individuals',
        safteyInformation: '''
     - Store in a cool and dry place away from direct sunlight
     - Read the product manual carefully before use
     - Keep out of reach of children''',
        bgColor: AppColorConst.lightPinkColor,
        textBGColor: AppColorConst.pinkColor
    ),
    Product(
        id: 2,
        title: 'Recombigen Dr. ORG New 3 In 1 Vaporizer',
        unit: '12',
        image: ImageConstant.prodTwo,
        directionForUse: 'Use as directed on the label',
        productFeatureAndSpecification:
        '''- It has a portable design which makes it easy to carry anywhere at any time
          - It has a automatic shutdown function which saves power
          - It can support 2 users at a time with 120 memories each
          - It helps to measure irregular heartbeat as well
          - It comes with a large LED display
          - It has dual power modes i.e. it is chargeable with a USB power source or it can be powered with 4 AA alkaline batteries
          - It has an average value function that helps to analyse blood pressure variation
          - It has a one button easy operation''',
        productInformation:
        'Dr. Odin BPCBOA 3H Blood Pressure Machine is a fully automatic digital blood pressure monitor device that enables a high-speed and reliable measurement of systolic and diastolic blood pressure as well as the pulse through the oscillometric method.',
        uses: 'It is used for measuring the blood pressure of individuals',
        safteyInformation: '''
      - Store in a cool and dry place away from direct sunlight
      - Read the product manual carefully before use
      - Keep out of reach of children''',
        bgColor: AppColorConst.lightYellow,
        textBGColor: AppColorConst.skyYellow
    ),Product(
        id: 3,
        title: 'Dr. Morepen Blood Pressure Monitor Model Bp 14',
        unit: '12',
        image: ImageConstant.prodThree,
        directionForUse: 'Use as directed on the label',
        productFeatureAndSpecification:
        '''- It has a portable design which makes it easy to carry anywhere at any time
          - It has a automatic shutdown function which saves power
          - It can support 2 users at a time with 120 memories each
          - It helps to measure irregular heartbeat as well
          - It comes with a large LED display
          - It has dual power modes i.e. it is chargeable with a USB power source or it can be powered with 4 AA alkaline batteries
          - It has an average value function that helps to analyse blood pressure variation
          - It has a one button easy operation''',
        productInformation:
        'Dr. Odin BPCBOA 3H Blood Pressure Machine is a fully automatic digital blood pressure monitor device that enables a high-speed and reliable measurement of systolic and diastolic blood pressure as well as the pulse through the oscillometric method.',
        uses: 'It is used for measuring the blood pressure of individuals',
        safteyInformation: '''
      - Store in a cool and dry place away from direct sunlight
      - Read the product manual carefully before use
      - Keep out of reach of children''',
        bgColor: AppColorConst.lightBlue,
        textBGColor: AppColorConst.skyBlue
    ),Product(
        id: 4,
        title: 'Accue Check Blood test Strip',
        unit: '12',
        image: ImageConstant.prodFour,
        directionForUse: 'Use as directed on the label',
        productFeatureAndSpecification:
        '''- It has a portable design which makes it easy to carry anywhere at any time
          - It has a automatic shutdown function which saves power
          - It can support 2 users at a time with 120 memories each
          - It helps to measure irregular heartbeat as well
          - It comes with a large LED display
          - It has dual power modes i.e. it is chargeable with a USB power source or it can be powered with 4 AA alkaline batteries
          - It has an average value function that helps to analyse blood pressure variation
          - It has a one button easy operation''',
        productInformation:
        'Dr. Odin BPCBOA 3H Blood Pressure Machine is a fully automatic digital blood pressure monitor device that enables a high-speed and reliable measurement of systolic and diastolic blood pressure as well as the pulse through the oscillometric method.',
        uses: 'It is used for measuring the blood pressure of individuals',
        safteyInformation: '''
      - Store in a cool and dry place away from direct sunlight
      - Read the product manual carefully before use
      - Keep out of reach of children''',
        bgColor: AppColorConst.lightGreen,
        textBGColor: AppColorConst.pistaGreen
    ),
  ];
  final List<String> imageUrls = [
    'assets/images/carousel_1.png',
    'assets/images/carousel_2.png',
  ];

}
