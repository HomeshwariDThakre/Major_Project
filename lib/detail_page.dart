import 'package:bhoomi_seva/model/soilmodel.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart'; 
class DetailPage extends StatefulWidget {
  final SoilDataModel detail;
  const DetailPage({super.key, required this.detail});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int current = 0;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color(0xffFBEAFF),
      appBar: AppBar(
        
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          widget.detail.name.toString(),
          style: GoogleFonts.poppins(fontSize: 25.0, color: Colors.black),
        ),
        backgroundColor: Colors.green[200],
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(12.0, 2.0, 12.0, 2.0),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                CarouselSlider(
                  options: CarouselOptions(
                      // height: height * 0.40,
                      aspectRatio: 1 / 1,
                      viewportFraction: 1,
                      initialPage: 0,
                      autoPlay: true,
                      autoPlayInterval: const Duration(seconds: 12),
                      autoPlayAnimationDuration:
                          const Duration(milliseconds: 800),
                      autoPlayCurve: Curves.easeInOut,
                      enlargeCenterPage: true,
                      scrollDirection: Axis.horizontal,
                      onPageChanged: (index, reason) {
                        setState(() {
                          current = index;
                        });
                      }),
                  items: widget.detail.images!.map((i) {
                    return Padding(
                      padding: const EdgeInsets.all(10),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.network(
                          i,
                          // height: 160,
                          width: width,
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                    );
                  }).toList(),
                ),
                // SizedBox(
                //   height: 200,
                //   width: 350,
                //   child: Image.network(detail.image.toString()),
                // ),
                const SizedBox(
                  height: 15.0,
                ),
                Card(
                  elevation: 10.0,
                  color: Colors.green,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                  child: Column(
                    children: [
                      ListTile(
                        title: Text(
                          'About:',
                          style: GoogleFonts.poppins(
                            color: Colors.black,
                            fontSize: 20.0,
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 10.0),
                        child: Text(
                          widget.detail.about.toString(),
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: 15.0,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Card(
                  elevation: 10.0,
                  color: Colors.green,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                  child: Column(
                    children: [
                      ListTile(
                        title: Text(
                          'Found in:',
                          style: GoogleFonts.poppins(
                            color: Colors.black,
                            fontSize: 20.0,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 8.0),
                        child: Text(
                          widget.detail.foundIn.toString(),
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: 15.0,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Card(
                  elevation: 10.0,
                  color: Colors.green,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                  child: Column(
                    children: [
                      ListTile(
                        title: Text(
                          'Characteristics:',
                          style: GoogleFonts.poppins(
                            color: Colors.black,
                            fontSize: 20.0,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 8.0),
                        child: Text(
                          widget.detail.characteristics.toString(),
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: 15.0,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Card(
                  elevation: 10.0,
                  color: Colors.green,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                  child: Column(
                    children: [
                      ListTile(
                        title: Text(
                          'Suitable Crops:',
                          style: GoogleFonts.poppins(
                            color: Colors.black,
                            fontSize: 20.0,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 8.0),
                        child: Text(
                          widget.detail.suitableCrops.toString(),
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: 15.0,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
