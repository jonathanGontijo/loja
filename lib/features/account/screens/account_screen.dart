import 'package:flutter/material.dart';
import 'package:loja/constants/global_variables.dart';
import 'package:loja/features/account/widgets/bellow_app_bar.dart';
import 'package:loja/features/account/widgets/orders.dart';
import 'package:loja/features/account/widgets/top_buttons.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBar(
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: GlobalVariables.appBarGradient,
            ),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                alignment: Alignment.topLeft,
                child: Image.asset(
                  'assets/images/amazon_in.png',
                  width: 120,
                  height: 45,
                  color: Colors.black,
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 15),
                      child: Icon(
                        Icons.notifications_outlined,
                        color: Colors.black,
                      ),
                    ),
                    Icon(Icons.search_outlined, color: Colors.black),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      body: Column(
        children: [
          BellowAppBar(),
          SizedBox(height: 10),
          TopButtons(),
          SizedBox(height: 20),
          SizedBox(height: 10),
          Orders(),
        ],
      ),
    );
  }
}
