import 'package:investory/extension/text_style_extension.dart';
import 'package:investory/property/app_color.dart';
import 'package:flutter/material.dart';
import 'package:investory/widget/app_button.dart';

class ActionBottomSheetItem {
  String name;
  AssetImage? image;
  Function onSelected;
  double imageSize;
  bool isSelected;

  ActionBottomSheetItem(this.name, this.image, this.onSelected, {this.imageSize=15, this.isSelected=false});
}

class ActionBottomSheetView extends StatelessWidget {
  final List<ActionBottomSheetItem> items;
  final Color? color;

  const ActionBottomSheetView(this.items, {Key? key, this.color}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color ?? AppColor.secondaryBackground, 
        borderRadius: const BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
      ),
      child: SafeArea(
        child: Wrap(
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: itemViews(context),
            )
          ]
        )
      )
    );
  }

  List<Widget> itemViews(BuildContext context) {
    List<Widget> views = [const SizedBox(height: 10)];
    for (final item in items) {
      views.add(
        AppButton(
          backgroundColor: AppColor.clear,
          height: null,
          child: Padding(
            padding: const EdgeInsets.only(left: 10, right: 10, top: 12, bottom: 12),
            child: Row(
              children: [
              (item.image == null 
                ? Container() 
                : Container(
                  padding: const EdgeInsets.only(left: 5), 
                  width: 30,
                  child: ImageIcon(
                    item.image, 
                    color: item.isSelected ? AppColor.blue3 : AppColor.primaryText,
                    size: item.imageSize
                  ))
                ),
              const SizedBox(width: 15,),
              Text(item.name, 
                style: TextStyle(
                  fontSize: 14, 
                  fontWeight: item.isSelected ? FontWeight.w600 : FontWeight.w500, 
                  color: item.isSelected ? AppColor.blue3 : AppColor.primaryText
                ).withDefault
              ),
            ])
          ),
          onTapped: () {
            Navigator.pop(context);
            item.onSelected();
          },
        )
      );
    }

    views.add(const SizedBox(height: 10));

    return views;
  }
}

