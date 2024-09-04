import 'package:expense_tracker/config/app_colors.dart';
import 'package:expense_tracker/widgets/balance_card.dart';
import 'package:expense_tracker/widgets/top_row.dart';
import 'package:flutter/material.dart';

import '../widgets/transactions_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static const String id = 'Home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 16.0),
              TopRow(),
              SizedBox(height: 24.0),
              BalanceCard(),
              SizedBox(height: 24.0),
              TransactionsList(),
            ],
          ),
        ),
      ),
    );
  }
}
