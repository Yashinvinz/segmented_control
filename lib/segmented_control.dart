library segmented_control;

import 'package:flutter/material.dart';

class SegmentedControl extends StatefulWidget {
  final int segmentCount;
  final double? height;
  Color? segmentColor;
  Color? textColor;
  final Color? borderColor;
  final double? borderRadius;
  final List<String> segmentText;
  Function(int) onSelected;
  Color? selectedSegmentColor;
  Color? selectedTextColor;

  SegmentedControl(
      {Key? key,
      required this.segmentCount,
      required this.segmentText,
      required this.onSelected,
      this.selectedTextColor = Colors.white,
      this.selectedSegmentColor = Colors.blue,
      this.height = 50,
      this.segmentColor = Colors.transparent,
      this.borderColor = Colors.black,
      this.borderRadius = 10,
      this.textColor = Colors.grey})
      : super(key: key);

  @override
  State<SegmentedControl> createState() => _SegmentedControlState();
}

class _SegmentedControlState extends State<SegmentedControl> {
  int _selectedIndex = 0;
  void onSegmentTapped(int index) {
    setState(
      () {
        _selectedIndex = index;
        widget.onSelected(index);
      },
    );
  }

  Color getSegmentColor(int index) {
    if (_selectedIndex == index) {
      return widget.selectedSegmentColor!;
    }
    return widget.segmentColor!;
  }

  Color getSegmentTextColor(int index) {
    if (_selectedIndex == index) {
      return widget.selectedTextColor!;
    }
    return widget.textColor!;
  }

  BorderRadiusGeometry getBorderRadius(int index) {
    if (index == 0) {
      return BorderRadius.only(
        topLeft: Radius.circular(widget.borderRadius! - 2),
        bottomLeft: Radius.circular(widget.borderRadius! - 2),
      );
    } else if (index == widget.segmentCount - 1) {
      return BorderRadius.only(
        topRight: Radius.circular(widget.borderRadius! - 2),
        bottomRight: Radius.circular(widget.borderRadius! - 2),
      );
    }
    return BorderRadius.circular(0);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(width: 2, color: widget.borderColor!),
          bottom: BorderSide(width: 2, color: widget.borderColor!),
          left: BorderSide(width: 2, color: widget.borderColor!),
          right: BorderSide(width: 2, color: widget.borderColor!),
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(widget.borderRadius!),
        ),
      ),
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: widget.segmentCount,
        itemBuilder: (context, index) => GestureDetector(
          onTap: () => onSegmentTapped(index),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: getBorderRadius(index),
              color: getSegmentColor(index),
            ),
            padding: const EdgeInsets.all(8),
            child: Center(
              child: Text(
                widget.segmentText[index],
                style: TextStyle(color: getSegmentTextColor(index)),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
