// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../utils /appColors.dart';
import '../../../../utils /appImages.dart';

class FirstScreenHeader extends StatelessWidget {
  FirstScreenHeader({
    Key? key,
    required this.paymentsType,
    required this.current,
  }) : super(key: key);

  final List<IconData> paymentsType;
  int? current;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Balance Account",
                style: TextStyle(
                    fontSize: 30.sp,
                    color: AppColors.whiteBoxColor,
                    fontWeight: FontWeight.bold),
              ),
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                    border:
                        Border.all(color: const Color(0xff5CD7C9), width: 3),
                    borderRadius: BorderRadius.circular(15.0)),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15.0),
                  child: Image.asset(
                    AppImages.avatarIcon,
                    fit: BoxFit.cover,
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: 10.h,
          ),
          SizedBox(
            height: 30,
            width: double.infinity,
            child: ListView.builder(
                itemCount: 5,
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  if (index <= 3) {
                    return Container(
                      width: 30,
                      height: 30,
                      margin: const EdgeInsets.only(right: 32.0),
                      decoration: BoxDecoration(
                        color: current == index
                            ? AppColors.secondBubbleColor
                            : AppColors.whiteBoxColor,
                        borderRadius: BorderRadius.circular(80.0),
                      ),
                      alignment: Alignment.center,
                      child: Icon(
                        paymentsType[index],
                        color: current == index
                            ? AppColors.whiteBoxColor
                            : Colors.black,
                        size: 15,
                      ),
                    );
                  } else {
                    return Container(
                      width: 30,
                      height: 30,
                      margin: const EdgeInsets.only(right: 32.0),
                      decoration: BoxDecoration(
                        color: AppColors.whiteBoxColor,
                        borderRadius: BorderRadius.circular(80.0),
                      ),
                      alignment: Alignment.center,
                    );
                  }
                }),
          )
        ],
      ),
    );
  }
}
