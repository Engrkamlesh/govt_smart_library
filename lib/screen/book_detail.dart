import 'dart:async';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';


class BookDetailScreen extends StatefulWidget {
  const BookDetailScreen(
      {super.key,required this.title,required this.url});
  final String url;
  final String title;
  @override
  State<BookDetailScreen> createState() => _BookDetailScreenState();
}

class _BookDetailScreenState extends State<BookDetailScreen> {
  

  @override
  Widget build(BuildContext context) {
    WebViewController controller = WebViewController()
  ..setJavaScriptMode(JavaScriptMode.unrestricted)
  ..setBackgroundColor(const Color(0x00000000))
  ..setNavigationDelegate(
    NavigationDelegate(
      onProgress: (int progress) {
        // Update loading bar.
        print(progress);
      },
      onPageStarted: (String url) {},
      onPageFinished: (String url) {},
      onHttpError: (HttpResponseError error) {},
      onWebResourceError: (WebResourceError error) {},
      // onNavigationRequest: (NavigationRequest request) {
      //   if (request.url.startsWith('https://www.youtube.com/')) {
      //     return NavigationDecision.prevent;
      //   }
      //   return NavigationDecision.navigate;
      // },
    ),
  )
  ..loadRequest(Uri.parse(widget.url));
    return  Scaffold(
      appBar:AppBar(title:Text(widget.title,style: TextStyle(fontSize: 16,fontWeight: FontWeight.w700,color: Theme.of(context).primaryColor),)),
      body: WebViewWidget(
        controller: controller,
      ),
    );
  }
}
