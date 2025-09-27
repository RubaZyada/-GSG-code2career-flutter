import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  int _counter = 0;
  String counterKey = 'counter';

  @override
  void initState() {
    super.initState();
    readCounter();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text('My Counter'),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        // خلفية متدرجة أنيقة
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF141E30), Color(0xFF243B55)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Card(
              color: Colors.white.withOpacity(0.08),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(28),
                side: BorderSide(color: Colors.white.withOpacity(0.15)),
              ),
              elevation: 20,
              shadowColor: Colors.black.withOpacity(0.35),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(22, 30, 22, 26),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // عنوان
                    Text(
                      'Counter',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            color: Colors.white.withOpacity(0.9),
                            fontWeight: FontWeight.w600,
                            letterSpacing: 0.5,
                          ),
                    ),
                    const SizedBox(height: 12),

                    // الرقم مع أنيميشن لطيف
                    AnimatedSwitcher(
                      duration: const Duration(milliseconds: 220),
                      transitionBuilder: (child, anim) => ScaleTransition(
                        scale: CurvedAnimation(
                          parent: anim,
                          curve: Curves.easeOutBack,
                        ),
                        child: child,
                      ),
                      child: Text(
                        _counter.toString(),
                        key: ValueKey(_counter),
                        style: const TextStyle(
                          fontSize: 76,
                          fontWeight: FontWeight.w800,
                          color: Colors.white,
                          height: 1.0,
                        ),
                      ),
                    ),
                    const SizedBox(height: 18),

                    // الأزرار بنفس منطقك (بدون تغيير على onPressed)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _RoundButton(
                          icon: Icons.remove,
                          onPressed: () {
                            setState(() {
                              _counter--;
                              saveCounter(_counter);
                            });
                          },
                        ),
                        const SizedBox(width: 18),
                        _PillBadge(value: _counter),
                        const SizedBox(width: 18),
                        _RoundButton(
                          icon: Icons.add,
                          onPressed: () {
                            setState(() {
                              _counter++;
                              saveCounter(_counter);
                            });
                          },
                        ),
                      ],
                    ),

                    const SizedBox(height: 10),
                    Text(
                      'Tip: + or - to change',
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall
                          ?.copyWith(color: Colors.white70),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  saveCounter(int counter) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setInt(counterKey, counter);
    // كل ما تزود او تنقص العداد اعمل حفظ
  }

  readCounter() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _counter = prefs.getInt(counterKey) ?? 0;
    });
  }
}

/* ====== Widgets جمالية فقط (لا تغيّر المنطق) ====== */

class _RoundButton extends StatefulWidget {
  final IconData icon;
  final VoidCallback onPressed;
  const _RoundButton({required this.icon, required this.onPressed});

  @override
  State<_RoundButton> createState() => _RoundButtonState();
}

class _RoundButtonState extends State<_RoundButton> {
  bool _pressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => setState(() => _pressed = true),
      onTapUp: (_) => setState(() => _pressed = false),
      onTapCancel: () => setState(() => _pressed = false),
      onTap: widget.onPressed,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 120),
        width: 64,
        height: 64,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: const LinearGradient(
            colors: [Color(0xFF66A6FF), Color(0xFF89F7FE)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(_pressed ? 0.15 : 0.28),
              blurRadius: _pressed ? 8 : 18,
              offset: Offset(0, _pressed ? 3 : 10),
            ),
          ],
        ),
        child: Icon(
          widget.icon,
          size: 28,
          color: Colors.black.withOpacity(0.8),
        ),
      ),
    );
  }
}

class _PillBadge extends StatelessWidget {
  final int value;
  const _PillBadge({required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.10),
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: Colors.white.withOpacity(0.18)),
      ),
      child: Text(
        '$value',
        style: const TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.w700,
          color: Colors.white,
        ),
      ),
    );
  }
}
////////// هادا كود للفهم بدون ui
/*import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';
class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
 int _counter = 0;
 String counterKey = 'counter';
  @override
  initState() {
    super.initState();
    readCounter();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(child: Icon(Icons.remove), onPressed: () {
                  setState(() {
                    _counter--;
                    saveCounter(_counter);
                  });
                }),
               Text(
                  _counter.toString(),
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                TextButton(child: Icon(Icons.add), onPressed: () {
                   setState(() {
                    _counter++;
                     saveCounter(_counter);
                  });
                }),
              ],
            ),
          ],
        ),
      ),
    );
  }
  saveCounter(int counter) async {
   final prefs = await SharedPreferences.getInstance();
    prefs.setInt(counterKey, counter);
    // كل ما تزود او تنقص العداد اعمل حفظ

  }
  readCounter()async{
     final prefs = await SharedPreferences.getInstance();
   setState(() {
      _counter= prefs.getInt(counterKey)??0;
   });
  }
}
*/