import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('My App'),
        ),
        body: PostOptions(),
      ),
    );
  }
}

class PostOptions extends StatefulWidget {
  @override
  _PostOptionsState createState() => _PostOptionsState();
}

class _PostOptionsState extends State<PostOptions> {
  bool _isImageSelected = false;
  bool _isTextSelected = false;
  
  void _toggleImage(bool?  value) {
    setState(() {
      _isImageSelected = !_isImageSelected;
    });
  }

  void _toggleText(bool?  value) {
    setState(() {
      _isTextSelected = !_isTextSelected;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Add an image:'),
            Checkbox(
              value: _isImageSelected,
              onChanged: _toggleImage,
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Add text:'),
            Checkbox(
              value: _isTextSelected,
              onChanged: _toggleText,
            ),
          ],
        ),
        _isImageSelected || _isTextSelected
            ? Post(
                isImageSelected: _isImageSelected,
                isTextSelected: _isTextSelected,
              )
            : Container(),
      ],
    );
  }
}

class Post extends StatelessWidget {
  final bool isImageSelected;
  final bool isTextSelected;

  Post({required this.isImageSelected, required this.isTextSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          isImageSelected
              ? Image.network(
                  'https://example.com/image.jpg',
                  height: 200.0,
                  width: 200.0,
                  fit: BoxFit.cover,
                )
              : Container(),
          isTextSelected
              ? Text(
                  'This is a post with an image and text.',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                )
              : Container(),
        ],
      ),
    );
  }
}
