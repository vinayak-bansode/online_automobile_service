import 'dart:developer' as dev;
import 'dart:io';
import 'dart:math';
import 'dart:ui' as ui;

import 'package:carousel_slider/carousel_options.dart';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import 'package:path_provider/path_provider.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';

class CommonMethod {
  static captureCurrentScreenImage({
    required GlobalKey key,
    required String directory,
  }) async {
    final RenderRepaintBoundary boundary =
        key.currentContext!.findRenderObject() as RenderRepaintBoundary;
    final ui.Image image = await boundary.toImage(pixelRatio: 3.0);
    final ByteData? byteData =
        await (image.toByteData(format: ui.ImageByteFormat.png));

    final pngBytes = byteData!.buffer.asUint8List();
    File imgFile = File(directory);
    imgFile.writeAsBytesSync(pngBytes);
  }

  static String calculateCashback(
      {required String amount, required double cashback}) {
    final gotCashback = (double.parse(amount) / 100.0) * cashback.toInt();
    return gotCashback.toString();
  }

  static CarouselOptions carouselOptions(
      {int size = 160, Function(int, CarouselPageChangedReason)? onChanged}) {
    return CarouselOptions(
      height: size.h,
      aspectRatio: 16 / 9,
      viewportFraction: 1,
      initialPage: 0,
      enableInfiniteScroll: true,
      reverse: false,
      autoPlay: true,
      autoPlayInterval: Duration(seconds: 3),
      autoPlayAnimationDuration: Duration(milliseconds: 800),
      autoPlayCurve: Curves.fastOutSlowIn,
      enlargeCenterPage: true,
      scrollDirection: Axis.horizontal,
      onPageChanged: onChanged ?? (t, reason) {},
    );
  }

  static double roundDouble(double value, int places) {
    double mod = pow(10.0, places) as double;
    return ((value * mod).round().toDouble() / mod);
  }

  // static referLink({required String referCode, required String name}) {
  //   final DynamicLinkParameters parameters = DynamicLinkParameters(
  //     uriPrefix: BaseUrl.dynamicLink,
  //     link: Uri.https('MirrorInfo', 'refer', {"refercode": referCode}),
  //     androidParameters: androidParameters(),
  //     iosParameters: iosParameters(),
  //   );
  //   _shareInviteLink(parameters, referCode, name);
  // }

//   static _shareInviteLink(
//       DynamicLinkParameters parameters, String username, String name) async {
//     final _homeController = Get.find<HomeController>();

//     Uri url;
//     final ShortDynamicLink shortLink =
//         await FirebaseDynamicLinks.instance.buildShortLink(parameters);
//     url = shortLink.shortUrl;
//     final String _linkMessage = url.toString();
//     final String _message =
//         """ Hi, I just invited you to use the ${Constant.appName} app!
// Step1: Use my link to download the app
// Step2: Register using your mobile number and purchase Prime Membership
// Step3: Start making 24x7 instant recharges, bill payments, shopping, merchant payments, etc., and earn Assured Cashback on every transaction
// Mirror is 100% safe and secure.
// Download the app now. $_linkMessage
// Name - ${_homeController.userDataModelValue[0].firstName} ${_homeController.userDataModelValue[0].lastName}
// Number - ${_homeController.userDataModelValue[0].mobile}
// """;

//     final bytes = await rootBundle.load('assets/invite_earn3.png');
//     final list = bytes.buffer.asUint8List();

//     final tempDir = await getTemporaryDirectory();
//     final file = await File('${tempDir.path}/invite_earn3.png').create();
//     file.writeAsBytesSync(list);

//     await Share.shareFiles([file.path], text: _message);
//   }

  // static AndroidParameters androidParameters() {
  //   return const AndroidParameters(
  //     packageName: 'com.mirrorinfo',
  //   );
  // }

  // static IOSParameters iosParameters() {
  //   return const IOSParameters(
  //     bundleId: 'com.mirrorinfo',
  //     appStoreId: '1596096696',
  //   );
  // }

  static num getDiscount(num discount, num price) {
    return (price * discount) / 100;
  }

  // static doPayment(
  //     {required OrderGeneratorDataModel model,
  //     required BuildContext context,
  //     required String amount,
  //     required Function onRoute}) {
  //   String orderId = model.orderId!;
  //   String stage = model.stage!;
  //   String orderAmount = amount;
  //   String tokenData = model.cftoken!;
  //   String customerName = model.customerName!;
  //   String orderNote = "Add Money";
  //   String orderCurrency = "INR";
  //   String appId = model.appId!;
  //   String customerPhone = model.customerPhone!;
  //   String customerEmail = model.customerEmail!;
  //   String notifyUrl = "https://ebook.myedusoft.in/api/returnUrl";

  //   final inputParams = CashfreeModel(
  //       orderId: orderId,
  //       orderAmount: orderAmount,
  //       customerName: customerName,
  //       orderNote: orderNote,
  //       orderCurrency: orderCurrency,
  //       appId: appId,
  //       customerPhone: customerPhone,
  //       customerEmail: customerEmail,
  //       stage: stage,
  //       tokenData: tokenData,
  //       notifyUrl: notifyUrl);
  //   CashfreePGSDK.doPayment(inputParams.toJson()).then((value) {
  //     dev.log(value.toString());
  //     if (value != null) {
  //       if (value['txStatus'] == "SUCCESS") {
  //         onRoute();
  //       } else {
  //         Fluttertoast.showToast(msg: value['txStatus']);
  //       }
  //     }
  //   });
  // }

  static List<BoxShadow> glocyShadow({required Color color}) {
    final boxShadow = [
      BoxShadow(
        color: color,
        spreadRadius: 1,
        blurRadius: 8,
        offset: const Offset(4, 4),
      ),
      const BoxShadow(
        color: Colors.white,
        spreadRadius: 2,
        blurRadius: 8,
        offset: Offset(-4, -4),
      )
    ];
    return boxShadow;
  }

  static Future<void> whatsapp({required String mobileNumber}) async {
    String phoneNumber = '+91$mobileNumber';
    var whatsappUrl = "whatsapp://send?phone=$phoneNumber";

    bool isLaunch = await launch(whatsappUrl);
    if (!isLaunch) {
      Fluttertoast.showToast(msg: "You don't have whatsapp");
    }
  }

  static Future<void> call({required String number}) async {
    await launch("tel://$number");
  }
}
