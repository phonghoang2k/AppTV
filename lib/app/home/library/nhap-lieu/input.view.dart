import 'package:app_tv/app/home/library/nhap-lieu/sach/list-book.view.dart';
import 'package:app_tv/utils/screen_config.dart';
import 'package:flutter/material.dart';

class InputView extends StatefulWidget {
  @override
  _InputViewState createState() => _InputViewState();
}

class _InputViewState extends State<InputView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            leading: BackButton(
              color: Color(0xff068189),
            ),
            elevation: 0,
            toolbarHeight: SizeConfig.blockSizeVertical * 10,
            backgroundColor: Colors.white,
            bottom: TabBar(
              unselectedLabelColor: Colors.grey,
              indicatorSize: TabBarIndicatorSize.label,
              indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Color(0xff068189)),
              labelPadding: EdgeInsets.zero,
              isScrollable: true,
              indicatorWeight: 2.0,
              tabs: [
                SizedBox(
                  width: 100,
                  child: Tab(
                    text: "Sách",
                  ),
                ),
                SizedBox(
                  width: 100,
                  child: Tab(
                    text: "Mượn / Trả",
                  ),
                ),
              ],
            ),
            bottomOpacity: 1,
          ),
          body: TabBarView(
            children: [
              ListBookView(),
              Container(),
            ],
          ),
        ),
      ),
    );
  }
}