import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ExpandedTile extends StatefulWidget {
  const ExpandedTile({super.key});

  @override
  State<ExpandedTile> createState() => _ExpandedTileState();
}

class _ExpandedTileState extends State<ExpandedTile> {
  
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16.0), // Rounded corners
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFF15181F), // Set background color
          borderRadius: BorderRadius.circular(16.0), // Rounded corners
        ),
        child: ExpansionTile(
          onExpansionChanged: (bool expanded) {
            setState(() => _isExpanded = expanded);
          },
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0), // Keep rounded corners
          ),
          tilePadding: const EdgeInsets.symmetric(horizontal: 16.0),
          backgroundColor: const Color(0xFF15181F), // Background color when expanded
          collapsedBackgroundColor: const Color(0xFF15181F), // Background color when collapsed
          leading: const Icon(
            Icons.shopping_bag_rounded,
            color: Colors.green,
            size: 24.0,
          ),
          title: Text(
            "Shopping",
            style: GoogleFonts.poppins(
              fontSize: 16.0,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
          subtitle: Text(
            "14th Feb 2023",
            style: GoogleFonts.poppins(
              fontSize: 14.0,
              fontWeight: FontWeight.w400,
              color: Colors.white,
            ),
          ),
          trailing: Text(
            _isExpanded ? "" : "- \u{20B9}200",
            style: GoogleFonts.dmSans(
              fontSize: 16.0,
              fontWeight: FontWeight.w600,
              color: Colors.red,
            ),
          ),
          children: const <Widget>[
            ListTile(
              title: Text("Item 1", style: TextStyle(color: Colors.white)),
              trailing: Text("\u{20B9}100", style: TextStyle(color: Colors.white)),
            ),
            ListTile(
              title: Text("Item 2", style: TextStyle(color: Colors.white)),
              trailing: Text("\u{20B9}100", style: TextStyle(color: Colors.white)),
            ),
            ListTile(
              title: Text("Item 3", style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}