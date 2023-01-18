import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'dart:io';

class primeVedio extends StatefulWidget {
  const primeVedio({Key? key}) : super(key: key);

  @override
  State<primeVedio> createState() => _primeVedioState();
}

class _primeVedioState extends State<primeVedio> {
  InAppWebViewController? inAppWebViewController;
  late PullToRefreshController pullToRefreshController;
  List<String> addBookmark = [];

  @override
  void initState() {
    super.initState();
    pullToRefreshController = PullToRefreshController(
      options: PullToRefreshOptions(color: Colors.blue),
      onRefresh: () async {
        if (Platform.isAndroid) {
          await inAppWebViewController!.reload();
        } else if (Platform.isIOS) {
          await inAppWebViewController!.loadUrl(
            urlRequest: URLRequest(
              url: await inAppWebViewController!.getUrl(),
            ),
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("AMAZON PRIME VIDEO"),
        // centerTitle: true,
        actions: [
          IconButton(
              onPressed: () async {
                await inAppWebViewController!.loadUrl(
                  urlRequest: URLRequest(
                    url: Uri.parse("https://www.primevideo.com/"),
                  ),
                );
              },
              icon: Icon(Icons.home)),
          IconButton(
              onPressed: () async {
                if (await inAppWebViewController!.canGoBack()) {
                  await inAppWebViewController!.goBack();
                }
              },
              icon: Icon(Icons.arrow_back_ios_new)),
          IconButton(
            icon: Icon(Icons.bookmarks_outlined),
            onPressed: () async {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: Center(
                    child: Text("All Bookmarks"),
                  ),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: addBookmark
                        .map(
                          (e) => GestureDetector(
                        child: Text(e),
                        onTap: () async {
                          Navigator.of(context).pop();
                          await inAppWebViewController!.loadUrl(
                            urlRequest: URLRequest(
                              url: Uri.parse(e),
                            ),
                          );
                        },
                      ),
                    )
                        .toList(),
                  ),
                ),
              );
            },
          ),
          IconButton(
              onPressed: () async {
                await inAppWebViewController!.reload();
              },
              icon: Icon(Icons.refresh)),
          IconButton(
              onPressed: () async {
                if (await inAppWebViewController!.canGoForward()) {
                  await inAppWebViewController!.goForward();
                }
              },
              icon: Icon(Icons.arrow_forward_ios)),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.bookmark_add_outlined),
        onPressed: () async {
          Uri? uri = await inAppWebViewController!.getUrl();

          addBookmark.add(uri!.toString());
        },
      ),
      body: InAppWebView(
        initialUrlRequest: URLRequest(
          url: Uri.parse("https://www.primevideo.com/"),
        ),
        onWebViewCreated: (val) {
          inAppWebViewController = val;
        },
        pullToRefreshController: pullToRefreshController,
        onLoadStop: (controller, uri) async {
          await pullToRefreshController.endRefreshing();
        },
      ),
    );
  }
}
