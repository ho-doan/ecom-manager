import 'dart:async';

import 'package:flutter/material.dart';
import 'package:khoaluantotnghiep/main.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  late String currentTime;

  @override
  void initState() {
    super.initState();
    // Khởi tạo currentTime với thời gian hiện tại
    currentTime = DateTime.now().toString();

    // Cập nhật currentTime mỗi giây
    Timer.periodic(Duration(seconds: 1), (Timer t) {
      setState(() {
        currentTime = DateTime.now().toString();
      });
    });
  }

  
  @override
  
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Expanded(
        flex: 14,
        child: Column(
          children: [
            _topMenu(
              title:  'Nhà hàng hải sản',
              subTitle: DateTimeDisplay(),
              action: _search(),
            ),
            Container(
              height: 100,
              padding: EdgeInsets.symmetric(vertical: 24),
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                _itemTab(
                  icon: 'icons/icon-burger.png',
                  title: 'Burger',
                  isActive: true,
                ),
                 _itemTab(
                  icon: 'icons/icon-noodles.png',
                  title: 'Mì',
                  isActive: false,
                ),
                 _itemTab(
                  icon: 'icons/icon-drinks.png',
                  title: 'Các loại thức uống',
                  isActive: false,
                ),
                 _itemTab(
                  icon: 'icons/icon-desserts.png',
                  title: 'Món tráng miệng',
                  isActive: false,
                ),
              ]),
            )
          ],
        ),
      )
    ],
    );
  }

  Widget _itemTab({
    required String icon,
    required String title,
    required bool isActive,
  }){
    return Container(
      width: 300,
      margin: EdgeInsets.only(right: 26),
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 24),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.black26,
        border: isActive
        ?Border.all(color: Colors.deepOrangeAccent, width: 3)
        :Border.all(color: Colors.black38, width: 3),
      ),
      child: Row(
        children: [
          Image.asset(
            icon,
            width: 38,
          ),
          SizedBox(width: 8,),
          Text(
            title,
          style: TextStyle(
            fontSize: 14,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),)
        ],
      ),
    );
  }

  Widget _topMenu({
    required String title,
    required Widget subTitle,
    required Widget action,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 6),
            // Text(
               subTitle,
            //   style: TextStyle(
            //     color: Colors.black,
            //     fontSize: 10,
            //   ),
            // ),
          ],
        ),
        Expanded(flex: 1, child: Container(width: double.infinity,)),
        Expanded(flex: 5, child: action),

      ],
    );
  }
  Widget _search(){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      width: double.infinity,
      height: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        color: Colors.black38
      ),
      child: Row(
      children: [
        Icon(Icons.search, color: Colors.white54,),
        SizedBox(width: 10,),
        Text('Tìm kiếm ...', style: TextStyle(color: Colors.white54, fontSize: 11),)
      ],
      )
    );
  }
}