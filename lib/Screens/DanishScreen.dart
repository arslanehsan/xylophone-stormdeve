import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:xylophone/Utils/Global.dart';

import '../Utils/ColorsDanish.dart';

class DanishScreen extends StatefulWidget {
  @override
  _DanishScreenState createState() => _DanishScreenState();
}

class _DanishScreenState extends State<DanishScreen> {
  late double screenWidth;
  late int selectedBox = -1;
  late String selectedBoxDouble = '0';
  final ScrollController _controller = ScrollController();
  String gifName = '';
  String backFrame = 'frame';
  int index = 0;

  final AudioPlayer player = AudioPlayer();

  List<String> symbols = [];

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
        color: bgColor,
      ),
      child: SafeArea(
        child: Stack(
          children: [
            _backgroundView(),
            _xylophoneBody(),
            backButtonView(context: context),
          ],
        ),
      ),
    );
  }

  Widget _backgroundView() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: const BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage('images/images_danish/bg_danish.png'),
        ),
      ),
    );
  }

  Widget _xylophoneBody() {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage('images/images_danish/$backFrame.png'),
        ),
      ),
      child: Column(
        children: [
          const Expanded(
            flex: 3,
            child: SizedBox(),
          ),
          _singalButtonView(
            imageName: 'images/images_danish/button1.png',
            boxWidth: screenWidth / 2.15,
            index: 1,
          ),
          _singalButtonView(
            imageName: 'images/images_danish/button2.png',
            boxWidth: screenWidth / 1.90,
            index: 2,
          ),
          _singalButtonView(
            imageName: 'images/images_danish/button3.png',
            boxWidth: screenWidth / 1.80,
            index: 3,
          ),
          _singalButtonView(
            imageName: 'images/images_danish/button4.png',
            boxWidth: screenWidth / 1.6,
            index: 4,
          ),
          _singalButtonView(
            imageName: 'images/images_danish/button5.png',
            boxWidth: screenWidth / 1.5,
            index: 5,
          ),
          _singalButtonView(
            imageName: 'images/images_danish/button6.png',
            boxWidth: screenWidth / 1.4,
            index: 6,
          ),
          _singalButtonView(
            imageName: 'images/images_danish/button7.png',
            boxWidth: screenWidth / 1.2,
            index: 7,
          ),
          const Expanded(
            flex: 4,
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
                            ? Image.asset('images/images_danish/left gif.gif')
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
                            ? Image.asset('images/images_danish/mid gif.gif')
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
                            ? Image.asset('images/images_danish/right gif.gif')
                            : Container(
                                color: Colors.transparent,
                              ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showStick() {
    setState(() {
      gifName = 'image';
      backFrame = 'frame09';
    });
    Timer(const Duration(milliseconds: 250), () {
      setState(() {
        gifName = '';
        backFrame = 'frame';
      });
    });
  }
}
