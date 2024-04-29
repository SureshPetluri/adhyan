import 'package:flutter/material.dart';

class CustomDropdown extends StatefulWidget {
  final List<String> items;
  final String hintText;

  CustomDropdown({required this.items, required this.hintText});

  @override
  _CustomDropdownState createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  OverlayEntry? _overlayEntry;
  String? _selectedItem;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (_overlayEntry == null) {
          _openDropdown(context);
        } else {
          _closeDropdown();
        }
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          _selectedItem ?? widget.hintText,
          style: TextStyle(color: Colors.black),
        ),
      ),
    );
  }

  void _openDropdown(BuildContext context) {
    final renderBox = context.findRenderObject() as RenderBox;
    final offset = renderBox.localToGlobal(Offset.zero);
    final size = renderBox.size;

    _overlayEntry = _createOverlayEntry(offset, size, context);
    Overlay.of(context).insert(_overlayEntry!);
  }

  void _closeDropdown() {
    if (_overlayEntry != null) {
      _overlayEntry!.remove();
      _overlayEntry = null;
    }
  }

  OverlayEntry _createOverlayEntry(Offset offset, Size size, BuildContext context) {
    final availableHeightBelow = MediaQuery.of(context).size.height - offset.dy - size.height;
    final dropdownHeight = widget.items.length * 40.0;
    final shouldOpenUp = dropdownHeight > availableHeightBelow;

    final topPosition = shouldOpenUp ? offset.dy - dropdownHeight : offset.dy + size.height;

    return OverlayEntry(
      builder: (context) {
        return Positioned(
          top: topPosition,
          left: offset.dx,
          child: Material(
            elevation: 4,
            child: Container(
              width: size.width,
              constraints: BoxConstraints(maxHeight: 200),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.white,
              ),
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: widget.items.length,
                itemBuilder: (context, index) {
                  final item = widget.items[index];
                  return InkWell(
                    onTap: () {
                      setState(() {
                        _selectedItem = item;
                        _closeDropdown();
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.all(8),
                      child: Text(item),
                    ),
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
