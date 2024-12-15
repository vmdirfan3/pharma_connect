import 'package:flutter/foundation.dart';
import 'package:pharma_connect/data/model/order_list_model.dart';

class OrderController with ChangeNotifier {

  List<MyOrderList> orderList = [
    MyOrderList(
        image: 'assets/images/carousel_2.png',
        itemsqty: 6,
        orderId: 12345,
        status: "Delivered",
        eta: '21 Apr,24'),
    MyOrderList(
        image: 'assets/images/carousel_2.png',
        itemsqty: 5,
        orderId: 12346,
        status: "In Transit",
        eta: '21 Apr,24'),
  ];
}
