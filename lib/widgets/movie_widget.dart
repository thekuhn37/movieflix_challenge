import 'package:flutter/material.dart';
import 'package:movie_challenge/screens/detailscreen.dart';

class Movie extends StatelessWidget {
  final String type, thumb;
  final int id;

  const Movie({
    super.key,
    required this.type,
    required this.thumb,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        /*
        onTap : 위젯을 클릭 시의 효과를 관리하는 위젯
         */
        Navigator.push(
          /* 에니메이션 효과를 줘서 화면 넘어가게 느끼게 함. 그런데 라우트가 필요함. 
        */
          context,
          MaterialPageRoute(
            /* 스테이트레스위젯을 라우트로 만들어줌.
        */
            builder: (context) => DetailScreen(
              type: type,
              thumb: thumb,
              id: id,
            ),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
        ),
        clipBehavior: Clip.hardEdge,
        child: Image.network(
          thumb,
        ),
      ),
    );
  }
}
