import 'package:flutter/material.dart';

class SearchField extends StatefulWidget {
  const SearchField({Key? key}) : super(key: key);

  @override
  State<SearchField> createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  @override
  Widget build(BuildContext context) {
    return TextField(

      decoration: InputDecoration(
          hintText: 'Search',
          prefixIcon: const Icon(Icons.search_rounded,color: Colors.black,),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8),borderSide: BorderSide.none),
          filled: true,
          fillColor: Theme.of(context).cardColor),
    );
  }
}
