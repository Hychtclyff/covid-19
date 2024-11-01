import 'package:covid_19/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() => runApp(MainApp());

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  // const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'covid-19',
      theme: ThemeData(
          scaffoldBackgroundColor: kBackgroundColor,
          fontFamily: "Poppins",
          textTheme: TextTheme(
            bodyMedium: TextStyle(color: kBodyTextColor),
          )),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          ClipPath(
            clipper: MyClipper(),
            child: Container(
              padding: const EdgeInsets.only(left: 0, top: 50, right: 20),
              height: 350,
              width: double.infinity,
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [
                      Color(0xff3383cd),
                      Color(0xff11249f),
                    ],
                  ),
                  image: DecorationImage(
                      image: AssetImage('assets/images/virus.png'))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Align(
                    alignment: Alignment.topRight,
                    child: SvgPicture.asset("assets/icons/menu.svg"),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Expanded(
                    child: Stack(
                      children: <Widget>[
                        Positioned(
                          left: 0, // Menggeser gambar ke kiri sebesar 10 pixel
                          child: Image.asset(
                            "assets/images/dokter1.jpg",
                            width: 230,
                            fit: BoxFit.fitWidth,
                            alignment: Alignment.center,
                          ),
                        ),
                        Positioned(
                          top: 20,
                          left: 150,
                          child: Text(
                            'All You Need \nis stay at Home!',
                            style: kHeadingTextStyle.copyWith(
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Container(),
                      ],
                    ),
                  ),
                  // Ekspand
                ],
              ),
            ),
          ),
          Container(
            height: 60,
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            width: double.infinity,
            margin: EdgeInsetsDirectional.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(25),
              border: Border.all(
                color: Color(0xffe5e5e5),
              ),
            ),
            child: Row(
              children: <Widget>[
                SvgPicture.asset('assets/icons/maps-and-flags.svg'),
                SizedBox(width: 20),
                Expanded(
                  child: DropdownButton<String>(
                    isExpanded: true,
                    underline: SizedBox(),
                    icon: SvgPicture.asset('assets/icons/dropdown.svg'),
                    value: "Indonesia",
                    items: ["Indonesia", "Bangladesh", "United States", "Japan"]
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (value) {},
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              children: [
                Row(
                  children: <Widget>[
                    RichText(
                      text: TextSpan(
                        children: const [
                          TextSpan(
                            text: "Case Update! \n",
                            style: kTitleTextstyle,
                          ),
                          TextSpan(
                            text: "Newst Update March 28",
                            style: TextStyle(color: kTextLightColor),
                          ),
                        ],
                      ),
                    ),
                    Spacer(),
                    Text(
                      "See details",
                      style: TextStyle(
                        color: kPrimaryColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(0, 4),
                        blurRadius: 30,
                        color: kShadowColor,
                      ),
                    ],
                  ),
                  child: Row(
                    children: <Widget>[
                      Column(
                        children: [
                          Container(
                            padding: EdgeInsets.all(6),
                            height: 25,
                            width: 25,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: kInfectedColor.withOpacity(.26),
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.transparent,
                                border: Border.all(
                                  color: kInfectedColor,
                                  width: 2,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 80);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height - 80);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
