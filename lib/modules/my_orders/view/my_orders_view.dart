import 'package:flutter/material.dart';
import 'package:pharma_connect/data/model/order_list_model.dart';
import 'package:pharma_connect/modules/my_orders/controller/order_controller.dart';
import 'package:pharma_connect/utils/index.dart';
import 'package:provider/provider.dart';

class MyOrdersScreen extends StatelessWidget {
  const MyOrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final orderProvider = Provider.of<OrderController>(context);
    return Scaffold(
      backgroundColor: AppColorConst.dashboardBG,
      body: ListView.builder(
        shrinkWrap: true,
        itemCount: orderProvider.orderList.length,
        itemBuilder: (context, index) {
          MyOrderList data = orderProvider.orderList[index];
          return Container(
            decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(4)),
            margin: const EdgeInsets.symmetric(horizontal: 16,vertical: 12),
            child: Column(
              children: [
                SizedBox(height: 12,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0,),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Order: #${data.orderId}',
                        style: const TextStyle(
                          color: Color(0xFF1E1818),
                          fontSize: 11,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      InkWell(
                          onTap: () {},
                          child: const Icon(
                            Icons.arrow_forward,
                            size: 14,
                            color: Color(0xFF1890FF),
                          )),
                    ],
                  ),
                ),
                const Divider(
                  color: Color(0xFFEAEAEA),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15,horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 32,
                        height: 32,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          image: DecorationImage(
                            image: AssetImage(data.image ?? ""),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      const SizedBox(width: 5,),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(
                                    text: data.status,
                                    style: const TextStyle(
                                      color: Color(0xFF333333),
                                      fontSize: 11,
                                      fontFamily: 'Roboto',
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  TextSpan(
                                    text: ' on ${data.eta}',
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 11,
                                      fontFamily: 'Roboto',
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 3,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width: 43,
                                  height: 14,
                                  decoration: ShapeDecoration(
                                    color: Colors.white,
                                    shape: RoundedRectangleBorder(
                                      side: const BorderSide(
                                          width: 0.50, color: Color(0xFFF3F3F3)),
                                      borderRadius: BorderRadius.circular(1),
                                    ),
                                  ),
                                  child: Center(
                                    child: Text(
                                      '+${data.itemsqty} items',
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 8,
                                        fontFamily: 'Roboto',
                                        fontWeight: FontWeight.w400,
                                        height: 0,
                                      ),
                                    ),
                                  ),
                                ),
                                if(data.status =="In Transit")const Text(
                                  'Track Order',
                                  style: TextStyle(
                                    color: Color(0xFF14818A),
                                    fontSize: 11,
                                    fontFamily: 'Roboto',
                                    fontWeight: FontWeight.w500,
                                    decoration: TextDecoration.underline,
                                  ),
                                )

                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
