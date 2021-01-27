import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {
  String url = "http://172.27.16.216";

  final flutterWebviewPlugin = new FlutterWebviewPlugin();
// here we checked the url state if it loaded or start Load or abort Load
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    flutterWebviewPlugin
        .dispose(); // disposing the webview widget to avoid any leaks
  }
  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
        url: url,
        withJavascript: true, // run javascript
        withZoom: false, // if you want the user zoom-in and zoom-out
        hidden: true, // put it true if you want to show CircularProgressIndicator while waiting for the page to load

        appBar: AppBar(
          title: Text("FUSION IIITDMJ"),
          centerTitle: false,
          elevation: 1,
          iconTheme: IconThemeData(color: Colors.white),
          actions: <Widget>[
            InkWell(
              child: Icon(Icons.refresh),
              onTap: () {
                flutterWebviewPlugin.reload();
              },
            ),
            InkWell(
              child: Icon(Icons.stop),
              onTap: () {
                flutterWebviewPlugin.stopLoading(); // stop loading the url
              },
            ),
            InkWell(
              child: Icon(Icons.close),
              onTap: () {
                flutterWebviewPlugin.hide(); // hide the webview widget
              },
            ),
            InkWell(
              child: Icon(Icons.arrow_back),
              onTap: () {
                flutterWebviewPlugin.goBack(); // for going back
              },
            ),
            InkWell(
              child: Icon(Icons.forward),
              onTap: () {
                flutterWebviewPlugin.goForward(); // for going forward
              },
            ),
          ], // make the icons colors inside appbar with white color
        ),
        initialChild: Container(
          // but if you want to add your own waiting widget just add InitialChild
          color: Colors.white,
          child: const Center(
            child: Text('waiting...'),
          ),
        ));
  }
}
