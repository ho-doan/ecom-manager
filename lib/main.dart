import 'package:clean_arc/constants/global_variables.dart';
import 'package:clean_arc/core/router/routers.dart';
import 'package:clean_arc/features/auth/screens/auth_screen.dart';
import 'package:clean_arc/pages/home/home_page.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'core/services/di/service_locator.dart';

// void main() {
//   WidgetsFlutterBinding.ensureInitialized();
//   configureDependencies(Dio());
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp.router(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//         useMaterial3: true,
//       ),
//       routerConfig: Routes.instance.router,
//     );
//   }
// }
//------------------------------------------------------------------------------
//code của mình
// void main() {
//   runApp(const MyApp());
// }

// class DateTimeDisplay extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     DateTime now = DateTime.now();

//     String formattedDateTime ='⌨︎${now.day}/${now.month}/${now.year}⏲︎${now.hour}:${now.minute}';

//     return Text(
//       '$formattedDateTime',
//       style: TextStyle(fontSize: 15),
//     );
//   }
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Quản lí bán hàng',
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//         useMaterial3: true,
//       ),
//       home: const MainPage(),
//     );
//   }
// }

// class MainPage extends StatefulWidget {
//   const MainPage({super.key});

//   @override
//   State<MainPage> createState() => _MainPageState();
// }

// class _MainPageState extends State<MainPage> {

//   String pageActive="Trang chủ";

//   _pageView(){
//     switch(pageActive){
//       case 'Trang chủ':
//       return HomePage();
//       case 'Menu':
//       return Container();
//       case 'Lịch sử':
//       return Container();
//       case 'Khuyến mãi':
//       return Container();
//       case 'Các danh mục cần quản lí':
//       return Container();
//       case 'Hỗ trợ khách hàng':
//       return Container();
//       case 'Báo cáo thống kê':
//       return Container();
//       case 'Cài đặt':
//       return Container();
//       default:
//       return HomePage();
//     }
//   }

// _setPage(String page){
//   setState(() {
//     pageActive=page;
//   });
// }


// //code dưới là chia cột với các button với view
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.pink,
//       body: Row(
//       children: [
//         Container(
//           width: 70,
//           padding: EdgeInsets.only(top: 24, right: 12, left: 12),
//           height: MediaQuery.of(context).size.height,
//           child: _sideMenu(),
//         ),
//         Expanded(
//           child: Container(
//           margin: EdgeInsets.only(top: 24, right: 12),
//           padding: EdgeInsets.only(top: 12, right: 12, left: 12),
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.only(
//               topLeft: Radius.circular(12),
//               topRight: Radius.circular(12)),
//               color:Colors.blue),
//               child: _pageView(),
//             ),
//           ),
//         ],
//       ),
//     );
//   }



// //code dưới là các button chức năng
//   Widget _sideMenu(){
//     return Column(
//       children: [
//         _logo(),
//         SizedBox(height: 20),
//         Expanded(child: ListView( 
//           children:[
//             _itemMenu(
//             menu: 'Trang chủ',
//             icon: Icons.rocket_sharp,
//           ),
//               _itemMenu(
//             menu: 'Menu',
//             icon: Icons.format_list_bulleted_rounded,
//           ),
//               _itemMenu(
//             menu: 'Lịch sử',
//             icon: Icons.history_toggle_off_rounded,
//           ),
//               _itemMenu(
//             menu: 'Khuyến mãi',
//             icon: Icons.discount_outlined,
//           ),
//               _itemMenu(
//             menu: 'Các danh mục cần quản lí',
//             icon: Icons.edit_note_rounded,
//           ),
//           _itemMenu(
//             menu: 'Hỗ trợ khách hàng',
//             icon: Icons.chat_bubble_outline_outlined,
//           ),
//            _itemMenu(
//             menu: 'Báo cáo thống kê',
//             icon: Icons.multiline_chart,
//           ),
//               _itemMenu(
//             menu: 'Cài đặt',
//             icon: Icons.sports_soccer_outlined,
//           ),       
//           ]
//         ))      
//         ]
//     );
//   }

//   Widget _logo(){
//     return Column(
//       children: [
//         Container(
//           padding: EdgeInsets.all(8),
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(22),
//             color: Color(0xFF00B894),
//           ),
//           child: const Icon(
//           Icons.fastfood,
//           color: Colors.white,
//           size: 20,
//           ),
//         ),
//         SizedBox(height: 10),
//         Text("Quản lí bán hàng",
//         textAlign: TextAlign.center,
//         style: TextStyle(
//           color: Colors.black,
//           fontSize: 14,
//           fontWeight: FontWeight.bold,
//         ),
//         ),
//       ],
//     );
//   }


// //code dưới là tùy chỉnh chức năng cho các nút chức năng như click chuột vào các nút button
//   Widget _itemMenu({required String menu, required IconData icon}){
//     return Padding(padding:EdgeInsets.symmetric(vertical: 9),
//     child: GestureDetector(
//       onTap: ()=>_setPage(menu),
//       child: MouseRegion(
//         cursor: SystemMouseCursors.click,
//         child: AnimatedContainer(
//           padding: EdgeInsets.symmetric(vertical: 12),
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(22),
//             color: pageActive == menu ? Colors.deepOrangeAccent:Colors.transparent,
//           ),
//           duration: Duration(milliseconds: 300),
//           curve: Curves.slowMiddle,
//           child: Column(
//             children: [
//               Icon(
//                 icon, color: Colors.white,
//               ),
//               SizedBox(height: 5),
//               Text(menu, textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 10),),
//             ],
//           ),
//         ),
//       ),
//     ),);
//   }
// }
//------------------------------------------------------------------------------
//code làm lại
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
//Phần super.key ở trên chỉ định rằng hàm tạo này đang gọi hàm tạo của lớp cha (StatelessWidget) với tham số key.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quản lí bán hàng',
      theme: ThemeData(
        scaffoldBackgroundColor: GlobalVariables.backgroundColor,
        colorScheme: const ColorScheme.light(
          primary: GlobalVariables.secondaryColor,
        ),
        appBarTheme: const AppBarTheme(
          elevation: 0,
          iconTheme: IconThemeData(
            color: Colors.black
          )
        )
      ),
      onGenerateRoute: (settings) => generateRoute(settings),
      //hàm trên dùng để điều hướng đến một trang khác
      home: const AuthScreen(),
    );
  }
}

