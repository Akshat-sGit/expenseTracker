import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ExpandedTile extends StatefulWidget {
  final String title;
  final String date;
  final String amount;
  final List<Map<String, String>> items;

  const ExpandedTile({
    super.key,
    required this.title,
    required this.date,
    required this.amount,
    required this.items,
  });

  @override
  State<ExpandedTile> createState() => _ExpandedTileState();
}

class _ExpandedTileState extends State<ExpandedTile> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16.0),
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFF15181F),
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: ExpansionTile(
          onExpansionChanged: (bool expanded) {
            setState(() => _isExpanded = expanded);
          },
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
          tilePadding: const EdgeInsets.symmetric(horizontal: 16.0),
          backgroundColor: const Color(0xFF15181F),
          collapsedBackgroundColor: const Color(0xFF15181F),
          leading: const Icon(
            Icons.shopping_bag_rounded,
            color: Colors.green,
            size: 24.0,
          ),
          title: Text(
            widget.title,
            style: GoogleFonts.poppins(
              fontSize: 16.0,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
          subtitle: Text(
            widget.date,
            style: GoogleFonts.poppins(
              fontSize: 14.0,
              fontWeight: FontWeight.w400,
              color: Colors.white,
            ),
          ),
          trailing: Text(
            _isExpanded ? "" : widget.amount,
            style: GoogleFonts.dmSans(
              fontSize: 16.0,
              fontWeight: FontWeight.w600,
              color: Colors.red,
            ),
          ),
          children: [
            SizedBox(
              height: 3 * 56.0, // Height to show 3 items, each ListTile is about 56.0 in height
              child: ListView.builder(
                itemCount: widget.items.length,
                itemBuilder: (context, index) {
                  final item = widget.items[index];
                  return ListTile(
                    title: Text(item['title'] ?? 'Unknown', style: const TextStyle(color: Colors.white)),
                    trailing: Text(item['price'] ?? 'Unknown', style: const TextStyle(color: Colors.white)),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}