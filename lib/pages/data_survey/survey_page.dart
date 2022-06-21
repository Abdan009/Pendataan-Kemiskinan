import 'package:app_flutter_cocom/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class Survey_page extends StatefulWidget {
  const Survey_page({Key? key}) : super(key: key);

  @override
  State<Survey_page> createState() => _Survey_pageState();
}

class _Survey_pageState extends State<Survey_page> {
  final _searchController = TextEditingController();

  Widget _searching() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      width: double.infinity,
      height: 70,
      child: Center(
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: 14,
          ),
          width: double.infinity,
          height: 45,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                width: 1,
                color: kBlackColor2,
              )),
          child: TextField(
            controller: _searchController,
            autocorrect: false,
            style: blackTextBody.copyWith(
              fontSize: 15,
              fontWeight: regular,
            ),
            decoration: InputDecoration(
              hintText: 'Searching',
              hintStyle:
                  grey2TextBody.copyWith(fontSize: 15, fontWeight: regular),
              border: InputBorder.none,
              suffixIcon: Icon(
                Icons.search,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget bList() {
    return Container(
      margin: EdgeInsets.only(bottom: 8),
      width: double.infinity,
      height: 60,
      decoration: BoxDecoration(
        color: kBackgroun,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.7),
            spreadRadius: 2,
            blurRadius: 2,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: TextButton(
        onPressed: () {},
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 18),
          child: Row(
            children: [
              Text(
                'Cocom',
                style: blueTextBody.copyWith(
                  fontSize: 14,
                  fontWeight: regular,
                ),
              ),
              Spacer(),
              GestureDetector(
                onTap: () {},
                child: Image(
                  image: AssetImage('assets/tong_sampah.png'),
                  width: 20,
                  height: 20,
                ),
              ),
              const SizedBox(
                width: 16,
              ),
              GestureDetector(
                onTap: () {},
                child: Image(
                  image: AssetImage('assets/edit.png'),
                  width: 20,
                  height: 20,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kBackgroun2,
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.keyboard_arrow_left_rounded,
              size: 40,
            ),
          ),
          title: Text('Data Survey'),
          backgroundColor: kPrimaryColor,
        ),
        body: ListView(
          children: [
            _searching(),
            bList(),
            bList(),
            bList(),
            bList(),
            bList(),
            bList(),
            bList(),
          ],
        ));
  }
}
