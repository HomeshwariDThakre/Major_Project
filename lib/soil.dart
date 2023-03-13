import 'package:bhoomi_seva/model/soilmodel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'soil_card.dart';

class SoilList extends StatefulWidget {
  const SoilList({Key? key}) : super(key: key);

  @override
  State<SoilList> createState() => _SoilListState();
}

class _SoilListState extends State<SoilList> {

  bool loader = true;
  
   List soilData = [];

  List<Soil> soils = [
    Soil(
        title: 'Alluvial Soil',
        image: Image.asset(
          'assets/soil/alluvial.jpeg',
          fit: BoxFit.fill,
        ),
        index: 0),
    Soil(
        title: 'Black Soil',
        image: Image.asset(
          'assets/soil/black.jpg',
          fit: BoxFit.fill,
        ),
        index: 1),
    Soil(
        title: 'Red and Yellow Soil',
        image: Image.asset(
          'assets/soil/red-yellow.jpg',
          fit: BoxFit.fill,
        ),
        index: 2),
    Soil(
        title: 'Laterite Soil',
        image: Image.asset(
          'assets/soil/laterite.jpg',
          fit: BoxFit.fill,
        ),
        index: 3),
    Soil(
        title: 'Arid Soil',
        image: Image.asset(
          'assets/soil/arid.jpg',
          fit: BoxFit.fill,
        ),
        index: 4),
    Soil(
        title: 'Mountain and Forest Soil',
        image: Image.asset(
          'assets/soil/mountain.jpg',
          fit: BoxFit.fill,
        ),
        index: 5),
    Soil(
        title: 'Desert Soil',
        image: Image.asset(
          'assets/soil/desert.jpg',
          fit: BoxFit.fill,
        ),
        index: 6)
  ];

  Future callApi() async {
    setState(() {
      loader = true;
    });
    await FirebaseFirestore.instance.collection("SoilData").get().then((value) {
      for (var doc in value.docs) {
        soilData.add(doc.data());
      }
    });

    if (soilData.isNotEmpty) {
      if (mounted) {
        setState(() {
          loader = false;
        });
      }
    }
  }

  @override
  void initState() {
    callApi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold( 
      backgroundColor: Color(0xffFEF6FF),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  'Soilpedia',
                  style: GoogleFonts.poppins(
                      fontSize: 36,
                      color: Colors.black,
                      fontWeight: FontWeight.w500),
                ),
              ),
              loader
                  ? const Center(child: CircularProgressIndicator())
                  : Center(
                      child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: soilData.length,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            SoilDataModel soil =
                                SoilDataModel.from(soilData[index]);
                            return SoilCard(soil: soil);
                          }),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}

class Soil {
  String title;
  Image image;
  int index;

  Soil({required this.title, required this.image, required this.index});
}

class Detail {
  String name;
  String about;
  String found;
  String character;
  String crop;
  Image photo;

  Detail(
      {required this.name,
      required this.about,
      required this.found,
      required this.character,
      required this.crop,
      required this.photo});
}
