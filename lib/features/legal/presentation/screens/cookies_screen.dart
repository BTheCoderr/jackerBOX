import 'package:flutter/material.dart';
import '../widgets/legal_document_template.dart';

class CookiesScreen extends StatelessWidget {
  const CookiesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cookie Policy'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const LegalSection(
              title: '1. Introduction',
              children: [
                LegalParagraph(
                  text: 'This Cookie Policy explains how Jackerbox uses cookies and similar tracking technologies to provide, improve, and protect our services.',
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