import 'package:flutter/material.dart';
import '../widgets/legal_document_template.dart';

class CopyrightScreen extends StatelessWidget {
  const CopyrightScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Copyright Policy'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const LegalSection(
              title: '1. Introduction',
              children: [
                LegalParagraph(
                  text: 'This Copyright Policy outlines how Jackerbox protects intellectual property rights and handles copyright-related matters on our platform.',
                ),
              ],
            ),
            // Add more sections as needed
          ],
        ),
      ),
    );
  }
} 