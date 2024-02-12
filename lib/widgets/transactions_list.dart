import 'package:expense_tracker/config/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ionicons/ionicons.dart';

class TransactionsList extends StatelessWidget {
  const TransactionsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Transactions',
              style: GoogleFonts.dmSans(
                fontSize: 18.0,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
            TextButton(
              onPressed: () {},
              child: Text(
                'View all',
                style: GoogleFonts.dmSans(
                  fontSize: 14.0,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 12.0),
        const TransactionListTile(
          title: 'Shopping',
          date: '14th Feb 2023',
          amount: '200.00',
          icon: Icon(
            Ionicons.bag,
            color: AppColors.accentColor,
            size: 24.0,
          ),
        ),
        const TransactionListTile(
          title: 'Food',
          date: '5th Feb 2023',
          amount: '200.00',
          icon: Icon(
            Ionicons.pizza,
            color: AppColors.accentColor,
            size: 24.0,
          ),
        ),
        const TransactionListTile(
          title: 'Travel',
          date: '31st Jan 2023',
          amount: '200.00',
          icon: Icon(
            Ionicons.airplane,
            color: AppColors.accentColor,
            size: 24.0,
          ),
        ),
      ],
    );
  }
}

class TransactionListTile extends StatelessWidget {
  const TransactionListTile({
    super.key,
    required this.title,
    required this.date,
    required this.amount,
    required this.icon,
  });

  final String title;
  final String date;
  final String amount;
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
      margin: const EdgeInsets.only(bottom: 16.0),
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.tertiaryColor,
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(8.0),
            decoration: const BoxDecoration(
              color: AppColors.primaryColor,
              shape: BoxShape.circle,
            ),
            child: icon,
          ),
          const SizedBox(width: 16.0),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(),
              Text(
                title,
                style: GoogleFonts.dmSans(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 4.0),
              Text(
                date,
                style: GoogleFonts.dmSans(
                  fontSize: 14.0,
                  fontWeight: FontWeight.w400,
                  color: Colors.white70,
                ),
              ),
            ],
          ),
          const Spacer(),
          Text(
            '- \$ $amount',
            style: GoogleFonts.dmSans(
              fontSize: 16.0,
              fontWeight: FontWeight.w600,
              color: Colors.red,
            ),
          ),
        ],
      ),
    );
  }
}
