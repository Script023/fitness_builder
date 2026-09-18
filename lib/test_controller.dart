import 'package:flutter/material.dart';

class ScrollExampleScreen extends StatefulWidget {
  const ScrollExampleScreen({super.key});

  @override
  State<ScrollExampleScreen> createState() => _ScrollExampleScreenState();
}

class _ScrollExampleScreenState extends State<ScrollExampleScreen> {
  // 1. Initialize the ScrollController
  final ScrollController _scrollController = ScrollController();
  final List<int> _items = List.generate(20, (index) => index);
  bool _showBackToTop = false;

  @override
  void initState() {
    super.initState();
    // 2. Add a listener to monitor scroll changes
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    // Capability A: Show/Hide "Scroll to Top" button based on offset
    if (_scrollController.offset > 300 && !_showBackToTop) {
      setState(() => _showBackToTop = true);
    } else if (_scrollController.offset <= 300 && _showBackToTop) {
      setState(() => _showBackToTop = false);
    }

    // Capability B: Infinite Scrolling (Detect when user reaches the bottom)
    // maxScrollExtent is the maximum scrollable height available
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      _loadMoreItems();
    }
  }

  void _loadMoreItems() {
    setState(() {
      int currentLength = _items.length;
      _items.addAll(List.generate(20, (index) => currentLength + index));
    });
  }

  // Capability C: Animate back to the beginning
  void _scrollToTop() {
    _scrollController.animateTo(
      0.0, // Target position (0 means top)
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    // 3. Always dispose your controller to prevent memory leaks
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ScrollController Demo')),
      body: ListView.builder(
        controller: _scrollController, // 4. Attach it to your ListView
        itemCount: _items.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(child: Text('${_items[index]}')),
            title: Text('Item Number ${_items[index]}'),
          );
        },
      ),
      floatingActionButton: _showBackToTop
          ? FloatingActionButton(
              onPressed: _scrollToTop,
              child: const Icon(Icons.arrow_upward),
            )
          : null,
    );
  }
}
