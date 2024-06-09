import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_pay/data_controller.dart';
import 'package:get_pay/pages/payment_page.dart';
import 'package:get_pay/widgets/button.dart';
import 'package:get_pay/widgets/large_btn.dart';
import 'package:get_pay/widgets/text_size.dart';

import '../component/colors.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final DataController _controller = Get.put(DataController());

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppColor.backGroundColor,
      body: SizedBox(
        height: h,
        child: Stack(
          children: [
            _headSection(),
            Obx(() {
              if (_controller.list.isNotEmpty) return listBills();
              return const SizedBox();
            }),
            _payBtn(),
            Positioned(
              left: 0,
              top: 100,
              child: Text(
                "My Bills",
                style: TextStyle(
                  fontSize: 70,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey.withOpacity(0.2),
                ),
              ),
            ),
            const Positioned(
              left: 40,
              top: 80,
              child: Text(
                "My Bills",
                style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /////////
  _headSection() {
    return SizedBox(
      height: 310,
      child: Stack(
        children: [
          _mainBackground(),
          _curvedImageContainer(),
          _buttonContainer(),
          // txtContainer(),
        ],
      ),
    );
  }

  //////////
  _mainBackground() {
    return Positioned(
      bottom: 10,
      left: 0,
      child: Container(
        height: 300,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage("images/background.png"),
          ),
        ),
      ),
    );
  }

  //////////
  _curvedImageContainer() {
    return Positioned(
      left: 0,
      right: -2,
      bottom: 10,
      child: Container(
        height: MediaQuery.of(context).size.height * 0.1,
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage("images/curve.png"),
          ),
        ),
      ),
    );
  }

  /////////
  _buttonContainer() {
    return Positioned(
      right: 52,
      bottom: 15,
      child: GestureDetector(
        onTap: () {
          showModalBottomSheet(
            isScrollControlled: true,
            barrierColor: Colors.transparent,
            backgroundColor: Colors.transparent,
            context: context,
            builder: (BuildContext context) {
              return SizedBox(
                height: MediaQuery.of(context).size.height - 240,
                child: Stack(
                  children: [
                    Positioned(
                      bottom: 0,
                      child: Container(
                        color: Colors.white.withOpacity(0.7),
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height - 300,
                      ),
                    ),
                    Positioned(
                      right: 52,
                      top: 0,
                      child: Container(
                        width: 60,
                        height: 250,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(29),
                          color: AppColor.mainColor,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            AppBtn(
                              icon: Icons.cancel,
                              iconColor: AppColor.mainColor,
                              bgColor: Colors.white,
                              onTap: () {
                                Navigator.pop(context);
                              },
                            ),
                            const AppBtn(
                              icon: Icons.add,
                              iconColor: AppColor.mainColor,
                              txtColor: Colors.white,
                              bgColor: Colors.white,
                              txt: "Add Bill",
                            ),
                            const AppBtn(
                              icon: Icons.history,
                              iconColor: AppColor.mainColor,
                              txtColor: Colors.white,
                              bgColor: Colors.white,
                              txt: "History",
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              );
            },
          );
        },
        child: Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
              image: const DecorationImage(
                image: AssetImage("images/lines.png"),
              ),
              boxShadow: [
                BoxShadow(
                    blurRadius: 15,
                    offset: const Offset(0, -1),
                    color: const Color(0xFF11324d).withOpacity(0.3)),
              ]),
        ),
      ),
    );
  }

  listBills() {
    return Positioned(
      top: 310,
      left: 0,
      right: 0,
      bottom: 0,
      child: MediaQuery.removePadding(
        removeTop: true,
        context: context,
        child: ListView.builder(
          itemCount: _controller.list.length,
          shrinkWrap: true,
          itemBuilder: (BuildContext context, int index) {
            return _listItem(index);
          },
        ),
      ),
    );
  }

  ////////////
  _listItem(int index) {
    return Container(
      height: 100,
      width: MediaQuery.of(context).size.width - 20,
      margin: const EdgeInsets.only(top: 16, right: 16),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
        boxShadow: [
          BoxShadow(
            blurRadius: 10,
            offset: Offset(1, 1),
            color: Color(0xFFd8dbe0),
          ),
        ],
      ),
      child: Container(
        margin: const EdgeInsets.only(top: 10, left: 18),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(width: 3, color: Colors.grey),
                        image: const DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage("images/brand1.png"),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          _controller.list[index]["brand"],
                          style: const TextStyle(
                            fontSize: 16,
                            color: AppColor.mainColor,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Text(
                          "ID:723283273",
                          style: TextStyle(
                            fontSize: 16,
                            color: AppColor.idColor,
                            fontWeight: FontWeight.w700,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
                SizedText(
                  text: _controller.list[index]["more"],
                  color: Colors.green,
                ),
                const SizedBox(height: 1),
              ],
            ),

            //// /// second side

            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        _controller.list[index]["status"] =
                            !_controller.list[index]["status"];
                        _controller.list.refresh();
                        print(_controller.newList.length);
                      },
                      child: Container(
                        width: 80,
                        height: 30,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: _controller.list[index]["status"]
                              ? Colors.green
                              : AppColor.selectBackground,
                        ),
                        child: Text(
                          "Select",
                          style: TextStyle(
                            fontSize: 16,
                            color: _controller.list[index]["status"]
                                ? Colors.white
                                : AppColor.selectColor,
                          ),
                        ),
                      ),
                    ),
                    const Spacer(),
                    Text(
                      "\$" + _controller.list[index]["due"],
                      style: const TextStyle(
                        fontSize: 18,
                        color: AppColor.mainColor,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    Text(
                      "Due inn 3 days",
                      style: TextStyle(
                        fontSize: 14,
                        color: AppColor.idColor,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
                Container(
                  height: 35,
                  width: 5,
                  margin: const EdgeInsets.only(left: 6),
                  decoration: BoxDecoration(
                    color: AppColor.halfOval,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(30),
                      bottomLeft: Radius.circular(30),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  ///////

  _payBtn() {
    return Positioned(
      bottom: 10,
      child: LargeBtn(
        text: 'Pay all bills',
        txtColor: Colors.white,
        onTap: () {
          Get.to(() => const PaymentPage());
        },
      ),
    );
  }

/////////
}
