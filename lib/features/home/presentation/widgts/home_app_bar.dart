import 'package:flutter/material.dart';

AppBar homeAppBar() {
  return AppBar(
    backgroundColor: Colors.white,
    elevation: 0,
    title: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Delivering to",
          style: TextStyle(color: Colors.grey[600], fontSize: 12),
        ),
        Row(
          children: [
            Text(
              "Home, Cairo",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            Icon(Icons.keyboard_arrow_down, color: Colors.orange),
          ],
        ),
      ],
    ),
    actions: [
      IconButton(
        onPressed: () {},
        icon: Icon(Icons.notifications_outlined, color: Colors.black),
      ),
    ],
  );
}
