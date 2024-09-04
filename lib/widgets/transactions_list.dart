// import 'package:expense_tracker/config/app_colors.dart';
import 'package:expense_tracker/widgets/expanded_tile.dart';
// import 'package:expense_tracker/widgets/transaction_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:ionicons/ionicons.dart';

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
        const ExpandedTile(), 
      ],
    );
  }
}
