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

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Container(
      child: CustomScrollView(

        slivers: [
          _buildHeaderSlider(),
          _addSpace(16.0),
          _buildHeaderTitle("Most Popular Places"),
          _addSpace(16.0),
          _buildHorizontalListView(),
          _addSpace(32.0),
          _buildHeaderTitle("All Categories")


        ],
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
  _buildHorizontalListViewCell() => Container(
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

      ],
    ),

  );
}
