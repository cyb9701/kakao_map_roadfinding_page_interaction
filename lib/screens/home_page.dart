import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: Stack(
        children: [
          // 지도.
          _map(),

          // 총 경로.
          _totalPath(),

          // 상세 경로.
          _detailPath(),
        ],
      ),
    );
  }

  AppBar _appBar() {
    return AppBar(
      elevation: 0,
      leading: const Icon(
        Icons.arrow_back_ios,
      ),
      actions: const [
        SizedBox(
          width: 56,
          child: Icon(
            Icons.close,
            size: 30,
          ),
        ),
      ],
      titleSpacing: 0,
      titleTextStyle: const TextStyle(fontSize: 18),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          // 출발지.
          Text('강남역 신분당선'),

          // 아이콘.
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 4),
            child: Opacity(
              opacity: 0.5,
              child: Icon(
                Icons.arrow_forward,
                size: 16,
              ),
            ),
          ),

          // 도착지.
          Text('판교역 신분당선'),
        ],
      ),
    );
  }

  // 지도.
  Widget _map() {
    return const GoogleMap(
      initialCameraPosition: CameraPosition(
        target: LatLng(37.497407, 127.027512),
        zoom: 16,
      ),
      myLocationButtonEnabled: false,
    );
  }

  // 총 경로.
  Container _totalPath() {
    return Container(
      width: 70,
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            spreadRadius: 0,
            blurRadius: 5,
            offset: Offset(0, 2),
          ),
        ],
      ),
    );
  }

  // 상세 경로.
  Container _detailPath() {
    return Container(
      height: 100,
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(color: Colors.grey, width: 0.5),
        ),
      ),
    );
  }
}
