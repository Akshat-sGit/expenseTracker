import 'package:expense_tracker/config/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ionicons/ionicons.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class BalanceCard extends StatelessWidget {
  const BalanceCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 30.0),
      width: double.infinity,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 5,
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
        color: AppColors.accentColor,
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Total Balance',
            style: GoogleFonts.dmSans(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 16.0),
          const BalanceStream(),
          const SizedBox(height: 24.0),
        ],
      ),
    );
  }
}

class BalanceStream extends StatelessWidget {
  const BalanceStream({super.key});

  @override
  Widget build(BuildContext context) {
    final currentUser = FirebaseAuth.instance.currentUser;

    if (currentUser == null) {
      return const Text('No user logged in');
    }

    return StreamBuilder<DocumentSnapshot>(
      stream: FirebaseFirestore.instance
          .collection('users')
          .doc(currentUser.uid)
          .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const LinearProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(
              AppColors.accentColor,
            ),
          );
        } else if (snapshot.hasError) {
          debugPrint('Error loading balance: ${snapshot.error}');
          return const Text('Error loading balance');
        } else if (!snapshot.hasData || !snapshot.data!.exists) {
          return const Text('No data available');
        } else {
          return FutureBuilder<Map<String, dynamic>>(
            future: _calculateIncomeAndExpense(currentUser.uid),
            builder: (context, incomeExpenseSnapshot) {
              if (incomeExpenseSnapshot.connectionState ==
                  ConnectionState.waiting) {
                return const CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    AppColors.accentColor,
                  ),
                );
              } else if (incomeExpenseSnapshot.hasError) {
                debugPrint(
                    'Error calculating income and expense: ${incomeExpenseSnapshot.error}');
                return const Text('Error calculating balance');
              } else if (!incomeExpenseSnapshot.hasData) {
                return const Text('No data available');
              } else {
                final income = incomeExpenseSnapshot.data!['income'];
                final expense = incomeExpenseSnapshot.data!['expense'];
                final balance = income - expense;

                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "\u{20b9}$balance",
                      style: const TextStyle(
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 24.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        _buildIncomeExpenseItem(
                          context: context,
                          title: 'Income',
                          amount: income,
                          icon: Ionicons.arrow_down,
                          iconColor: AppColors.accentColor,
                        ),
                        const Spacer(),
                        _buildIncomeExpenseItem(
                          context: context,
                          title: 'Expenses',
                          amount: expense,
                          icon: Ionicons.arrow_up,
                          iconColor: Colors.red,
                        ),
                      ],
                    ),
                  ],
                );
              }
            },
          );
        }
      },
    );
  }

  Future<Map<String, dynamic>> _calculateIncomeAndExpense(String userId) async {
    final incomeSnapshot = await FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .collection('income')
        .get();

    final expenseSnapshot = await FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .collection('expenses')
        .get();

    double totalIncome = 0;
    double totalExpense = 0;

    for (var doc in incomeSnapshot.docs) {
      totalIncome += (doc.data()['amount'] ?? 0).toDouble();
    }

    for (var doc in expenseSnapshot.docs) {
      totalExpense += (doc.data()['amount'] ?? 0).toDouble();
    }

    return {
      'income': totalIncome,
      'expense': totalExpense,
    };
  }

  Widget _buildIncomeExpenseItem({
    required BuildContext context,
    required String title,
    required double amount,
    required IconData icon,
    required Color iconColor,
  }) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(8.0),
          decoration: const BoxDecoration(
            color: AppColors.backgroundColor,
            shape: BoxShape.circle,
          ),
          child: Icon(
            icon,
            color: iconColor,
            size: 16.0,
          ),
        ),
        const SizedBox(width: 8.0),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: GoogleFonts.dmSans(
                fontSize: 12.0,
                fontWeight: FontWeight.w400,
                color: Colors.black,
              ),
            ),
            Text(
              "\u{20b9}$amount",
              style: const TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
