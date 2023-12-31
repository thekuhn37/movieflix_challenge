import 'package:flutter/material.dart';
import 'package:movie_challenge/models/detail_model.dart';
import 'package:movie_challenge/services/api_service.dart';

class DetailScreen extends StatefulWidget {
  final String type, thumb;
  final int id;

  const DetailScreen({
    super.key,
    required this.type,
    required this.thumb,
    required this.id,
  });

// statefulwidget과 state위젯은 별개의 위젯이다.
// The build method can get the data from the Statefulwidget that holds the state by
// saying. 'widget.~~'

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen>
    with SingleTickerProviderStateMixin {
  late Future<MovieDetailModel> details;
  late AnimationController _controller;
  late Animation<Offset> _offsetAnimation;

  @override
  void initState() {
    super.initState();
    details = ApiService.getDetailById(widget.id);
    // widget.id라고 씀으로서 본 state를 품고 있는 statefulwidget에 속해있는 정보에
    //접근할 수 있다.  그래야 reference 가능.
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );

    _offsetAnimation = Tween<Offset>(
      begin: const Offset(2.0, 0.0),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));

    // Initialize the animation
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    print(_offsetAnimation.value);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const Text(
          'Movie Info',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
      ),
      body: FutureBuilder(
        future: details,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            // Using a Stack to overlay the poster image with details
            return Stack(
              children: [
                // Background poster image
                Transform.translate(
                  offset: _offsetAnimation.value,
                  child: ColorFiltered(
                    colorFilter: ColorFilter.mode(
                        Colors.black.withOpacity(0.6), BlendMode.srcOver),
                    child: Image.network(
                      snapshot.data!.poster,
                      fit: BoxFit.fitHeight,
                      height: double.infinity,
                      width: double.infinity,
                    ),
                  ),
                ),
                // Details centered on the screen
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 250,
                        ),
                        Text(
                          snapshot.data!.title,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 20),
                        // Genre
                        Text(
                          snapshot.data!.genre,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                        const SizedBox(height: 20),
                        // Overview
                        Text(
                          snapshot.data!.about,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                          textAlign: TextAlign.left,
                        ),
                        const SizedBox(height: 20),
                        // Rate
                        Text(
                          'Rate: ⭐️ ${snapshot.data!.rate}',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
