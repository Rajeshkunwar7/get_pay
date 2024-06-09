import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_pay/component/colors.dart';
import 'package:get_pay/widgets/button.dart';
import 'package:get_pay/widgets/large_btn.dart';

class PaymentPage extends StatelessWidget {
  const PaymentPage({super.key});

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        height: h,
        width: w,
        padding: const EdgeInsets.only(top: 80, right: 20, left: 20),
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage("images/paymentbackground.png"),
          ),
        ),
        child: Column(
          children: [
            Container(
              width: double.maxFinite,
              height: h * 0.12,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fitWidth,
                  image: AssetImage("images/success.png"),
                ),
              ),
            ),
            const Text(
              "Success !",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: AppColor.mainColor,
              ),
            ),
            Text(
              "Payment is completed for 2 bills",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: AppColor.idColor,
              ),
            ),
            Container(
              height: 155,
              width: 320,
              margin: EdgeInsets.only(top: 24, bottom: h * 0.07),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  width: 2,
                  color: Colors.grey.withOpacity(0.5),
                ),
              ),
              child: ListView.separated(
                itemCount: 3,
                padding: const EdgeInsets.only(bottom: 4),
                separatorBuilder: (BuildContext context, _) {
                  return const Padding(
                    padding: EdgeInsets.only(top: 4),
                    child: Divider(color: Colors.grey, thickness: 3),
                  );
                },
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 50,
                            height: 50,
                            margin: const EdgeInsets.only(
                                top: 12, left: 14, right: 12),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              color: Colors.green,
                            ),
                            child: const Icon(
                              Icons.done,
                              size: 30,
                              color: Colors.white,
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Ken Power",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: AppColor.mainColor,
                                ),
                              ),
                              Text(
                                "Ken Power",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: AppColor.idColor,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(width: 20),
                          const Padding(
                            padding: EdgeInsets.only(top: 20),
                            child: Text(
                              "\$123.00",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                color: AppColor.mainColor,
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  );
                },
              ),
            ),
            Text(
              "Total Amount",
              style: TextStyle(
                fontSize: 20,
                color: AppColor.idColor,
              ),
            ),
            const Text(
              "\$2460.00",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w600,
                color: AppColor.mainColor,
              ),
            ),
            SizedBox(height: h * 0.13),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppBtn(icon: Icons.share_sharp, onTap: () {}, txt: "share"),
                SizedBox(width: w * 0.2),
                AppBtn(icon: Icons.print_outlined, onTap: () {}, txt: "print"),
              ],
            ),
            SizedBox(height: h * 0.04),
            LargeBtn(
              text: "Done",
              bgColor: Colors.white,
              txtColor: AppColor.mainColor,
              onTap: () {
                Get.back();
              },
            ),
          ],
        ),
      ),
    );
  }
}
