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
          ],
        ),
      )
    ],
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