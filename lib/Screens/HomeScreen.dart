import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:xylophone/Objects/ThemeObject.dart';
import 'package:xylophone/Screens/AyeshaScreen.dart';
import 'package:xylophone/Screens/DanishScreen.dart';
import 'package:xylophone/Utils/Global.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          color: Colors.grey,
          image: DecorationImage(
            fit: BoxFit.fitHeight,
            image: AssetImage('images/main_bg.png'),
          ),
        ),
        child: SafeArea(
          child: _bodyView(),
        ),
      ),
    );
  }

  Widget _bodyView() {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // const SizedBox(
              //   width: 40,
              // ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.brown,
                  borderRadius: BorderRadius.circular(20),
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                child: Text(
                  'Choose Your Theme'.toUpperCase(),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 26,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              // GestureDetector(
              //   onTap: () => Navigator.push(
              //     context,
              //     MaterialPageRoute(
              //       builder: (context) => OptionsView(),
              //     ),
              //   ),
              //   child: Container(
              //     padding: const EdgeInsets.all(10),
              //     decoration: BoxDecoration(
              //       color: const Color(0x30000000),
              //       borderRadius: BorderRadius.circular(10),
              //     ),
              //     child: const Icon(
              //       Icons.settings,
              //       color: Colors.white,
              //       size: 30,
              //     ),
              //   ),
              // )
            ],
          ),
          _singleListItem(
            theme: themList[0],
            screenToOpen: AyeshaScreen(),
          ),
          _singleListItem(
            theme: themList[1],
            screenToOpen: DanishScreen(),
          ),
          SizedBox(),
          SizedBox(),
          // _singleListItem(
          //   theme: themList[2],
          //   screenToOpen: MuazScreen(),
          // ),
        ],
      ),
    );
  }

  Widget _singleListItem(
      {required ThemeObject theme, required Widget screenToOpen}) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => screenToOpen,
        ),
      ),
      child: Container(
        height: MediaQuery.of(context).size.width / 2,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.black, width: 1),
            borderRadius: BorderRadius.circular(30),
            image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage(theme.imageName),
            )),
      ),
    );
  }
}
