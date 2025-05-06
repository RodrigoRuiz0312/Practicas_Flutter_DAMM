import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Cubo Rubik Animado', style: TextStyle()),
          centerTitle: true,
        ),
        body: const Center(child: RubikCube()),
      ),
    );
  }
}

class RubikCube extends StatefulWidget {
  const RubikCube({super.key});

  @override
  State<RubikCube> createState() => _RubikCubeState();
}

class _RubikCubeState extends State<RubikCube>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _rotationAnimation;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    )..repeat(reverse: true);

    _rotationAnimation = Tween<double>(
      begin: 0,
      end: 0.1,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    _scaleAnimation = Tween<double>(
      begin: 0.95,
      end: 1.05,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Transform(
          transform:
              Matrix4.identity()
                ..rotateX(_rotationAnimation.value)
                ..rotateY(_rotationAnimation.value * 1.5),
          alignment: Alignment.center,
          child: Transform.scale(
            scale: _scaleAnimation.value,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _buildAnimatedRow([Colors.green, Colors.blue, Colors.white]),
                _buildAnimatedRow([Colors.blue, Colors.orange, Colors.red]),
                _buildAnimatedRow([Colors.yellow, Colors.white, Colors.blue]),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildAnimatedRow(List<Color> colors) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children:
          colors.map((color) {
            return Padding(
              padding: const EdgeInsets.all(4),
              child: _AnimatedCubeTile(color: color),
            );
          }).toList(),
    );
  }
}

class _AnimatedCubeTile extends StatefulWidget {
  final Color color;

  const _AnimatedCubeTile({required this.color});

  @override
  State<_AnimatedCubeTile> createState() => _AnimatedCubeTileState();
}

class _AnimatedCubeTileState extends State<_AnimatedCubeTile> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOutBack,
        decoration: BoxDecoration(
          color: widget.color,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.black.withOpacity(0.5), width: 2),
          boxShadow:
              _isHovered
                  ? [
                    BoxShadow(
                      color: widget.color.withOpacity(0.7),
                      offset: const Offset(0, 3),
                    ),
                  ]
                  : null,
        ),
        height: 80,
        width: 80,
        transform:
            _isHovered
                ? (Matrix4.rotationZ(0.1)..translate(-2.0, -2.0))
                : Matrix4.identity(),
        transformAlignment: Alignment.center,
      ),
    );
  }
}
