import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:room_check/primary/utils/color.dart';

/// はい/いいえ が選択できるバージョン
Future showConfirmDialog(
  context, {
  required String title,
  required String content,
  required onApproved,
}) async {
  showDialog(
      context: context,
      // barrierDismissibleのbool値をtrueにすると、
      // ダイアログの外側を押した際にダイアログが出る前の画面に戻れるようになります。
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Container(
            // デバイスに応じて横幅(width)は調整してください。
            width: 311.0,
            decoration: BoxDecoration(
              border: Border.all(color: AppColor.primaryPurple, width: 3),
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Column(
              // mainAxisSize: MainAxisSize.min があることで、
              // Columnの子要素の縦幅に合わせて表示できます。
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Padding(
                    padding: const EdgeInsets.symmetric(vertical: 24.0),
                    child: Text(
                      title,
                      style: const TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    )),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Text(
                    content,
                    style: const TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                  ),
                ),
                const Gap(24.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        side: const BorderSide(
                          width: 1.0,
                          color: AppColor.primaryPurple,
                        ),
                        shadowColor: AppColor.primaryGrey,
                        // elevation で影の長さを指定
                        elevation: 5,
                        // primary でボタンの背景色を指定
                        backgroundColor: AppColor.primaryWhite,
                        // onPrimary でボタンないの文字の色を指定
                        foregroundColor: AppColor.primaryBlack,
                        // shape: const StadiumBorder() でボタンのサイドがまるくなります。
                        shape: const StadiumBorder(),
                      ),
                      onPressed: onApproved,
                      child: const Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 16, horizontal: 18),
                        child: Text('いいえ',
                             style: TextStyle(
                               fontSize: 16.0,
                               fontWeight: FontWeight.bold,
                             ),

                        ),
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shadowColor: Colors.grey,
                        elevation: 5,
                        backgroundColor: AppColor.primaryPurple,
                        foregroundColor: AppColor.primaryWhite,
                        shape: const StadiumBorder(),
                      ),
                      onPressed: () {
                        context.pop();
                      },
                      child: const Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 16, horizontal: 18),
                        child: Text('はい',
                        style: TextStyle(
                               fontSize: 16.0,
                               fontWeight: FontWeight.bold,
                             ),
                        ),
                      ),
                    ),
                  ],
                ),
                const Gap(24.0),
              ],
            ),
          ),
        );
      });
}
