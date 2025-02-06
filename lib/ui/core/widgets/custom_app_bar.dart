import 'package:flutter/material.dart';
import 'lowercase_text.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      child: SafeArea(
        bottom: false, // Para a borda arredondada ficar visível
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Primeira linha
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.menu_open, color: Colors.white),
                    onPressed: () {},
                  ),
                  Expanded(
                    child: Center(
                      child: Container(
                        width: MediaQuery.of(context).size.width *
                            0.6, // 75% da largura da tela
                        decoration: BoxDecoration(
                          color: Colors.red[700],
                          borderRadius: BorderRadius.circular(20),
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 2.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            _buildOption('ir agora', true, Icons.flash_on),
                            _buildOption(
                                'ir outro dia', false, Icons.event_available),
                          ],
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.search, color: Colors.white),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            // Segunda linha
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const LowercaseText(
                      'minha localização',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(width: 4),
                    Icon(
                      Icons.keyboard_arrow_down,
                      color: Colors.white.withAlpha(200),
                      size: 20,
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Container(
                  height: 1,
                  margin: const EdgeInsets.symmetric(horizontal: 130),
                  child: Row(
                    children: List.generate(
                      80,
                      (index) => Expanded(
                        child: Container(
                          height: 1,
                          color: index.isEven
                              ? Colors.white.withAlpha(100)
                              : Colors.transparent,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 8),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOption(String text, bool isSelected, IconData icon) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      decoration: BoxDecoration(
        color: isSelected ? Colors.white : null,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: isSelected ? Colors.red : Colors.white,
            size: 16,
          ),
          const SizedBox(width: 4),
          LowercaseText(
            text,
            style: TextStyle(
              color: isSelected ? Colors.black : Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(100);
}
