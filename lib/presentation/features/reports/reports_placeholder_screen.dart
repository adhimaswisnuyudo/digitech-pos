import 'package:flutter/material.dart';

class ReportsPlaceholderScreen extends StatelessWidget {
  const ReportsPlaceholderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Laporan')),
      body: const Center(child: Text('Placeholder — laporan harian')),
    );
  }
}
