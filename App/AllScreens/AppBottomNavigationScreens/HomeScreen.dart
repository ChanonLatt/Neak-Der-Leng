import 'package:flutter/material.dart';

import '../../Utils/AppColors.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  EdgeInsets appPadding = EdgeInsets.fromLTRB(16.0, 0, 0, 0);
  double width;
  double height;
  List <PlaceCategory> _placeCategories = [
    PlaceCategory("Mountain", "mountain", true),
    PlaceCategory("Sea", "sea", false),
    PlaceCategory("Island", "island", false),
    PlaceCategory("Temple", "temple", false),
    PlaceCategory("Forest", "forest", false)
  ];

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

    List <Widget> slivers = [
      _buildHeaderSlider(),
      _addSpace(16.0),
      _buildHeaderTitle("Most Popular Places"),
      _addSpace(16.0),
      _buildHorizontalListView(),
      _addSpace(32.0),
      _buildHeaderTitle("All Categories"),
      _addSpace(16.0),
      _buildHorizontalListCategories()
    ];

    List <Widget> itemsByCategory = _getPlacesByCategory();

    return Container(
      child: CustomScrollView(
        slivers: slivers + itemsByCategory
      ),
    );
  }


  _addSpace(double space) => SliverToBoxAdapter(child: SizedBox(height: space));

  _buildHeaderSlider() => SliverToBoxAdapter(
      child: Container(
        height: 300,
        color: appColor,
      ),
      );

  _buildHeaderTitle(String text) => SliverToBoxAdapter(
    child: Container(
      padding: appPadding,
      child: Text(
        text,
        textAlign: TextAlign.left,
        style: TextStyle(
          fontSize: 20.0,
          color: Colors.black,
          fontWeight: FontWeight.bold
        ),
      ),
    ),
  );

  _buildHorizontalListView() => SliverToBoxAdapter(
    child: Container(
      padding: appPadding,
      height: 190.0,

      child: ListView.builder(
        clipBehavior: Clip.none,
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: 18,
          itemBuilder: (context, index) => _buildHorizontalListViewCell()
      ),
    ),
  );

  _buildHorizontalListViewCell() {
    double stackChildrenMargin = 10.0;
    return Container(
      margin: EdgeInsets.only(right: 16.0),
      width: 312.0,
      height: 190.0,
      decoration: BoxDecoration(
          color: appWhite,
          borderRadius: BorderRadius.circular(15.0),
          boxShadow: [BoxShadow(
              color: appBlack.withOpacity(0.2),
              offset: Offset(0, 4),
              blurRadius: 4,
              spreadRadius: 1
          )],
          image: DecorationImage(
              image: AssetImage("App/Utils/Assets/sample_place.png"),
              fit: BoxFit.cover
          )
      ),

      child: Stack(
        children: [
          Positioned(
              top: stackChildrenMargin,
              left: stackChildrenMargin,
              width: 26.0,
              height: 26.0,
              child: Image.asset("App/Utils/Assets/favorite_filled.png")
          ), /// favorite icon
          Positioned(
              top: stackChildrenMargin,
              right: stackChildrenMargin,
              height: 30,
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    color: appGray3.withOpacity(0.6)
                ),
                child: Row(
                  children: [
                    SizedBox(width: 8.0),
                    Image.asset("App/Utils/Assets/distance.png", width: 16.0, height: 16.0,),
                    SizedBox(width: 8.0),
                    Text("30 Km", style: TextStyle(
                        color: appWhite,
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold
                    )),
                    SizedBox(width: 8.0),
                  ],
                ),
              )
          ), /// distance
          Positioned(
              left: stackChildrenMargin,
              bottom: stackChildrenMargin,
              height: 30,
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    color: appColor.withOpacity(0.6)
                ),
                child: Row(
                  children: [
                    SizedBox(width: 8.0),
                    Image.asset("App/Utils/Assets/location_icon.png", width: 12.0, height: 16.0,),
                    SizedBox(width: 8.0),
                    Text("Fresh beautiful sea, Keb", style: TextStyle(
                        color: appWhite,
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold
                    ),),
                    SizedBox(width: 8.0),
                  ],
                ),
              )
          ) /// address name
        ],
      ),
    );
  }

  _buildHorizontalListCategories() {
    return SliverToBoxAdapter(
      child: Container(
        margin: EdgeInsets.only(left: 16.0),
        height: 60.0,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
            itemCount: _placeCategories.length,
            itemBuilder: (context, index) => _buildCategoriesItemCell(index)
        ),
      ),
    );
}

  _buildCategoriesItemCell(int index) {
    PlaceCategory category = _placeCategories[index];
    TextStyle style = TextStyle(
        color: category.isSelected ? appColor : appGray3,
        fontSize: 14.0,
        fontWeight: FontWeight.bold
    );
    Size textSize = _getTextSize(category.text, style);
    return InkWell(
      onTap: () {
        setState(() {
          _placeCategories.asMap().forEach((placeIndex, place) {
            placeIndex == index ? (place.isSelected = true) : (place.isSelected = false);
          });
        });
      },
      child: Container(
        margin: EdgeInsets.fromLTRB(0, 0, 20.0, 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              category.text,
              textAlign: TextAlign.center,
              style: style
            ),
            SizedBox(height: 8.0),
            Opacity(
              opacity: category.isSelected ? 1 : 0,
              child: Container(
                height: 4.0,
                width: textSize.width * 0.6,
                decoration: BoxDecoration(
                  color: category.isSelected ? appColor : appGray3,
                  borderRadius: BorderRadius.circular(4.0)
                ),
              ),
            )
          ],
        ),
      ),
    );
}

  _getPlacesByCategory() {
    const margin = EdgeInsets.fromLTRB(16.0, 0, 16.0, 16.0);
    return [
      SliverToBoxAdapter(
        child: Container(
          margin: margin,
          height: 245.0,
          color: appColor,
        ),
      ),
      SliverToBoxAdapter(
        child: Container(
          margin: margin,
          height: 245.0,
          color: appColor,
        ),
      ),
      SliverToBoxAdapter(
        child: Container(
          margin: margin,
          height: 245.0,
          color: appColor,
        ),
      ),
      SliverToBoxAdapter(
        child: Container(
          margin: margin,
          height: 245.0,
          color: appColor,
        ),
      ),
      SliverToBoxAdapter(
        child: Container(
          margin: margin,
          height: 245.0,
          color: appColor,
        ),
      ),
      SliverToBoxAdapter(
        child: Container(
          margin: margin,
          height: 245.0,
          color: appColor,
        ),
      ),
    ];
  }

  Size _getTextSize(String text, TextStyle style) {
    final TextPainter textPainter = TextPainter(
        text: TextSpan(text: text, style: style), maxLines: 1, textDirection: TextDirection.ltr)
      ..layout(minWidth: 0, maxWidth: double.infinity);
    return textPainter.size;
  }

}

class PlaceCategory {
  String text;
  String value;
  bool isSelected;
  PlaceCategory(this.text, this.value, this.isSelected);
}