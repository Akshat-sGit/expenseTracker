import 'package:expense_tracker/widgets/expanded_tile.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TransactionsList extends StatelessWidget {
  const TransactionsList({super.key});

  // Dummy list of transactions for demonstration
  final List<Map<String, String>> transactions = const [
    {"title": "Shopping", "date": "14th Feb 2023", "amount": "- \u{20B9}300"},
    {"title": "Groceries", "date": "12th Feb 2023", "amount": "- \u{20B9}150"},
    {"title": "Rent", "date": "10th Feb 2023", "amount": "- \u{20B9}1000"},
    {"title": "Gym", "date": "8th Feb 2023", "amount": "- \u{20B9}500"},
    {"title": "Electricity Bill", "date": "6th Feb 2023", "amount": "- \u{20B9}250"},
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
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
        ),
        const SizedBox(height: 12.0),
        Expanded(
          child: ListView.builder(
            itemCount: transactions.length, // Number of transactions
            itemBuilder: (context, index) {
              final transaction = transactions[index];
              return Column(
                children: [
                  ExpandedTile(
                    title: transaction['title']!,
                    date: transaction['date']!,
                    amount: transaction['amount']!,
                    items: const [
                      {"title": "Item 1", "amount": "\u{20B9}100"},
                      {"title": "Item 2", "amount": "\u{20B9}200"},
                      {"title": "Item 3", "amount": "\u{20B9}300"},
                    ],
                  
                  ),
                  const SizedBox(height: 12.0), // Space between tiles
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}