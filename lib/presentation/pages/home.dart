import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:proyecto4_bola8/presentation/pages/consulta.dart';
import 'package:proyecto4_bola8/utils/colors.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
        body: SafeArea(
      left: true,
      right: true,
      bottom: true,
      top: true,
      child: Container(
        height: screenHeight,
        width: screenWidth,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
            image: const DecorationImage(
                image: AssetImage(
                  'assets/Rectangle 5.png',
                ),
                fit: BoxFit.fitHeight,
                alignment: Alignment.topLeft)),
        child: Stack(
          alignment: AlignmentDirectional.topStart,
          fit: StackFit.loose,
          children: [
            Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
              const Padding(padding: EdgeInsets.only(top: 150)),
              Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Preguntame...',
                    style: GoogleFonts.jua(
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                        fontSize: 35),
                  )),
              const Padding(padding: EdgeInsets.only(top: 30)),
              Align(
                  alignment: Alignment.center,
                  child: Image.asset(
                    'assets/Bola8 with background.png',
                    width: 200,
                    height: 200,
                  )),
              const Padding(padding: EdgeInsets.only(top: 30)),
              Align(
                  alignment: Alignment.center,
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        isHovered = true;
                      });
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (BuildContext context) =>
                              ConsultaPage(completed: false)));
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colores.greenblue,
                    ),
                    child: Text(
                      'START',
                      style: GoogleFonts.jua(
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w400,
                          color: isHovered ? Colores.grey : Colors.white,
                          fontSize: isHovered ? 30 : 20),
                    ),
                  )),
            ]),
            Positioned(
              bottom: 100,
              right: 30,
              child: Row(
                children: [
                  Text(
                    'by JoelMdo',
                    style: GoogleFonts.jua(
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                        fontSize: 15),
                  ),
                  const Padding(padding: EdgeInsets.only(left: 5)),
                  Image.asset(
                    'assets/J code 1.png',
                  )
                ],
              ),
            )
          ],
        ),
      ),
    ));
  }
}
