import 'package:flutter/material.dart';
import 'package:flutter_tech_posts_trending/pages/signin_page.dart';

class IntroProfilePage extends StatefulWidget {
  @override
  _IntroProfilePageState createState() => _IntroProfilePageState();
}

class _IntroProfilePageState extends State<IntroProfilePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Hồ sơ của tôi'),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text('Hồ sơ bạn đã lưu tại đây',
              style: new TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
            new Text('Đăng ký hoặc đăng nhập để xem hồ sơ của bạn',
              style: new TextStyle(
                height: 2,
                fontSize: 15,
                fontWeight: FontWeight.w300,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              width: 550,
              height: 45,
              child: RaisedButton(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                color: Colors.blue,
                // onPressed: doSignIn,
                child: Text(
                  'Tạo tài khoản',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SignInPage()),
                );
              },
              child: Container(
                margin: EdgeInsets.only(top: 20),
                child: Text(
                  'Đã có tài khoản? Đăng nhập',
                  style: TextStyle(
                    fontSize: 17,
                    color: Colors.blue,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}