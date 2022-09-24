import 'package:flutter/material.dart';
import 'package:fluuter_ui/Utils/common/constants.dart';
import 'package:fluuter_ui/Utils/common/custom_functions.dart';
import 'package:fluuter_ui/Utils/common/widget_functions.dart';
import 'package:fluuter_ui/custom/BorderBox.dart';
import 'package:fluuter_ui/data.dart';

import '../Utils/common/OptionButton.dart';

class LandingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final ThemeData themeData = Theme.of(context);
    const double padding = 25;
    const sidePadding = EdgeInsets.symmetric(horizontal: padding);
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: size.width,
          height: size.height,
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  addVerticalSpace(padding),
                  Padding(
                      padding: sidePadding,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          BorderBox(
                            width: 50,
                            height: 50,
                            padding: EdgeInsets.all(8.0),
                            child: Icon(
                              Icons.menu,
                              color: COLOR_BLACK,
                            ),
                          ),
                          BorderBox(
                            width: 50,
                            height: 50,
                            padding: EdgeInsets.all(8.0),
                            child: Icon(
                              Icons.settings,
                              color: COLOR_BLACK,
                            ),
                          )
                        ],
                      )),
                  addVerticalSpace(padding),
                  Padding(
                    padding: sidePadding,
                    child: Text(
                      "City",
                      style: themeData.textTheme.bodyText2,
                    ),
                  ),
                  addVerticalSpace(padding),
                  Padding(
                    padding: sidePadding,
                    child: Text(
                      "San Francisco",
                      style: themeData.textTheme.headline1,
                    ),
                  ),
                  const Padding(
                    padding: sidePadding,
                    child: Divider(
                      height: padding,
                      color: COLOR_GREY,
                    ),
                  ),
                  addVerticalSpace(10),
                  SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),

                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        "<\$220000",
                        "For Sale",
                        "3-4 Beds",
                        ">1000 sqft"
                      ].map((filter) => ChoiceOption(text: filter)).toList(),
                    ),
                  ),
                  addVerticalSpace(10),
                  Expanded(
                    child: Padding(
                        padding: sidePadding,
                        child: ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          itemCount: RE_DATA.length,
                          itemBuilder: (context, index) {
                            return RealStateWidget(itemData: RE_DATA[index]);
                          },
                        )),
                  )
                ],

                // OptionButton("Map" , , "")
              ),
              Positioned(
                  bottom: 20,
                  width: size.width,
                  child: Center(
                    child: OptionButton(
                      iconData: Icons.map_rounded,
                      text: "Map View",
                      width: size.width * 0.35,
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}

class ChoiceOption extends StatelessWidget {
  final String text;

  const ChoiceOption({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);

    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: COLOR_GREY.withAlpha(10)),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 13),
      margin: const EdgeInsets.only(left: 25),
      child: Text(
        text,
        style: themeData.textTheme.headline5,
      ),
    );
  }
}

class RealStateWidget extends StatelessWidget {
  final dynamic itemData;

  const RealStateWidget({super.key, required this.itemData});

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(25.0),
                child: Image.asset(itemData["image"]),
              ),
              const Positioned(
                  top: 15,
                  right: 15,
                  child: BorderBox(
                      height: 50,
                      width: 50,
                      padding: EdgeInsets.all(10),
                      child: Icon(
                        Icons.favorite_border,
                        color: COLOR_BLACK,
                      )))
            ],
          ),
          addVerticalSpace(10),
          Row(
            children: [
              Text(
                "${formatCurrency(itemData["amount"])}",
                style: themeData.textTheme.headline1,
              ),
              addHorizontalSpace(10),
              Text(
                "${itemData["address"]}",
                style: themeData.textTheme.bodyText2,
              )
            ],
          ),
          addVerticalSpace(10),
          Text(
            "${itemData["bedrooms"]} / bedrooms ${itemData["bathrooms"]} / bathrooms ${itemData["area"]} / sqft",
            style: themeData.textTheme.headline4,
          )
        ],
      ),
    );
  }
}
