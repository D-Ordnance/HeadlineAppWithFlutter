import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebPageWithPushNamed extends StatefulWidget {
  const WebPageWithPushNamed({super.key});

  @override
  State<WebPageWithPushNamed> createState() => _WebPageWithPushNamedState();
}

class _WebPageWithPushNamedState extends State<WebPageWithPushNamed> {
  @override
  Widget build(BuildContext context) {
    final WebPageModel model =
        ModalRoute.of(context)!.settings.arguments as WebPageModel;
    return Scaffold(
      appBar: AppBar(title: Text(model.title)),
      body: WebViewWidget(
          controller: WebViewController()
            ..setJavaScriptMode(JavaScriptMode.unrestricted)
            ..setBackgroundColor(const Color(0x00000000))
            ..setNavigationDelegate(
              NavigationDelegate(
                onProgress: (int progress) {
                  // Update loading bar.
                  Center(
                      child: CircularProgressIndicator(
                          value: progress.toDouble()));
                },
                onPageStarted: (String url) {},
                onPageFinished: (String url) {},
                onWebResourceError: (WebResourceError error) {},
                onNavigationRequest: (NavigationRequest request) {
                  if (request.url.startsWith('https://www.youtube.com/')) {
                    return NavigationDecision.prevent;
                  }
                  return NavigationDecision.navigate;
                },
              ),
            )
            ..loadRequest(Uri.parse(model.url))),
    );
  }
}

class WebPageModel {
  final String title;
  final String url;
  const WebPageModel({required this.title, required this.url});
}
