import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          IconButton(
                            onPressed: () {},
                            padding: EdgeInsets.zero,
                            constraints: const BoxConstraints(),
                            icon: Icon(
                              Icons.arrow_left,
                              color: Colors.yellowAccent,
                              size: 20,
                            ),
                          ),
                          Text(
                            'Favorites',
                            style: GoogleFonts.poppins(
                              fontSize: 20,
                              fontWeight: FontWeight(800),
                              color: Colors.deepPurple,
                            ),
                          ),
                        ],
                      ),
                    ),
                    
                    Expanded(
                      child: Row(
                        children: [
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
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
