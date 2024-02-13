import 'package:expense_tracker/config/app_colors.dart';
import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ionicons/ionicons.dart';

class TopRow extends StatelessWidget {
  const TopRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 50.0,
          height: 50.0,
          decoration: const BoxDecoration(
            color: AppColors.tertiaryColor,
            shape: BoxShape.circle,
          ),
          child: Image.asset(
            'assets/images/user.png',
            width: 40.0,
            height: 40.0,
          ),
        ),
        const SizedBox(width: 12.0),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome!',
              style: GoogleFonts.dmSans(
                fontSize: 14.0,
                fontWeight: FontWeight.w400,
                color: Colors.white,
              ),
            ),
            Text(
              'Akshat',
              style: GoogleFonts.dmSans(
                fontSize: 20.0,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
          ],
        ),
        const Spacer(),
        Container(
          padding: const EdgeInsets.all(8.0),
          decoration: const BoxDecoration(
            color: AppColors.tertiaryColor,
            shape: BoxShape.circle,
          ),
          child:const Icon(
            Ionicons.settings_outline,
            color: Colors.white,
            size: 22.0,
          ),
        ),
      ],
    );
  }
}
