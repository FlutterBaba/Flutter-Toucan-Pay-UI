import 'package:flutter/material.dart';
import 'package:flutter_toucanpay_ui/utils.dart/utils.dart';
import 'package:line_icons/line_icons.dart';

class ManagePage extends StatefulWidget {
  const ManagePage({Key? key}) : super(key: key);

  @override
  _ManagePageState createState() => _ManagePageState();
}

class _ManagePageState extends State<ManagePage>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(vsync: this, length: 2);
  }

  @override
  void dispose() {
    tabController.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primaryBlack,
        onPressed: () {},
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.3,
              child: Stack(
                children: [
                  Positioned.fill(
                    bottom: 0,
                    top: -260.0,
                    right: -1100.0 + (MediaQuery.of(context).size.width),
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.3,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.primaryBlack,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 25.0,
                    left: 20.0,
                    child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        LineIcons.arrowLeft,
                        color: AppColors.primaryBlack,
                        size: 35.0,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 25.0,
                    right: 20.0,
                    child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        LineIcons.edit,
                        color: Colors.white70,
                        size: 35.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 40.0,
              left: 20.0,
              bottom: 0.0,
              child: Container(
                padding: EdgeInsets.only(left: 15.0, top: 50.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Texts.headerTextManage,
                    SizedBox(
                      height: 10.0,
                    ),
                    TabBar(
                      controller: tabController,
                      indicatorColor: Colors.transparent,
                      labelColor: AppColors.secondaryColor,
                      unselectedLabelColor: AppColors.primaryBlack,
                      isScrollable: true,
                      labelPadding: const EdgeInsets.only(right: 25.0),
                      tabs: [
                        Tab(child: TabText.tabText1),
                        Tab(child: TabText.tabText2)
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 20.0, bottom: 100.0),
                      child: Column(
                        children: [
                          ExchangeRate(
                            amount: "620.8",
                            context: context,
                            currencyName: "Brithsh Pounds",
                            currencyCode: "BGP",
                            color: Color(0xffff7b2b),
                          ),
                          SizedBox(
                            height: 30.0,
                          ),
                          ExchangeRate(
                            amount: "0.90",
                            context: context,
                            currencyName: "US Dollors",
                            currencyCode: "USD",
                            color: Color(0xff62bcc4),
                          ),
                          SizedBox(
                            height: 30.0,
                          ),
                          ExchangeRate(
                            amount: "190.0",
                            context: context,
                            currencyName: "Euro",
                            currencyCode: "EUR",
                            color: Color(0xff6967b8),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ExchangeRate extends StatelessWidget {
  final Color color;
  final String currencyName;
  final String currencyCode;
  final String amount;
  final BuildContext context;
  const ExchangeRate({
    Key? key,
    required this.color,
    required this.currencyName,
    required this.currencyCode,
    required this.amount,
    required this.context,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.1 + 10,
      width: MediaQuery.of(context).size.width - 60.0,
      decoration: BoxDecoration(
        color: color.withAlpha(220),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Stack(
        children: [
          Positioned(
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10.0),
                bottomLeft: Radius.circular(10.0),
                bottomRight: Radius.elliptical(90.0, 110.0),
              ),
              child: Container(
                width: MediaQuery.of(context).size.width / 2 - 20,
                decoration: BoxDecoration(color: color),
              ),
            ),
          ),
          Positioned(
            top: 20.0,
            left: 20.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  currencyName,
                  style: TextStyle(
                    fontFamily: Fonts.primaryFont,
                    color: Colors.white.withOpacity(0.8),
                    fontWeight: FontWeight.bold,
                    fontSize: 24.0,
                  ),
                ),
                Text(
                  currencyCode,
                  style: TextStyle(
                    fontFamily: Fonts.primaryFont,
                    color: Colors.white.withOpacity(0.8),
                    fontWeight: FontWeight.bold,
                    fontSize: 19.0,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 20.0,
            right: 20.0,
            child: Text(
              amount,
              style: TextStyle(
                fontFamily: Fonts.primaryFont,
                color: Colors.white.withOpacity(0.8),
                fontWeight: FontWeight.bold,
                fontSize: 24.0,
              ),
            ),
          )
        ],
      ),
    );
  }
}
