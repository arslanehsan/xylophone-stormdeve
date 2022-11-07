import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:xylophone/Utils/Global.dart';

import '../Utils/ColorsAyesha.dart';

class AyeshaScreen extends StatefulWidget {
  @override
  _AyeshaScreenState createState() => _AyeshaScreenState();
}

class _AyeshaScreenState extends State<AyeshaScreen> {
  late double screenWidth;
  late int selectedBox = -1;
  late String selectedBoxDouble = '0';
  late String gifImage = '';
  final AudioCache _player = AudioCache();
  List<String> symbols = [];
  final ScrollController _controller = ScrollController();

  void buttonPressed({required int index, required boxDouble}) {
    setState(() {
      selectedBox = index;
      selectedBoxDouble = boxDouble;
      symbols.add('dido$index.gif');
      symbols.remove(symbols);
      gifImage = 'images/right_mallet.png';
    });

    Timer(const Duration(milliseconds: 150), () {
      setState(() {
        gifImage = '';
      });
    });
    // _controller.animateTo(_controller.position.maxScrollExtent, duration: Duration(seconds: 4), curve: Curves.fastOutSlowIn);
    _player.play('note$index.wav');
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
        //alignment: Alignment.centerRight,
        children: [
          symbols.isNotEmpty
              ? Row(
                  children: [
                    _symbolsView(),
                    const Expanded(
                      child: SizedBox(),
                    ),
                    _symbolsView(),
                  ],
                )
              : const SizedBox(),
          _xylophoneBody(),
          backButtonView(context: context),
        ],
      )),
    );
  }

  Widget _symbolsView() {
    return Row(
      //    mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          height: MediaQuery.of(context).size.height,
          width: 100,
          decoration: const BoxDecoration(
            color: Colors.transparent,
          ),
          child: ListView.builder(
              controller: _controller,
              itemCount: symbols.length,
              scrollDirection: Axis.vertical,
              itemBuilder: (listContext, index) {
                return Container(
                  height: 100,
                  margin: EdgeInsets.only(right: 15),
                  child: Center(
                    child: Image.asset('images/${symbols[index]}'),
                  ),
                );
              }),
        ),
      ],
    );
  }

  Widget _xylophoneBody() {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
          image: DecorationImage(
        fit: BoxFit.fitHeight,
        image: AssetImage('images/backframedesign.png'),
      )),
      child: Column(
        children: [
          // const Image(image: AssetImage('images/eyes.gif'),width: 100,height: 100,),
          const Expanded(
            flex: 3,
            child: SizedBox(),
          ),
          const SizedBox(
            height: 20,
            width: 20,
          ),
          _singleButtonView(
              imageName: 'images/Sticksix.png',
              boxWidth: screenWidth / 1,
              index: 1),
          _singleButtonView(
              imageName: 'images/Stickfive.png',
              boxWidth: screenWidth / 1,
              index: 2),
          _singleButtonView(
              imageName: 'images/Stickfour.png',
              boxWidth: screenWidth / 1,
              index: 3),
          _singleButtonView(
              imageName: 'images/Stickthree.png',
              boxWidth: screenWidth / 1,
              index: 4),
          _singleButtonView(
              imageName: 'images/Stick_two.png',
              boxWidth: screenWidth / 1,
              index: 5),
          _singleButtonView(
              imageName: 'images/Stickone.png',
              boxWidth: screenWidth / 1,
              index: 6),
          _singleButtonView(
              imageName: 'images/Stickseven.png',
              boxWidth: screenWidth / 1,
              index: 7),
          const Expanded(
            flex: 3,
            child: SizedBox(),
          ),
        ],
      ),
    );
  }

  Widget _singleButtonView(
      {required String imageName,
      required double boxWidth,
      required int index}) {
    return Expanded(
      child: Container(
          width: boxWidth,
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.contain, image: AssetImage(imageName))),
          alignment: Alignment.centerLeft,
          child: Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () =>
                      buttonPressed(index: index, boxDouble: '$index.1'),
                  child:
                      (selectedBoxDouble == '$index.1' && gifImage.length > 1)
                          ? Image.asset(
                              'images/left_mallet.png',
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
                      (selectedBoxDouble == '$index.2' && gifImage.length > 1)
                          ? Image.asset(
                              'images/mid_mallets.png',
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
                      (selectedBoxDouble == '$index.3' && gifImage.length > 1)
                          ? Image.asset(
                              'images/right_mallet.png',
                            )
                          : Container(
                              color: Colors.transparent,
                            ),
                ),
              ),
            ],
          )),
    );
  }
}
