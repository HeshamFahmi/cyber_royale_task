// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:visibility_detector/visibility_detector.dart';

import 'package:cyber_royale_task/utils%20/appColors.dart';

import 'widgets/bubblesWidgets.dart';
import 'widgets/firstScreenHeader.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  List<IconData> paymentsType = [
    FontAwesomeIcons.wallet,
    FontAwesomeIcons.paypal,
    FontAwesomeIcons.moneyBill,
    FontAwesomeIcons.bitcoin
  ];
  List<Color> boxesColors = [
    AppColors.whiteBoxColor.withOpacity(0.25),
    AppColors.secondBubbleColor.withOpacity(0.25),
    AppColors.greenBoxColor.withOpacity(0.25),
    AppColors.yellowBoxColor.withOpacity(0.25)
  ];
  List<String> paymentsTitle = ["CASH MONEY", "PayPal", "BANK", "BITCOIN"];
  List<String> currencies = [
    "USD DOLLAR",
    "AED Emirati Dirham",
    "USD DOLLAR",
    "AED Emirati Dirham"
  ];
  List<String> transactionsType = ["deposit", "withdraw"];
  int current = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(gradient: AppColors.backGroundGradient),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            const BubbleBackgroundStackWidget(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 60.h,
                ),
                FirstScreenHeader(
                  paymentsType: paymentsType,
                  current: current,
                ),
                SizedBox(
                  height: 25.h,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 50),
                  child: SizedBox(
                    height: 166,
                    child: ListView.builder(
                        itemCount: paymentsType.length,
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        padding: EdgeInsets.zero,
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (context, index) {
                          return VisibilityDetector(
                            key: Key(index.toString()),
                            onVisibilityChanged: (VisibilityInfo info) {
                              if (info.visibleFraction == 1) {
                                setState(() {
                                  current = index;
                                  // print(current);
                                });
                              }
                            },
                            child: PaymentTypeWidget(
                                boxesColors: boxesColors[index],
                                paymentsTitle: paymentsTitle[index],
                                currencies: currencies[index],
                                paymentsType: paymentsType[index]),
                          );
                        }),
                  ),
                ),
                SizedBox(
                  height: 25.h,
                ),
                const AddUploadMoneyWidget(),
                SizedBox(
                  height: 20.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      FontAwesomeIcons.handPointLeft,
                      color: AppColors.whiteBoxColor,
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    Text(
                      "YOU CAN SWIPE\nBETWEEN YOUR CARDS",
                      style: TextStyle(
                          fontSize: 12.sp, color: AppColors.whiteBoxColor),
                    )
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
                Expanded(
                    child: Stack(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 25.w),
                      margin: EdgeInsets.only(top: 30.h),
                      width: double.infinity,
                      decoration: const BoxDecoration(
                          color: AppColors.whiteBoxColor,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(25),
                              topRight: Radius.circular(25))),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 30.h,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Today",
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 15.sp),
                                ),
                                const Icon(
                                  FontAwesomeIcons.calendarDays,
                                  color: Colors.grey,
                                )
                              ],
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                            ListView.builder(
                                shrinkWrap: true,
                                physics: const BouncingScrollPhysics(),
                                itemCount: 2,
                                padding: EdgeInsets.zero,
                                itemBuilder: (context, index) {
                                  return MainTransactionWidget(
                                      transactionType: transactionsType[index]);
                                }),
                            SizedBox(
                              height: 20.h,
                            ),
                            Text(
                              "Friday, June 1, 2023",
                              style: TextStyle(
                                  color: Colors.grey, fontSize: 15.sp),
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                            ListView.builder(
                                shrinkWrap: true,
                                physics: const BouncingScrollPhysics(),
                                itemCount: 2,
                                padding: EdgeInsets.zero,
                                itemBuilder: (context, index) {
                                  return MainTransactionWidget(
                                      transactionType: transactionsType[index]);
                                }),
                            SizedBox(
                              height: 20.h,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                        // top: -40,
                        left: 168,
                        child: Container(
                          width: 90,
                          height: 90,
                          padding: const EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50.0),
                              color: AppColors.mainColor),
                          child: Container(
                            width: 70,
                            height: 70,
                            //margin: const EdgeInsets.only(right: 32.0),
                            decoration: BoxDecoration(
                              color: AppColors.whiteBoxColor,
                              borderRadius: BorderRadius.circular(50.0),
                            ),
                            alignment: Alignment.center,
                            child: Icon(
                              paymentsType[current],
                              color: Colors.black,
                              size: 45,
                            ),
                          ),
                        ))
                  ],
                ))
              ],
            )
          ],
        )
            .animate()
            .slide(duration: 600.ms)
            .scale(delay: 600.ms, duration: 500.ms)
            .shimmer(delay: 800.ms, duration: 900.ms),
      ),
    );
  }
}

class MainTransactionWidget extends StatelessWidget {
  final String transactionType;
  const MainTransactionWidget({
    Key? key,
    required this.transactionType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  width: 44,
                  height: 44,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: const Color.fromARGB(255, 197, 196, 196)),
                  child: Icon(transactionType == "withdraw"
                      ? FontAwesomeIcons.solidCircleDown
                      : FontAwesomeIcons.solidCircleUp),
                ),
                const SizedBox(
                  width: 10.0,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "UI/UX course",
                      style: TextStyle(fontSize: 15.sp),
                    ),
                    // SizedBox(
                    //   height: 5.h,
                    // ),
                    Text(
                      "payment via paypal",
                      style: TextStyle(fontSize: 10.sp, color: Colors.grey),
                    ),
                  ],
                )
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "\$250.00",
                  style: TextStyle(
                      fontSize: 13.sp,
                      color: transactionType == "withdraw"
                          ? AppColors.greenColor
                          : AppColors.redColor),
                ),
                Text(
                  "USD",
                  style: TextStyle(fontSize: 10.sp, color: Colors.grey),
                )
              ],
            )
          ],
        ),
        const Divider()
      ],
    );
  }
}

class AddUploadMoneyWidget extends StatelessWidget {
  const AddUploadMoneyWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 155,
          height: 75,
          decoration: BoxDecoration(
              color: AppColors.whiteBoxColor.withOpacity(0.25),
              borderRadius: BorderRadius.circular(15.0)),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Icon(
                  FontAwesomeIcons.download,
                  color: AppColors.whiteBoxColor,
                ),
                SizedBox(
                  height: 5.h,
                ),
                Text(
                  "Add Money",
                  style: TextStyle(
                      fontSize: 12.sp, color: AppColors.whiteBoxColor),
                )
              ],
            ),
          ),
        ),
        SizedBox(
          width: 15.w,
        ),
        Container(
          width: 155,
          height: 75,
          decoration: BoxDecoration(
              color: AppColors.whiteBoxColor.withOpacity(0.25),
              borderRadius: BorderRadius.circular(15.0)),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Icon(
                  FontAwesomeIcons.upload,
                  color: AppColors.whiteBoxColor,
                ),
                SizedBox(
                  height: 5.h,
                ),
                Text(
                  "Take Out Money",
                  style: TextStyle(
                      fontSize: 12.sp, color: AppColors.whiteBoxColor),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}

class PaymentTypeWidget extends StatelessWidget {
  const PaymentTypeWidget({
    super.key,
    required this.boxesColors,
    required this.paymentsTitle,
    required this.currencies,
    required this.paymentsType,
  });

  final Color boxesColors;
  final String paymentsTitle;
  final String currencies;
  final IconData paymentsType;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 315,
      height: 166,
      margin: const EdgeInsets.only(right: 25),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: boxesColors,
      ),
      padding: const EdgeInsets.all(10.0),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  paymentsTitle,
                  style: TextStyle(
                      fontSize: 15.sp, color: AppColors.whiteBoxColor),
                ),
                Text(
                  "870",
                  style: TextStyle(
                      fontSize: 25.sp, color: AppColors.whiteBoxColor),
                ),
                Text(
                  currencies,
                  style: TextStyle(
                      fontSize: 15.sp, color: AppColors.whiteBoxColor),
                ),
              ],
            ),
          ),
          Positioned(
            left: 259,
            top: 115,
            child: Container(
              width: 30,
              height: 30,
              margin: const EdgeInsets.only(right: 32.0),
              decoration: BoxDecoration(
                color: AppColors.whiteBoxColor,
                borderRadius: BorderRadius.circular(80.0),
              ),
              alignment: Alignment.center,
              child: Icon(
                paymentsType,
                size: 15,
              ),
            ),
          )
        ],
      ),
    );
  }
}
