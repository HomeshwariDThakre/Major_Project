// import 'package:bhoomi_seva/data/userdata.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

// class ChatBotScreen extends StatefulWidget {
//   const ChatBotScreen({super.key});

//   @override
//   State<ChatBotScreen> createState() => _ChatBotScreenState();
// }

// class _ChatBotScreenState extends State<ChatBotScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           Center(
//             child: Padding(
//               padding: const EdgeInsets.all(10.0),
//               child: Text(
//                 'Weclome $userName',
//                 style: GoogleFonts.poppins(
//                     fontSize: 20,
//                     color: Colors.black,
//                     fontWeight: FontWeight.w500),
//               ),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(10.0),
//             child: Text(
//               'Chat Bot Coming soon',
//               style: GoogleFonts.poppins(
//                   fontSize: 20,
//                   color: Colors.black38,
//                   fontWeight: FontWeight.w500),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart';

import 'classes/language_constants.dart';

class Helper extends StatefulWidget {
  const Helper({super.key});

  @override
  State<StatefulWidget> createState() => HelperState();
}

class HelperState extends State<Helper> {
  int typeofcrop = 0, soiltype = 0, pesticideuse = 0, pesticidecount = 0;
  double pesticideweek = 0;
  int count = 1;
  bool isLoading = false, result = false;
  int ans = 0;
  @override
  Widget build(BuildContext context) {
    List<Widget> questions = [
      Column(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Row(
              children: [
                const SizedBox(
                  width: 5,
                ),
                const CircleAvatar(
                  radius: 20,
                  foregroundColor: Colors.black,
                  backgroundColor: Colors.black,
                  backgroundImage: AssetImage(
                    'assets/kisan_helper.jpg',
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Container(
                    width: 295,
                    height: 50,
                    decoration: const BoxDecoration(
                      color: Color(0xff00755B),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(25),
                          bottomRight: Radius.circular(25)),
                    ),
                    child: Center(
                      child: Text(
                        (translation(context).aquestion),
                        style: GoogleFonts.poppins(
                            color: Colors.white, fontSize: 15),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Container(
                height: 50,
                width: 150,
                decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(15)),
                child: Padding(
                  padding: const EdgeInsets.all(5),
                  child: DropdownButton<int>(
                      value: typeofcrop,
                      items: [
                        DropdownMenuItem(
                          value: 0,
                          child: Text(translation(context).foodcrops),
                        ),
                        DropdownMenuItem(
                          value: 1,
                          child: Text(translation(context).cashcrops),
                        ),
                      ],
                      onChanged: (int? value) {
                        setState(() {
                          typeofcrop = value!;
                        });
                      }),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(5),
            child: Align(
                alignment: Alignment.topRight,
                child: ElevatedButton(
                  onPressed: () {
                    count = 2;
                    setState(() {});
                  },
                  child: Text(translation(context).ok),
                )),
          )
        ],
      ),
      Column(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Row(
              children: [
                const SizedBox(
                  width: 5,
                ),
                const CircleAvatar(
                  radius: 20,
                  foregroundColor: Colors.black,
                  backgroundColor: Colors.black,
                  backgroundImage: AssetImage(
                    'assets/kisan_helper.jpg',
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Container(
                    width: 295,
                    height: 50,
                    decoration: const BoxDecoration(
                      color: Color(0xff00755B),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(25),
                          bottomRight: Radius.circular(25)),
                    ),
                    child: Center(
                      child: Text(
                        (translation(context).bquestion),
                        style: GoogleFonts.poppins(
                            color: Colors.white, fontSize: 15),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Container(
                height: 50,
                width: 200,
                decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(15)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: DropdownButton<int>(
                      value: soiltype,
                      items: [
                        DropdownMenuItem(
                          value: 0,
                          child: Text(translation(context).alluvial_soil),
                        ),
                        DropdownMenuItem(
                          value: 1,
                          child: Text(translation(context).others),
                        ),
                      ],
                      onChanged: (int? value) {
                        setState(() {
                          soiltype = value!;
                        });
                      }),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(5),
            child: Align(
                alignment: Alignment.topRight,
                child: ElevatedButton(
                  onPressed: () {
                    count = 3;
                    setState(() {});
                  },
                  child: Text(translation(context).ok),
                )),
          )
        ],
      ),
      Column(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Row(
              children: [
                const SizedBox(
                  width: 5,
                ),
                const CircleAvatar(
                  radius: 20,
                  foregroundColor: Colors.black,
                  backgroundColor: Colors.black,
                  backgroundImage: AssetImage(
                    'assets/kisan_helper.jpg',
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Container(
                    width: 295,
                    height: 50,
                    decoration: const BoxDecoration(
                      color: Color(0xff00755B),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(25),
                          bottomRight: Radius.circular(25)),
                    ),
                    child: Center(
                      child: Text(
                        (translation(context).cquestion),
                        style: GoogleFonts.poppins(
                            color: Colors.white, fontSize: 15),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Container(
                height: 50,
                width: 195,
                decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(15)),
                child: Padding(
                  padding: const EdgeInsets.all(5),
                  child: Container(
                    height: 50,
                    width: 150,
                    decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(15)),
                    child: DropdownButton<int>(
                        value: pesticideuse,
                        items: [
                          DropdownMenuItem(
                            value: 0,
                            child: Text(translation(context).never),
                          ),
                          DropdownMenuItem(
                            value: 1,
                            child: Text(translation(context).previously_used),
                          ),
                          DropdownMenuItem(
                            value: 2,
                            child: Text(translation(context).currently_using),
                          ),
                        ],
                        onChanged: (int? value) {
                          setState(() {
                            pesticideuse = value!;
                          });
                        }),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(5),
            child: Align(
                alignment: Alignment.topRight,
                child: ElevatedButton(
                  onPressed: () {
                    count = 4;
                    setState(() {});
                  },
                  child: Text(translation(context).ok),
                )),
          )
        ],
      ),
      Column(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Row(
              children: [
                const SizedBox(
                  width: 5,
                ),
                const CircleAvatar(
                  radius: 20,
                  foregroundColor: Colors.black,
                  backgroundColor: Colors.black,
                  backgroundImage: AssetImage(
                    'assets/kisan_helper.jpg',
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Container(
                    width: 295,
                    height: 50,
                    decoration: const BoxDecoration(
                      color: Color(0xff00755B),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(25),
                          bottomRight: Radius.circular(25)),
                    ),
                    child: Center(
                      child: Text(
                        translation(context).dquestion,
                        style: GoogleFonts.poppins(
                            color: Colors.white, fontSize: 15),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Container(
                  width: 120,
                  height: 50,
                  decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(15)),
                  padding: const EdgeInsets.all(10),
                  child: TextField(
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      setState(() {});
                      pesticidecount = int.parse(value);
                    },
                  )),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(5),
            child: Align(
                alignment: Alignment.topRight,
                child: ElevatedButton(
                  onPressed: () {
                    count = 5;
                    setState(() {});
                  },
                  child: Text(translation(context).ok),
                )),
          )
        ],
      ),
      Column(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Row(
              children: [
                const SizedBox(
                  width: 5,
                ),
                const CircleAvatar(
                  radius: 20,
                  foregroundColor: Colors.black,
                  backgroundColor: Colors.black,
                  backgroundImage: AssetImage(
                    'assets/kisan_helper.jpg',
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Container(
                    width: 295,
                    height: 50,
                    decoration: const BoxDecoration(
                      color: Color(0xff00755B),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(25),
                          bottomRight: Radius.circular(25)),
                    ),
                    child: Center(
                      child: Text(
                        translation(context).equestion,
                        style: GoogleFonts.poppins(
                            color: Colors.white, fontSize: 14),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Container(
                  width: 120,
                  height: 50,
                  decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(15)),
                  padding: const EdgeInsets.all(10),
                  child: TextField(
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      setState(() {
                        pesticideweek = double.parse(value);
                      });
                    },
                  )),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Align(
                alignment: Alignment.topCenter,
                child: GestureDetector(
                  onTap: () async {
                    // processingPopup(context: context, msg: "getting data...");
                    isLoading = true;
                    ans = await getData();
                    result = true;
                    setState(() {});
                    // Navigator.pop(context);
                  },
                  child: Container(
                    height: 40,
                    width: 350,
                    color: const Color(0xff00755B),
                    child: Center(
                      child: Text(
                        translation(context).submit,
                        style: GoogleFonts.poppins(
                            color: Colors.white, fontSize: 14),
                      ),
                    ),
                  ),
                )),
          )
        ],
      ),
    ];
    Size size = MediaQuery.of(context).size;
    var height = size.height;

    return Scaffold(
      backgroundColor: const Color(0xff00755B),
      body: (isLoading == false && result == false)
          ? Column(
              children: [
                SizedBox(
                  height: 275,
                  width: size.width,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 90, 0, 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const CircleAvatar(
                          radius: 55,
                          backgroundColor: Colors.white,
                          backgroundImage: AssetImage(
                            'assets/kisan_helper.jpg',
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          translation(context).kisanshayak,
                          style: GoogleFonts.poppins(
                              color: Colors.white, fontSize: 32),
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                      height: height - 275 - 80,
                      width: size.width,
                      decoration: const BoxDecoration(
                          color: Color(0xffFEF6FF),
                          borderRadius:
                              BorderRadius.only(topLeft: Radius.circular(40))),
                      child: ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        itemCount: count,
                        itemBuilder: (context, index) {
                          return questions[index];
                        },
                      )),
                ),
                Container(
                  color: const Color(0xffFEF6FF),
                  height: 80,
                ),
              ],
            )
          : (result == false)
              ? const CircularProgressIndicator()
              : Container(
                  height: height,
                  width: size.width,
                  color: const Color(0xffFEF6FF),
                  child: Column(
                    children: [
                      Container(
                          height: 250,
                          width: size.width,
                          color: const Color(0xff00755B),
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 60,
                              ),
                              Row(
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.all(15.0),
                                    child: CircleAvatar(
                                      radius: 50,
                                      backgroundImage:
                                          AssetImage('assets/kisan_helper.jpg'),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                      child: Text(
                                    translation(context).fquestion,
                                    style: GoogleFonts.poppins(
                                        fontSize: 14, color: Colors.white),
                                  )),
                                ],
                              ),
                              Text(
                                translation(context).results,
                                style: GoogleFonts.poppins(
                                    fontSize: 36, color: Colors.white),
                              ),
                            ],
                          )),
                      const SizedBox(
                        height: 60,
                      ),
                      SizedBox(
                          height: 300,
                          child: Image.asset(
                            getAsset(ans),
                            fit: BoxFit.fill,
                          )),
                      const SizedBox(
                        height: 15,
                      ),
                      Text(
                        getText(ans),
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                            fontSize: 26, fontWeight: FontWeight.w600),
                      ),
                    ],
                  )),
    );
  }

  Future<int> getData() async {
    Random random = Random();
    int a1, a2, a3;
    if (pesticidecount == 0) {
      a1 = 1;
      a2 = 0;
      a3 = 0;
    } else if (pesticidecount == 1) {
      a1 = 0;
      a2 = 1;
      a3 = 0;
    } else {
      a1 = 0;
      a2 = 0;
      a3 = 1;
    }
    // print(pesticideweek);
    final Uri url = Uri.parse(
        'https://plant-health.onrender.com/predict?a=1575&b=$typeofcrop&c=$soiltype&d=$pesticidecount&e=$pesticideweek&f=${random.nextInt(50)}&g=$a1&h=$a2&i=$a3&k=0&l=0&m=1');
    // print(url);
    // final Map<dynamic, dynamic> headers = {"Content-type": "application/json"};
    // final String json =
    // '{"a"=${random.nextInt(4097 - 150) + 150}&"b"=$typeofcrop&"c"=$soiltype&"d"=$pesticidecount&"e"=$pesticideweek&"f"=${random.nextInt(50)}&"g"=1&"h"=2&"i"=3&"k=1&"l"=2&"m"=3}';
    final response = await get(
      url,
    );
    if (kDebugMode) {
      print('Status code: ${response.statusCode}');
      // http: //suvoo.pythonanywhere.com/predict?a=1575&b=$typeofcrop&c=$soiltype&d=$pesticidecount&e=$pesticideweek&f=${random.nextInt(50)}&g=$a1&h=$a2&i=$a3&k=0&l=0&m=1
      print('Body: ${response.body}');
      print(int.parse(response.body[1]));
    }
    return int.parse(response.body[1]);
  }

  String getAsset(int ans) {
    if (ans == 0) {
      return "assets/plant_happy.png";
    } else {
      return "assets/plant_sad.png";
    }
  }

  String getText(int ans) {
    if (ans == 0) {
      return translation(context).ans;
    } else if (ans == 1) {
      return translation(context).answer;
    } else {
      return translation(context).answera;
    }
  }
}
