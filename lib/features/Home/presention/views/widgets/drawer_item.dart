import 'package:flutter/material.dart';


class DrawerItem extends StatelessWidget {
  const DrawerItem({super.key, required this.icon, required this.text, this.ontab});
final IconData icon;
final String text;
 final void Function()?ontab;
  @override
  Widget build(BuildContext context) {
    return  InkWell(
      onTap: ontab,
      child:  Row(
        children: [
          Icon(icon,color:  const Color(0xFF9094A0)),
          const SizedBox(width: 12),
          Text(
            text,
            style: const TextStyle(
              color: Color(0xFF9094A0),
              fontSize: 14,
              fontFamily: 'Kumbh Sans',
              fontWeight: FontWeight.w600,
              height: 0,
            ),
          ),
        ],
      ),
    );
  }
}
