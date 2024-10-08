// ignore_for_file: use_build_context_synchronously, library_private_types_in_public_api

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AddExpense extends StatefulWidget {
  const AddExpense({super.key});

  static const String id = "AddExpense";

  @override
  _AddExpenseState createState() => _AddExpenseState();
}

class _AddExpenseState extends State<AddExpense> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _categoryController = TextEditingController();
  final TextEditingController _noteController = TextEditingController();

  DateTime _selectedDate = DateTime.now();

  @override
  void dispose() {
    _amountController.dispose();
    _categoryController.dispose();
    _noteController.dispose();
    super.dispose();
  }

  Future<void> _addExpense() async {
    if (_formKey.currentState!.validate()) {
      final currentUser = FirebaseAuth.instance.currentUser;
      final amount = int.parse(_amountController.text);
      final category = _categoryController.text;
      final note = _noteController.text;

      // Reference to Firestore collection
      final expensesCollection = FirebaseFirestore.instance
          .collection('users')
          .doc(currentUser?.uid)
          .collection('expenses');
      try {
        // Add the expense data to Firestore
        await expensesCollection.add({
          'amount': amount,
          'category': category,
          'note': note,
          'date': _selectedDate,
          'created_at': FieldValue.serverTimestamp(), 
        });

        // Show a success message
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Expense added successfully!')),
        );

        // Clear the fields
        _amountController.clear();
        _categoryController.clear();
        _noteController.clear();
        setState(() {
          _selectedDate = DateTime.now();
        });
      } catch (e) {
        // Handle errors
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to add expense: $e')),
        );
      }
    }
  }

  Future<void> _pickDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                'Add Expenses',
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 40.0, right: 40.0, bottom: 20.0),
              child: TextFormField(
                controller: _amountController,
                keyboardType: TextInputType.number,
                style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30.0)),
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  hintText: 'Amount',
                  hintStyle: TextStyle(color: Colors.white),
                  prefixIcon: Icon(
                    Icons.currency_rupee,
                    color: Colors.white,
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter an amount';
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 40.0, right: 40.0, bottom: 20.0),
              child: TextFormField(
                controller: _categoryController,
                style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30.0)),
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  hintText: 'Category',
                  hintStyle: TextStyle(color: Colors.white),
                  prefixIcon: Icon(
                    Icons.category,
                    color: Colors.white,
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a category';
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 40.0, right: 40.0, bottom: 20.0),
              child: TextFormField(
                controller: _noteController,
                style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30.0)),
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  hintText: 'Note',
                  hintStyle: TextStyle(color: Colors.white),
                  prefixIcon: Icon(
                    Icons.note,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 40.0, right: 40.0, bottom: 20.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(15.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  backgroundColor: Colors.green,
                ),
                onPressed: _pickDate,
                child: Text(
                  'Date ${_selectedDate.toLocal()}'.split(' ')[0],
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 40.0, right: 40.0, bottom: 20.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(15.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  backgroundColor: Colors.green,
                ),
                onPressed: _addExpense,
                child: Text(
                  'Add Expense',
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
