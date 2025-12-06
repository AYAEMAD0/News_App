import 'package:flutter/material.dart';
import 'package:news_app/core/theme/app_colors.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewItem extends StatefulWidget {
  const WebViewItem({super.key, required this.url, required this.nameNews});

  final String url;
  final String nameNews;

  @override
  State<WebViewItem> createState() => _WebViewItemState();
}

class _WebViewItemState extends State<WebViewItem> {
  int loadingProgress = 0;
  late WebViewController controller = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..setNavigationDelegate(
      NavigationDelegate(
        onProgress: (int progress) {
          loadingProgress = progress;
          setState(() {});
        },
        onPageStarted: (String url) {
          loadingProgress = 0;
          setState(() {});
        },
        onPageFinished: (String url) {
          loadingProgress = 100;
          setState(() {});
        },
      ),
    )
    ..loadRequest(Uri.parse(widget.url));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.nameNews),
        actions: [
          IconButton(
            onPressed: () {
              controller.goBack();
            },
            icon: Icon(Icons.arrow_back),
          ),
          IconButton(
            onPressed: () {
              controller.reload();
            },
            icon: Icon(Icons.refresh),
          ),
          IconButton(
            onPressed: () {
              controller.goForward();
            },
            icon: Icon(Icons.arrow_forward),
          ),
        ],
      ),
      body: SafeArea(
        child: Stack(
          children: [
            WebViewWidget(controller: controller),
            if (loadingProgress != 100)
              LinearProgressIndicator(
                color: AppColors.activeProgress,
                backgroundColor: AppColors.unActiveProgress,
                value: loadingProgress / 100,
              ),
          ],
        ),
      ),
    );
  }
}
