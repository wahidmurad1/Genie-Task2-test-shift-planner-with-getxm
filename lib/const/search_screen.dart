//import 'dart:ui';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  final ValueChanged<String>? onSubmit;
  final TextEditingController searchTextController;
  final IconData? icon;
  final VoidCallback onPressed;
  final isIconVisible;
  final ValueChanged<String> onChanged;
  const SearchScreen({
    Key? key,
    this.onSubmit,
    required this.searchTextController,
    this.icon,
    required this.onChanged,
    this.isIconVisible,
    required this.onPressed,
  }) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  // late final TextEditingController _searchTextController;
  // late final FocusNode focusNode;
  int tag = 0;

  bool isSearching = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.75,
        height: 40,
        decoration: BoxDecoration(
          border: Border.all(width: 1, color: Color(0XFFD1D5DB)),
        ),
        child: TextField(
          onSubmitted: widget.onSubmit,
          // focusNode: focusNode,
          controller: widget.searchTextController,

          style: TextStyle(color: Colors.black),
          autofocus: true,
          textInputAction: TextInputAction.search,
          keyboardType: TextInputType.text,
          onEditingComplete: () async {
            isSearching = true;
            // focusNode.unfocus();
            setState(() {});
          },
          onChanged: widget.onChanged,
          decoration: InputDecoration(
            //contentPadding: EdgeInsets.only(top: 8, bottom: 12),
            // enabledBorder: OutlineInputBorder.none,
            hintText: "Search",
            contentPadding: EdgeInsets.fromLTRB(
              12,
              6,
              10,
              12,
            ),
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            prefixIcon: Icon(
              Icons.search,
            ),
            suffixIcon: !widget.isIconVisible
                ? null
                : IconButton(
                    onPressed: widget.onPressed,
                    icon: Icon(
                      widget.icon,
                      size: 18,
                      color: Colors.black,
                    ),
                  ),
          ),
          textAlign: TextAlign.start,
        ),
      ),
    );
  
  }
}
