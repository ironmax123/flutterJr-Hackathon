import 'package:barcode_scan2/platform_wrapper.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

String readData = "";

Future scan(ValueNotifier readData, ValueNotifier typeData) async {
  try {
    var scan = await BarcodeScanner.scan();
    readData.value = scan.rawContent;
    typeData.value = scan.format.name;
  } on PlatformException catch (e) {
    if (e.code == BarcodeScanner.cameraAccessDenied) {
      readData.value = 'Camera permissions are not valid.';
    } else {
      readData.value = 'Unexplained error : $e';
    }
  } on FormatException {
    readData.value =
        'Failed to read (I used the back button before starting the scan).';
  } catch (e) {
    readData.value = 'Unknown error : $e';
  }
  return readData.value;
}
