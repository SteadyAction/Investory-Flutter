import 'package:investory/extension/text_style_extension.dart';
import 'package:investory/property/app_color.dart';
import 'package:flutter/cupertino.dart';

class BottomSheetView extends StatelessWidget {
  final String title;
  final String message;
  final Function onClose; 

  const BottomSheetView(this.title, this.message, this.onClose, {Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColor.primaryBackground, 
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: SafeArea(
        child: Wrap(
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.all(20),
                  child: Text(
                    title,
                    style: const TextStyle(fontSize: 19, fontWeight: FontWeight.w700, color: AppColor.primaryText).withDefault,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 5, left: 20, right: 15, bottom: 10),
                  child: Text(
                    message,
                    style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: AppColor.tertiaryText).withDefault,
                  ),
                ),
                Container(
                  width:  double.infinity,
                  margin: const EdgeInsets.only(top: 30, bottom: 15, left: 15, right: 15),
                  child: CupertinoButton(
                    color: AppColor.blue3,
                    borderRadius: const BorderRadius.all(Radius.circular(35)),  
                    child: Text("Confirm", style: const TextStyle(color: AppColor.primaryText, fontSize: 14, fontWeight: FontWeight.w600).withDefault),
                    onPressed: () { 
                      Navigator.pop(context);
                      onClose();
                    },
                  ),
                  
                )
              ],
            )
          ]
        )
      )
    );
  }
}
