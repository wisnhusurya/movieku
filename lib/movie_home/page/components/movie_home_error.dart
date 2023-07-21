import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class MovieHomeError extends StatelessWidget {
  const MovieHomeError({super.key, required this.onTap, required this.message});

  final VoidCallback onTap;
  final String message;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Center(
        child: Text(
          message,
          style: GoogleFonts.poppins(),
        ),
      ),
    );
  }
}
