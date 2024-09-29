import 'package:flutter/material.dart';
import 'package:cyber_safe/core/utils.dart';

class ItemCoppyValue extends StatefulWidget {
  final bool isLastItem;
  final String title;
  final String value;
  final bool isPrivateValue;
  const ItemCoppyValue(
      {super.key,
      this.isLastItem = false,
      required this.title,
      required this.value,
      this.isPrivateValue = false});

  @override
  State<ItemCoppyValue> createState() => _ItemCoppyValueState();
}

class _ItemCoppyValueState extends State<ItemCoppyValue> {
  bool _isShowValue = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: !widget.isLastItem ? EdgeInsets.only(bottom: 10.h) : null,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondaryContainer,
        border: !widget.isLastItem
            ? Border(
                bottom: BorderSide(
                    color:
                        Theme.of(context).colorScheme.surfaceContainerHighest))
            : null,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.title,
                    style: TextStyle(
                        color: Colors.grey,
                        overflow: TextOverflow.ellipsis,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500)),
                Text(
                  widget.isPrivateValue
                      ? (_isShowValue
                          ? widget.value == ""
                              ? ""
                              : decryptPassword(widget.value)
                          : "************")
                      : widget.value,
                  style: TextStyle(
                      fontSize: 14.sp, overflow: TextOverflow.ellipsis),
                ),
              ],
            ),
          ),
          Row(
            children: [
              if (widget.isPrivateValue)
                IconButton(
                  onPressed: () {
                    setState(() {
                      _isShowValue = !_isShowValue;
                    });
                  },
                  icon: _isShowValue
                      ? Icon(Icons.visibility_off,
                          size: 24.sp,
                          color: Theme.of(context).colorScheme.primary)
                      : Icon(
                          Icons.visibility,
                          size: 24.sp,
                        ),
                ),
              widget.value != ""
                  ? IconButton(
                      onPressed: () {
                        clipboardCustom(
                            context: context,
                            text: widget.isPrivateValue
                                ? decryptPassword(widget.value)
                                : widget.value);
                      },
                      icon: Icon(Icons.copy, size: 20.sp))
                  : const SizedBox.shrink()
            ],
          )
        ],
      ),
    );
  }
}
