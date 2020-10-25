import 'package:app_tv/app/home/home.module.dart';
import 'package:app_tv/app/home/library/nhap-lieu/sach/list-book.cubit.dart';
import 'package:app_tv/repositories/library/library.repositories.dart';
import 'package:app_tv/utils/screen_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ListBookView extends StatefulWidget {
  @override
  _ListBookViewState createState() => _ListBookViewState();
}

class _ListBookViewState extends State<ListBookView> with AutomaticKeepAliveClientMixin {
  ListBookCubit _cubit = ListBookCubit(LibraryRepository());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xff068189),
        foregroundColor: Colors.black,
        onPressed: () {
          Modular.link.pushNamed(HomeModule.newBook);
          // Respond to button press
        },
        child: Icon(Icons.add, color: Colors.white),
      ),
      body: Stack(
        children: [
          Center(
            child: Opacity(
              opacity: 0.5,
              child: Image.network(
                "https://scontent.fhan2-3.fna.fbcdn.net/v/t31.0-8/11062339_936357076423736_8686865242051210984_o.jpg?_nc_cat=108&ccb=2&_nc_sid=09cbfe&_nc_ohc=KfvB_wquuYoAX_Yu869&_nc_ht=scontent.fhan2-3.fna&oh=906780f218fbf138114378e2ed1b9994&oe=5FBA62D8",
                fit: BoxFit.cover,
              ),
            ),
          ),
          BlocBuilder<ListBookCubit, ListBookState>(
              cubit: _cubit,
              buildWhen: (prev, now) => now is ListBookLoading || now is ItemsListBookLoaded,
              builder: (context, state) {
                if (state is ItemsListBookLoaded) {
                  return _getBody(state);
                } else if (state is ListBookError) {
                  return Center(child: Text(state.message));
                } else {
                  return Center(child: CupertinoActivityIndicator(radius: 15));
                }
              }),
        ],
      ),
    );
  }

  Widget _getBody(ListBookState state) {
    return Column(
      children: [
        SizedBox(height: 20),
        Row(
          children: [
            Expanded(
              child: Container(
                color: Colors.green,
                width: 130,
                height: 3,
              ),
            ),
            Text("Tổng số : ${_cubit.listBook.length}",
                style: TextStyle(color: Colors.black, fontSize: 17, fontWeight: FontWeight.bold)),
            Expanded(
              child: Container(
                color: Colors.green,
                width: 135,
                height: 3,
              ),
            ),
          ],
        ),
        SizedBox(height: 20),
        Expanded(
          child: Container(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ...List.generate(_cubit.listBook.length, (index) {
                    return Card(
                      elevation: 1.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      margin: EdgeInsets.only(top: 8.0, right: 15.0, left: 15.0),
                      color: (index % 2 == 0) ? Colors.grey.withOpacity(0.8) : Color(0xff068189).withOpacity(0.8),
                      child: FlatButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        onPressed: () {},
                        child: Container(
                          margin: EdgeInsets.all(15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.confirmation_number,
                                    color: Colors.green,
                                    size: 25,
                                  ),
                                  SizedBox(width: 10.0),
                                  Text("ID : ${_cubit.listBook[index].id}",
                                      style: TextStyle(color: Colors.black, fontSize: 17)),
                                ],
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.my_library_books_rounded,
                                    color: Colors.green,
                                    size: 25,
                                  ),
                                  SizedBox(width: 10.0),
                                  Text("Name : ${_cubit.listBook[index].name} - ${_cubit.listBook[index].idBook}",
                                      style: TextStyle(color: Colors.black, fontSize: 17)),
                                ],
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.attach_money,
                                    color: Colors.green,
                                    size: 25,
                                  ),
                                  SizedBox(width: 10.0),
                                  Text("Price : ${_cubit.listBook[index].price}",
                                      style: TextStyle(color: Colors.black, fontSize: 17)),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  })
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}