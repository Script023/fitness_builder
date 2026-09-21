import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fitness_builder/providers/user_provider.dart';

class HeaderWidget extends ConsumerWidget {
  const HeaderWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userProvider).user;

    print('HOME USER: $user');
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Text(
                        'Hi, ${user?.nickname ?? 'User'}',
                        style: GoogleFonts.poppins(
                          fontSize: 20,
                          fontWeight: FontWeight.w800,
                          color: const Color(0xFF896CFE),
                        ),
                      ),
                    ),
                  ),

                  IconButton(
                    constraints: const BoxConstraints(),
                    onPressed: () {},
                    icon: Icon(
                      Icons.search,
                      color: const Color(0xFF896CFE),
                      size: 20,
                    ),
                  ),

                  // notifications icon
                  IconButton(
                    onPressed: () {},
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                    icon: Icon(
                      Icons.notifications,
                      color: const Color(0xFF896CFE),
                      size: 20,
                    ),
                  ),

                  //person icon
                  IconButton(
                    constraints: const BoxConstraints(),
                    padding: EdgeInsets.zero,
                    onPressed: () {},
                    icon: Icon(
                      Icons.person,
                      color: const Color(0xFF896CFE),
                      size: 20,
                    ),
                  ),
                ],
              ),

              Padding(
                padding: EdgeInsetsGeometry.only(left: 10.0),
                child: Text(
                  "its's time to challenge your limits.",
                  style: GoogleFonts.leagueSpartan(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),

        // search icon
      ],
    );
  }
}
