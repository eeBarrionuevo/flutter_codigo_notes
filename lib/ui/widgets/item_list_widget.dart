

import 'package:flutter/material.dart';

class ItemListWidget extends StatelessWidget {
  const ItemListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 14.0, horizontal: 12.0),
      margin: const EdgeInsets.symmetric(vertical: 12.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          const BoxShadow(
            color: Colors.white,
            offset: Offset(5, -5),
            blurRadius: 10.0,
          ),
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            offset: const Offset(4, 4),
            blurRadius: 12.0,
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundColor: Colors.indigo,
                child: Icon(
                  Icons.notifications_none,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                width: 12.0,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xff323334).withOpacity(0.90),
                      ),
                    ),
                    const SizedBox(
                      height: 4.0,
                    ),
                    Text(
                      "25 de Sep, 2:42 PM",
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        color: Color(0xff323334).withOpacity(0.85),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 6.0,
          ),
          Divider(
            indent: 12.0,
            endIndent: 12.0,
          ),
          const SizedBox(
            height: 6.0,
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.network(
              "https://images.pexels.com/photos/12315477/pexels-photo-12315477.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          Text(
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              height: 1.5,
              fontWeight: FontWeight.normal,
              color: Color(0xff323334).withOpacity(0.90),
            ),
          ),
        ],
      ),
    );
  }
}
