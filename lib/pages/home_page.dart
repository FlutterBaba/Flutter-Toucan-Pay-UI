import 'package:flutter/material.dart';
import 'package:flutter_toucanpay_ui/utils.dart/utils.dart';
import '../_routing/routes.dart' as routes;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  bottom: 30.0,
                ),
                child: ClipPath(
                  clipper: ClippingClass(),
                  child: Container(
                    height: 130.0,
                    decoration: BoxDecoration(
                      color: AppColors.primaryBlack,
                    ),
                  ),
                ),
              ),
              Positioned.fill(
                child: Align(  
                  alignment: Alignment.bottomCenter, 
                  child: Container(
                    height: 90.0,
                    width: 90.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(image: Images.man1),
                      border: Border.all(
                        color: Colors.white,
                        width: 5.0,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Container(
            padding: const EdgeInsets.only(top: 32.0),
            child: Column(
              children: [
                Texts.welcomeText,
                Padding(
                  padding: const EdgeInsets.only(
                    top: 22.0,
                    left: 42.0,
                    right: 42.0,
                  ),
                  child: Center(
                    child: Texts.welcomeText2,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.only(top: 50.0),
            child: Column(
              children: [
                Stack(
                  children: [
                    Positioned(
                      left: -25.0,
                      child: _buildImage(
                        img: Images.man2,
                        size: 50.0,
                        margin: 70.0,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _buildImage(
                            img: Images.woman1, size: 36.0, margin: 84.0),
                        _buildImage(
                            img: Images.woman2, size: 56.0, margin: 30.0),
                        _buildImage(
                            img: Images.woman3, size: 36.0, margin: 90.0),
                        _buildImage(
                            img: Images.woman4, size: 70.0, margin: 0.0),
                      ],
                    ),
                    Positioned(
                      right: -10.0,
                      child: _buildImage(
                        img: Images.woman3,
                        size: 38.0,
                        margin: 100.0,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.only(top: 50.0),
            child: Column(
              children: [
                Texts.connectNowText,
                SizedBox(
                  height: 30.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildIconCard(
                      icon: FontAwesomeIcons.facebookF,
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    _buildIconCard(icon: FontAwesomeIcons.twitter),
                    SizedBox(
                      width: 10.0,
                    ),
                    _buildIconCard(icon: FontAwesomeIcons.instagram),
                    SizedBox(
                      width: 10.0,
                    ),
                    _buildIconCard(
                      icon: FontAwesomeIcons.linkedin,
                    ),
                  ],
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 30.0),
            child: Column(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, routes.tradeViewRoute);
                  },
                  child: Texts.nextText,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Widget _buildIconCard({required IconData icon}) {
  return Container(
    height: 60.0,
    width: 60.0,
    child: Material(
      borderRadius: BorderRadius.circular(12.0),
      elevation: 34.0,
      shadowColor: Colors.white70,
      child: MaterialButton(
        onPressed: () {},
        child: Icon(
          icon,
          color: AppColors.secondaryColor,
        ),
      ),
    ),
  );
}

Widget _buildImage(
    {required AssetImage img, required double size, required double margin}) {
  return Container(
    margin: EdgeInsets.only(bottom: margin),
    height: size,
    width: size,
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      image: DecorationImage(
        image: img,
        fit: BoxFit.cover,
      ),
    ),
  );
}

class ClippingClass extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0.0, size.height - 80);
    path.quadraticBezierTo(
      size.width / 4,
      size.height,
      size.width / 2,
      size.height,
    );
    path.quadraticBezierTo(
      size.width - (size.width / 4),
      size.height,
      size.width,
      size.height - 80,
    );
    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
