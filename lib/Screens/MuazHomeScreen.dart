import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:xylophone/Utils/Global.dart';

import '../Utils/ColorsMuaz.dart';

class MuazScreen extends StatefulWidget {
  @override
  _MuazScreenState createState() => _MuazScreenState();
}

class _MuazScreenState extends State<MuazScreen> {
  late double screenWidth;
  late int selectedBox = -1;
  late String selectedBoxDouble = '0';
  final ScrollController _controller = ScrollController();
  String gifName = '';
  int index = 0;

  final AudioPlayer player = AudioPlayer();

  void buttonPressed({required int index, required boxDouble}) {
    setState(() {
      selectedBox = index;
      selectedBoxDouble = boxDouble;
    });

    final AudioCache player = AudioCache();
    _showStick();
    player.play('note$index.wav');

    print(selectedBox);
  }

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: _bodyView(),
    );
  }

  Widget _bodyView() {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            bgColor,
            Colors.white,
          ],
        ),
      ),
      child: SafeArea(
        child: Stack(
          children: [
            _xylophoneBody(),
            backButtonView(context: context),
          ],
        ),
      ),
    );
  }

  Widget _xylophoneBody() {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage('images/images_muaz/ft1.png'),
        ),
      ),
      child: Column(
        children: [
          const Expanded(
            flex: 4,
            child: SizedBox(),
          ),
          _singalButtonView(
            imageName: 'images/images_muaz/but1.png',
            boxWidth: screenWidth / 1,
            index: 1,
          ),
          _singalButtonView(
            imageName: 'images/images_muaz/but2.png',
            boxWidth: screenWidth / 1,
            index: 2,
          ),
          _singalButtonView(
            imageName: 'images/images_muaz/but3.png',
            boxWidth: screenWidth / 1,
            index: 3,
          ),
          _singalButtonView(
            imageName: 'images/images_muaz/but4.png',
            boxWidth: screenWidth / 1,
            index: 4,
          ),
          _singalButtonView(
            imageName: 'images/images_muaz/but5.png',
            boxWidth: screenWidth / 1,
            index: 5,
          ),
          _singalButtonView(
            imageName: 'images/images_muaz/but6.png',
            boxWidth: screenWidth / 1,
            index: 6,
          ),
          _singalButtonView(
            imageName: 'images/images_muaz/but7.png',
            boxWidth: screenWidth / 1,
            index: 7,
          ),
          const Expanded(
            flex: 3,
            child: SizedBox(),
          ),
        ],
      ),
    );
  }

  Widget _singalButtonView(
      {required String imageName,
      required double boxWidth,
      required int index}) {
    return Expanded(
      flex: 2,
      child: GestureDetector(
        onTap: () => buttonPressed(index: index, boxDouble: 'index'),
        child: Container(
          width: boxWidth,
          margin: const EdgeInsets.symmetric(horizontal: 60),
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.contain,
              image: AssetImage(imageName),
            ),
          ),
          alignment: Alignment.centerLeft,
          child: Container(
            color: Colors.transparent,
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () =>
                        buttonPressed(index: index, boxDouble: '$index.1'),
                    child:
                        (gifName.length > 1 && selectedBoxDouble == '$index.1')
                            ? Image.asset(
                                'images/images_muaz/jerry3.png',
                                height: 50,
                              )
                            : Container(
                                color: Colors.transparent,
                              ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () =>
                        buttonPressed(index: index, boxDouble: '$index.2'),
                    child:
                        (gifName.length > 1 && selectedBoxDouble == '$index.2')
                            ? Image.asset(
                                'images/images_muaz/jerry1.png',
                                height: 50,
                              )
                            : Container(
                                color: Colors.transparent,
                              ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () =>
                        buttonPressed(index: index, boxDouble: '$index.3'),
                    child:
                        (gifName.length > 1 && selectedBoxDouble == '$index.3')
                            ? Image.asset(
                                'images/images_muaz/jerry2.png',
                                height: 50,
                              )
                            : Container(
                                color: Colors.transparent,
                              ),
                  ),
                ),
              ],
            ),
          ),
          // child: selectedBox == index
          //     ? Image.asset('images/images_muaz/images/images_muaz_muaz/gif3.gif')
          //     : Container(),
        ),
      ),
    );
  }

  void _showStick() {
    setState(() {
      gifName = 'image';
    });
    Timer(const Duration(milliseconds: 300), () {
      setState(() {
        gifName = '';
      });
    });
  }
}
