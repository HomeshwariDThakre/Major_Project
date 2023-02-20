import 'package:bhoomi_seva/model/tipsmodel.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TipsCard extends StatefulWidget {
  final TipsModel info;
  const TipsCard({super.key, required this.info});

  @override
  State<TipsCard> createState() => _TipsCardState();
}

class _TipsCardState extends State<TipsCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Colors.green,
        ),
        child: ExpansionTile(
          title: Text(
            widget.info.head.toString(),
            style: GoogleFonts.poppins(
              fontSize: 20.0,
              //fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          children: <Widget>[
            ListTile(
              title: Text(
                widget.info.body.toString(),
                style: GoogleFonts.poppins(color: Colors.black54),
              ),
            )
          ],
        ),
      ),
    );
  }
}
