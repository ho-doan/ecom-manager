import 'dart:async';

import 'package:clean_arc/core/router/router_path.dart';
import 'package:clean_arc/main.dart';
import 'package:clean_arc/pages/home/cubits/location/location_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../widgets/demo.dart';
import 'cubits/home/home_cubit.dart';
import 'widgets/button_update_counter.dart';

// class HomePage extends StatefulWidget {
//   const HomePage({super.key});

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   HomeCubit get cubit => context.read<HomeCubit>();
//   @override
//   Widget build(BuildContext context) {
//     return BlocListener<HomeCubit, HomeState>(
//       listener: (context, state) {},
//       child: BlocBuilder<HomeCubit, HomeState>(
//         builder: (context, state) {
//           return Scaffold(
//             body: Center(
//               child: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   if (state is HomeSuccess) Text('counter ${state.counter}'),
//                   if (state is HomeSuccess) ButtonUpdateCounter(cubit: cubit),
//                   const Location(),
//                   ElevatedButton(
//                     onPressed: () {
//                       context.go(RoutePath.productsName);
//                     },
//                     child: const Text('Products'),
//                   ),
//                   BlocBuilder<LocationCubit, LocationState>(
//                     bloc: cubit.locationCubit,
//                     builder: (context, state) {
//                       if (state is! LocationSuccess) {
//                         return const CircularProgressIndicator();
//                       }
//                       return Text(state.counter.toString());
//                     },
//                   ),
//                 ],
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
//---------------------------------------------------------------------------
//code của mình
// class HomePage extends StatefulWidget {
//   const HomePage({super.key});

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {

//   late String currentTime;

//   @override
//   void initState() {
//     super.initState();
//     // Khởi tạo currentTime với thời gian hiện tại
//     currentTime = DateTime.now().toString();

//     // Cập nhật currentTime mỗi giây
//     Timer.periodic(Duration(seconds: 1), (Timer t) {
//       setState(() {
//         currentTime = DateTime.now().toString();
//       });
//     });
//   }

  
//   @override
  
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.start,
//       crossAxisAlignment: CrossAxisAlignment.start,
//     children: [
//       Expanded(
//         flex: 14,
//         child: Column(
//           children: [
//             _topMenu(
//               title:  'Nhà hàng hải sản',
//               subTitle: DateTimeDisplay(),
//               action: _search(),
//             ),
//             Container(
//               height: 100,
//               padding: EdgeInsets.symmetric(vertical: 24),
//               child: ListView(
//                 scrollDirection: Axis.horizontal,
//                 children: [
//                 _itemTab(
//                   icon: 'icons/icon-burger.png',
//                   title: 'Burger',
//                   isActive: true,
//                 ),
//                  _itemTab(
//                   icon: 'icons/icon-noodles.png',
//                   title: 'Mì',
//                   isActive: false,
//                 ),
//                  _itemTab(
//                   icon: 'icons/icon-drinks.png',
//                   title: 'Các loại thức uống',
//                   isActive: false,
//                 ),
//                  _itemTab(
//                   icon: 'icons/icon-desserts.png',
//                   title: 'Món tráng miệng',
//                   isActive: false,
//                 ),
//               ]),
//             ),
//             Expanded(child: GridView.count(
//               crossAxisCount: 4,
//               childAspectRatio: (1/1.2),
//               children: [
//                 _item(
//                   image: 'items/1.png',
//                   title: 'Burger truyền thống',
//                   price: '25000VNĐ',
//                   item: '11 cái',
//                 )
//               ],))
//           ],
//         ),
//       )
//     ],
//     );
//   }

//   Widget _item({
//     required String image,
//     required String title,
//     required String price,
//     required String item,
//   }){
//     return Container(
//       margin: EdgeInsets.only(right: 20, bottom: 20),
//       padding: EdgeInsets.all(12),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(18),
//         color: Colors.black45,
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Container(
//             height: 130,
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(16),
//               image: DecorationImage(
//                 image: AssetImage(image), 
//                 fit: BoxFit.cover,
//               ),
//             ),
//           ),
//           SizedBox(height: 10,),
//           Text(
//             title,
//             style: TextStyle(
//               color: Colors.white,
//               fontWeight: FontWeight.bold,
//               fontSize: 14,
//             ),
//           ),
//           SizedBox(height: 20,),
//           Row(
//             children: [
//               Text(
//                 title,
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontWeight: FontWeight.bold,
//                   fontSize: 14,
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _itemTab({
//     required String icon,
//     required String title,
//     required bool isActive,
//   }){
//     return Container(
//       width: 300,
//       margin: EdgeInsets.only(right: 26),
//       padding: EdgeInsets.symmetric(vertical: 8, horizontal: 24),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(10),
//         color: Colors.black26,
//         border: isActive
//         ?Border.all(color: Colors.deepOrangeAccent, width: 3)
//         :Border.all(color: Colors.black38, width: 3),
//       ),
//       child: Row(
//         children: [
//           Image.asset(
//             icon,
//             width: 38,
//           ),
//           SizedBox(width: 8,),
//           Text(
//             title,
//           style: TextStyle(
//             fontSize: 14,
//             color: Colors.white,
//             fontWeight: FontWeight.bold,
//           ),)
//         ],
//       ),
//     );
//   }

//   Widget _topMenu({
//     required String title,
//     required Widget subTitle,
//     required Widget action,
//   }) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.start,
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               title,
//               style: TextStyle(
//                 color: Colors.black,
//                 fontSize: 20,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             SizedBox(height: 6),
//             // Text(
//                subTitle,
//             //   style: TextStyle(
//             //     color: Colors.black,
//             //     fontSize: 10,
//             //   ),
//             // ),
//           ],
//         ),
//         Expanded(flex: 1, child: Container(width: double.infinity,)),
//         Expanded(flex: 5, child: action),

//       ],
//     );
//   }
//   Widget _search(){
//     return Container(
//       padding: EdgeInsets.symmetric(horizontal: 20),
//       width: double.infinity,
//       height: 40,
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(18),
//         color: Colors.black38
//       ),
//       child: Row(
//       children: [
//         Icon(Icons.search, color: Colors.white54,),
//         SizedBox(width: 10,),
//         Text('Tìm kiếm ...', style: TextStyle(color: Colors.white54, fontSize: 11),)
//       ],
//       )
//     );
//   }
// }

//---------------------------------------------------------------------------
//code làm lại
