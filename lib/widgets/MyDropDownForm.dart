import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDropdownFormField<T> extends StatefulWidget {
  final List<T> items;
  final String Function(T)? displayText;
  final void Function(T)? onSelected;
  final String labelText;

  MyDropdownFormField({
    required this.items,
    this.displayText,
    this.onSelected,
    required this.labelText,
  });

  @override
  _MyDropdownFormFieldState<T> createState() => _MyDropdownFormFieldState<T>();
}

class _MyDropdownFormFieldState<T> extends State<MyDropdownFormField<T>> {
  T? _selectedItem;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<T>(
      isExpanded: true,
      itemHeight: 60.0,
      menuMaxHeight: 500,
      value: _selectedItem != null ? _selectedItem : null,
      onChanged: (newValue) {
        setState(() {
          _selectedItem = newValue;
        });
        if (widget.onSelected != null) {
          widget.onSelected!(newValue!);
        }
      },
      decoration: InputDecoration(
        labelText: widget.labelText,
        filled: true,
        enabledBorder:InputBorder.none,
        focusedBorder: InputBorder.none,
        border: InputBorder.none,
        fillColor: Colors.white,
      ),
      items:


      widget.items.map((T item) {
        return DropdownMenuItem<T>(

          value:  item != null ? item : null,
          child: Text(widget.displayText?.call(item) ?? item.toString()),
        );
      }).toList(),
      validator: (value) {
        if (value == null) {
          return 'Please select an item';
        }
        return null;
      },
      onSaved: (value) {
        // Do something with the selected item
        print('Selected Item: $value');
      },
    );
  }
}






class MyDropdownFormFieldArea<T> extends StatefulWidget {
  final List<T> items;
  final String Function(T)? displayText;
  final void Function(T)? onSelected;
  final String labelText;

  MyDropdownFormFieldArea({
    required this.items,
    this.displayText,
    this.onSelected,
    required this.labelText,
  });

  @override
  _MyDropdownFormFieldStateArea<T> createState() => _MyDropdownFormFieldStateArea<T>();
}

class _MyDropdownFormFieldStateArea<T> extends State<MyDropdownFormFieldArea<T>> {
  T? _selectedItem;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<T>(
      isExpanded: true,
      itemHeight: 60.0,
      menuMaxHeight: 500,
      value: _selectedItem != null ? _selectedItem : null,
      onChanged: (newValue) {
        setState(() {
          _selectedItem = newValue;
        });
        if (widget.onSelected != null) {
          widget.onSelected!(newValue!);
        }
      },
      icon: Icon(Icons.keyboard_arrow_down_rounded,
          ),
      decoration: InputDecoration(
        labelText: widget.labelText,
        filled: true,
        enabledBorder:InputBorder.none,
        focusedBorder: InputBorder.none,
        border: InputBorder.none,
        fillColor: Colors.white,
      ),
      items:

      widget.items.map((T item) {
        return DropdownMenuItem<T>(

          value:  item != null ? item : null,
          child: Text(widget.displayText?.call(item) ?? item.toString(), overflow: TextOverflow.ellipsis,),
        );
      }).toList(),
      validator: (value) {
        if (value == null) {
          return 'Please select an item';
        }
        return null;
      },
      onSaved: (value) {
        // Do something with the selected item
        print('Selected Item: $value');
      },
    );
  }
}