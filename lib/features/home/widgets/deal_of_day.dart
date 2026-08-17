import 'package:flutter/material.dart';

class DealOfDay extends StatefulWidget {
  const DealOfDay({super.key});

  @override
  State<DealOfDay> createState() => _DealOfDayState();
}

class _DealOfDayState extends State<DealOfDay> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.topLeft,
          padding: const EdgeInsets.only(left: 10, top: 15),
          child: const Text('Deal of the Day', style: TextStyle(fontSize: 20)),
        ),
        Image.network(
          "https://plus.unsplash.com/premium_photo-1664201889896-6a42c19e953a?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8N3x8b2ZmZXJzfGVufDB8fDB8fHww",
          height: 235,
          fit: BoxFit.fitHeight,
        ),

        Container(
          alignment: Alignment.topLeft,
          padding: const EdgeInsets.only(left: 15, top: 5, right: 40),
          child: const Text(
            '\$100',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontSize: 18),
          ),
        ),
        Container(
          padding: const EdgeInsets.only(left: 15),
          alignment: Alignment.topLeft,
          child: const Text(
            'Laptop',
            style: TextStyle(fontSize: 17),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.network(
                "https://media.istockphoto.com/id/2223144322/pt/foto/close-up-on-a-person-giving-a-gift-to-another-one.webp?a=1&b=1&s=612x612&w=0&k=20&c=33bp6F6y0fCG0xFXN5ZQJ6ADP1CYGzJBNnR3675uIMY=",
                fit: BoxFit.fitWidth,
                width: 100,
                height: 100,
              ),
              Image.network(
                "https://media.istockphoto.com/id/2223144322/pt/foto/close-up-on-a-person-giving-a-gift-to-another-one.webp?a=1&b=1&s=612x612&w=0&k=20&c=33bp6F6y0fCG0xFXN5ZQJ6ADP1CYGzJBNnR3675uIMY=",
                fit: BoxFit.fitWidth,
                width: 100,
                height: 100,
              ),
              Image.network(
                "https://media.istockphoto.com/id/2223144322/pt/foto/close-up-on-a-person-giving-a-gift-to-another-one.webp?a=1&b=1&s=612x612&w=0&k=20&c=33bp6F6y0fCG0xFXN5ZQJ6ADP1CYGzJBNnR3675uIMY=",
                fit: BoxFit.fitWidth,
                width: 100,
                height: 100,
              ),
              Image.network(
                "https://media.istockphoto.com/id/2223144322/pt/foto/close-up-on-a-person-giving-a-gift-to-another-one.webp?a=1&b=1&s=612x612&w=0&k=20&c=33bp6F6y0fCG0xFXN5ZQJ6ADP1CYGzJBNnR3675uIMY=",
                fit: BoxFit.fitWidth,
                width: 100,
                height: 100,
              ),
              Image.network(
                "https://media.istockphoto.com/id/2223144322/pt/foto/close-up-on-a-person-giving-a-gift-to-another-one.webp?a=1&b=1&s=612x612&w=0&k=20&c=33bp6F6y0fCG0xFXN5ZQJ6ADP1CYGzJBNnR3675uIMY=",
                fit: BoxFit.fitWidth,
                width: 100,
                height: 100,
              ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 15).copyWith(left: 15),
          alignment: Alignment.topLeft,
          child: Text(
            'See all deals',
            style: TextStyle(color: Colors.cyan[800]),
          ),
        ),
      ],
    );
  }
}
