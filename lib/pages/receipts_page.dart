import 'package:flutter/material.dart';

class ReceiptPage extends StatelessWidget {
  const ReceiptPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Receipt'),
      ),
      body: Center(
        child: Text('Receipt Page Content'),
      ),
    );
  }
}
