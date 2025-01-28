import 'package:chatin/themes/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChatBubble extends StatelessWidget {
  final String message;
  final bool isCurrentUser;

  const ChatBubble({
    super.key,
    required this.message,
    required this.isCurrentUser,
  });

  @override
  Widget build(BuildContext context) {
    // light vs dark mode for correct bubble colors
    bool isDarkMode =
        Provider.of<ThemeProvider>(context, listen: false).isDarkMode;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 2.5),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        // ? (isDarkMode ? Colors.green : Colors.lightGreen)
        color: isCurrentUser
            ? Colors.lightGreen
            : (isDarkMode ? Colors.grey.shade800 : Colors.grey.shade200),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        message,
        style: isCurrentUser
            ? TextStyle(color: Colors.white)
            : TextStyle(color: isDarkMode ? Colors.white : Colors.black),
        // style: TextStyle(color: isCurrentUser ? Colors.white : Colors.black),
      ),
    );
  }
}
