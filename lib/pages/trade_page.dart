import 'package:flutter/material.dart';
import 'package:flutter_toucanpay_ui/utils.dart/utils.dart';
import 'package:line_icons/line_icon.dart';
import 'package:line_icons/line_icons.dart';

import '../_routing/routes.dart' as routes;

class TradePage extends StatefulWidget {
  const TradePage({Key? key}) : super(key: key);

  @override
  _TradePageState createState() => _TradePageState();
}

class _TradePageState extends State<TradePage> {
  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.close,
              color: AppColors.primaryBlue,
            ),
          ),
        )
      ],
    );

    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(left: 24.0),
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Texts.headerTextTrade,
                  SizedBox(
                    height: 18.0,
                  ),
                  Texts.headerTextTrade2,
                  SizedBox(
                    height: 15.0,
                  ),
                  MondeyCards(
                    type: "GBP",
                    amount: "0.00",
                    isGrey: true,
                  ),
                  SizedBox(
                    height: 35.0,
                  ),
                  Row(
                    children: [
                      Texts.headerTextTrade3,
                      SizedBox(
                        width: 10.0,
                      ),
                      Container(
                        width: 20.0,
                        height: 20.0,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.grey.withOpacity(0.4),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            "i",
                            style: TextStyle(
                              color: AppColors.primaryBlue,
                              fontFamily: Fonts.primaryFont,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  MondeyCards(
                    type: "USD",
                    amount: "0.00",
                    isGrey: false,
                  ),
                  SizedBox(
                    height: 35.0,
                  ),
                  Texts.headerTextTrade4,
                  SizedBox(
                    height: 15.0,
                  ),
                  Container(
                    height: 140.0,
                    width: MediaQuery.of(context).size.width,
                    child: ListView(
                      physics: BouncingScrollPhysics(),
                      padding: EdgeInsets.only(bottom: 20.0, left: 12.0),
                      scrollDirection: Axis.horizontal,
                      children: [
                        UserCard(
                          isBtn: true,
                          isQR: false,
                          img: Images.man2,
                          title: "Add",
                        ),
                        UserCard(
                          isBtn: false,
                          isQR: true,
                          img: Images.man2,
                          title: "Use QR",
                        ),
                        UserCard(
                          isBtn: false,
                          isQR: false,
                          img: Images.man2,
                          title: "grefory",
                        ),
                        UserCard(
                          isBtn: false,
                          isQR: false,
                          img: Images.woman5,
                          title: "monique",
                        ),
                        UserCard(
                          isBtn: false,
                          isQR: false,
                          img: Images.man3,
                          title: "ambrose",
                        ),
                        UserCard(
                          isBtn: false,
                          isQR: false,
                          img: Images.man4,
                          title: "philip",
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 35.0,
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.only(left: 24, right: 24, top: 30.0),
              child: MaterialButton(
                onPressed: () {
                  Navigator.pushNamed(context, routes.manageViewRoute);
                },
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
                padding: EdgeInsets.all(16.0),
                color: AppColors.secondaryColor,
                child: Texts.makeOffer,
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 25),
              child: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Text(
                  "Cancel",
                  style: TextStyle(
                    fontFamily:Fonts.primaryFont,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey.withOpacity(0.8),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class UserCard extends StatelessWidget {
  final bool isQR;
  final bool isBtn;
  final String title;
  final AssetImage img;
  const UserCard({
    Key? key,
    required this.img,
    required this.isBtn,
    required this.isQR,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(right: 5.0),
      width: 100.0,
      child: Material(
        elevation: 10.0,
        borderRadius: BorderRadius.circular(12.0),
        shadowColor: Colors.white70,
        child: MaterialButton(
          onPressed: () {},
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              (isQR || isBtn)
                  ? Icon(
                      isBtn ? Icons.add_circle : LineIcons.qrcode,
                      color: isBtn ? AppColors.secondaryColor : Colors.black,
                      size: isBtn ? 32.0 : 48.0,
                    )
                  : Container(
                      height: 50.0,
                      width: 50.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(image: img),
                      ),
                    ),
              Text(
                title,
                style: TextStyle(
                  color: (isBtn || isQR)
                      ? isBtn
                          ? AppColors.secondaryColor
                          : Colors.black
                      : Colors.grey.withOpacity(0.6),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class MondeyCards extends StatefulWidget {
  final String type;
  final String amount;
  final bool isGrey;
  const MondeyCards({
    Key? key,
    required this.amount,
    required this.isGrey,
    required this.type,
  }) : super(key: key);

  @override
  _MondeyCardsState createState() => _MondeyCardsState();
}

class _MondeyCardsState extends State<MondeyCards> {
  var height = 50.0;
  var width = 180.0;
  var radius = 12.0;
  var diff = 10.0;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.white,
          )
        ],
      ),
      child: Material(
        elevation: 10.0,
        shadowColor: Colors.white,
        borderRadius: BorderRadius.circular(radius),
        child: Row(
          children: [
            Container(
              width: (width / 2) - diff,
              height: height,
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.2),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(radius),
                  bottomLeft: Radius.circular(radius),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        widget.type,
                        style: TextStyle(
                          fontSize: 18.0,
                          fontFamily: Fonts.primaryFont,
                          color: widget.isGrey
                              ? Colors.grey.withOpacity(0.6)
                              : AppColors.primaryBlue,
                        ),
                      ),
                      widget.isGrey
                          ? Container()
                          : Icon(
                              LineIcons.arrowCircleDown,
                              color: Colors.grey.withOpacity(0.6),
                            ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
