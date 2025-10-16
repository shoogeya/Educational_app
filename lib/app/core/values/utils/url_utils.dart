// ignore_for_file: depend_on_referenced_packages, unnecessary_null_comparison

import 'dart:async';
import 'package:masar/app/sharedWidgets/loading.widget.dart';
import 'package:masar/app_Imports.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'dart:io';
import 'package:http/http.dart' as http;
import '../../../sharedWidgets/attention_dialog.widget.dart';
import '../../extentions/app_extention.dart';

class UrlUtils {
  static launchEmail({String? emailValue}) {
    Get.dialog(
      AttentionDialog(
        description: "الضغط على زر التأكيد سيؤدي إلى مغادرتك لهذا التطبيق . هل ترغب في الاستمرار؟",
        cancelText: "إلغاء",
        onCancel: () {
          Get.back();
        },
        onTap: () {
          Get.back();
          launchUrl(
            Uri.parse(emailValue ?? "mailto:contactus@eureeca.com"),
          );
        },
      ),
    );
  }

  static openUrl(String url) async {
    if (url.contains("@")) {
      launchEmail(emailValue: url);

      return;
    } else if (UrlTypes.isCustomUrl(url)) {
      Get.dialog(
        AttentionDialog(
          description: "open_external_url".tr,
          cancelText: "cancel".tr,
          onCancel: () {
            Get.back();
          },
          onTap: () {
            Get.back();
            if (url.contains("http") == true || url.contains("https") == true) {
              launchUrl(
                Uri.parse(url),
                mode: LaunchMode.externalApplication,
              );
            } else if (url.contains(".com") == true &&
                url.contains("http") == false ||
                url.contains("https") == false) {
              if (url.contains("www.") == true) {
                String modifiedString = "https://$url";
                launchUrl(
                  Uri.parse(modifiedString),
                  mode: LaunchMode.externalApplication,
                );
              } else {
                String modifiedString = "https://www.$url";
                launchUrl(
                  Uri.parse(modifiedString),
                  mode: LaunchMode.externalApplication,
                );
              }
            } else {
              Get.back();
              showError('error_message'.tr);
            }
          },
        ),
      );
    } else if (url.contains('.pdf')) {
      Get.dialog(
        Dialog(
          insetPadding: EdgeInsets.symmetric(
            horizontal: 15.w,
            vertical: 10.h,
          ),
          backgroundColor: Colors.white,
          surfaceTintColor: Colors.white,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: PDFViewer(
            url: url,
          ),
        ),
      );
    } else {
      Get.dialog(
        Dialog(
          insetPadding: EdgeInsets.symmetric(
            horizontal: 15.w,
            vertical: 10.h,
          ),
          backgroundColor: Colors.white,
          surfaceTintColor: Colors.white,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: PDFViewer(
            url: url,
          ),
        ),
      );
    }
  }
}

// void launchCustomURL(String url) async {
//   if (await canLaunchUrl(Uri.parse(url))) {
//     await launchUrl(Uri.parse(url));
//   } else {
//     throw 'Could not launch $url';
//   }
// }

class PDFViewer extends StatefulWidget {
  final String url;

  const PDFViewer({
    required this.url,
    super.key,
  });

  @override
  PDFViewerState createState() => PDFViewerState();
}

class PDFViewerState extends State<PDFViewer> {
  String urlPDFPath = "";
  bool exists = true;
  bool pdfReady = false;
  bool loaded = false;

  Future<File> getFileFromUrl(String url, {name}) async {
    var fileName = 'testonline';
    if (name != null) {
      fileName = name;
    }
    try {
      var data = await http.get(
        Uri.parse(
          widget.url,
        ),
      );
      var bytes = data.bodyBytes;
      var dir = await getApplicationDocumentsDirectory();
      String endPath =
      widget.url.contains(UrlTypes.pdf) ? UrlTypes.pdf : 'xlsx';
      File file = File("${dir.path}/$fileName.$endPath");

      File urlFile = await file.writeAsBytes(bytes);

      return urlFile;
    } catch (e) {
      showError(
        "doc_error_message".tr,
      );
      throw Exception("Error opening url file");
    }
  }

  @override
  void initState() {
    getFileFromUrl(
      widget.url,
    ).then(
          (value) => {
        setState(() {
          if (value != null) {
            urlPDFPath = value.path;
            loaded = true;
            exists = true;
          } else {
            exists = false;
          }
        })
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (loaded) {
      return Scaffold(
        body: Stack(
          children: [
            PDFView(
              pageFling: true,
              preventLinkNavigation: true,
              fitPolicy: FitPolicy.BOTH,
              fitEachPage: true,
              filePath: urlPDFPath,
              // autoSpacing: false,
              enableSwipe: true,
              pageSnap: true,
              swipeHorizontal: false,
              nightMode: false,
              onError: (e) {
                //Show some error message or UI
                Get.back();
                showError(
                  "doc_error_message".tr,
                );
              },
              onRender: (pages) {
                setState(() {
                  pdfReady = true;
                });
              },
              onPageError: (page, e) {},
            ),
            Positioned(
              top: 0,
              right: 0,
              child: IconButton(
                icon: Icon(
                  Icons.cancel,
                  color: Colors.grey.shade600,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ],
        ),
      );
    } else {
      if (exists) {
        return Scaffold(
          body: Stack(
            children: [
              LoadingWidget(),
              Positioned(
                top: 0,
                right: 0,
                child: IconButton(
                  icon: Icon(
                    Icons.cancel,
                    color: Colors.grey.shade600,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            ],
          ),
        );
      } else {
        Get.back();
        showError(
          "doc_error_message".tr,
        );
        //Replace Error UI
        return const Scaffold();
      }
    }
  }

  void onLaunchPage() async {
    try {
      // print(widget.pdfUrl);
      // await _downloadFile();
    } catch (e) {

      Get.back();
      showError(
        "doc_error_message".tr,
      );
    }
  }
}


class UrlTypes {
  static const String png = "png";
  static const String pdf = "pdf";
  static const String jpg = "jpg";
  static const String xlsx = "xlsx";
  static const String xls = "xls";

  static List<String> nonCustomurlTypes = [
    UrlTypes.jpg,
    UrlTypes.pdf,
    UrlTypes.png,
    UrlTypes.xls,
    UrlTypes.xlsx,
  ];

  static bool isCustomUrl(String url) {
    bool toReturn = true;

    for (var element in nonCustomurlTypes) {
      if (url.contains(element)) {
        toReturn = false;
      }
    }

    return toReturn;
  }
}


