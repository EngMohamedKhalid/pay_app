import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pay_app/app/utils/app_colors.dart';
import 'package:pay_app/app/widgets/button_widget.dart';
import 'package:pay_app/app/widgets/text_widget.dart';

import '../../../../app/widgets/default_app_bar_widget.dart';
import '../../../../app/widgets/image_widget.dart';
import '../cubit/payment_cubit.dart';


class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  int amount = 1;
  int price = 200;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const DefaultAppBarWidget(
        title: "My Cart",
      ),
      body: ListView(
        children: [
          ImageWidget(
            imageUrl: "assets/images/splash.jpg",
            width: 300.w,
            height: 300.h,
          ),
          16.verticalSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () async {
                  setState(() {
                    amount ++;
                  });
                },
                child: Icon(
                  Icons.add,
                  size: 25.sp,
                  color: Colors.black,
                ),
              ),
              16.horizontalSpace,
              TextWidget(
                title: amount.toString(),
                titleColor: AppColors.mainColor,
                titleSize: 19.sp,

              ),
              16.horizontalSpace,
              InkWell(
                onTap: () {
                  if (amount > 1) {
                    setState(() {
                      amount --;
                    });
                  }
                },
                child: Icon(
                  Icons.remove,
                  size: 25.sp,
                  color: Colors.black,
                ),
              ),
              50.horizontalSpace,
              TextWidget(
                title: "${amount * price} EGp",
                titleColor: AppColors.mainColor,
                titleSize: 19.sp,
              ),
            ],
          ),

        ],
      ),
      bottomNavigationBar: BlocBuilder<PaymentCubit, PaymentState>(
        builder: (context, state) {
          return Container(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Expanded(
                  child: ButtonWidget(
                    loading: state is LoadingState,
                    onPressed: () {
                      PaymentCubit().createPaymentIntent(
                          amount: price,
                          currencyCode: "USD"
                      );
                    },
                    text: "Pay With Stripe",
                  ),
                ),
                8.horizontalSpace,
                Expanded(
                  child: ButtonWidget(
                    onPressed: () {

                    },
                    text: "Pay With Paypal",
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
