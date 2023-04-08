import 'package:flutter/material.dart';
import 'package:themoviedb/resources/resources.dart';
import 'package:themoviedb/widgets/radial_percent/radial_percent_widget.dart';
import 'package:themoviedb/widgets/theme/app_colors.dart';
import 'package:themoviedb/widgets/theme/app_gradients.dart';

class MovieDetailsMainInfoWidget extends StatelessWidget {
  const MovieDetailsMainInfoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: AppColors.themeColor,
      child: Column(
        children: [
          const _TopPosterWidget(),
          const SizedBox(height: 5),
          const _MovieNameWidget(),
          Padding(
            padding: const EdgeInsets.only(bottom: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const _UserScoreWidget(),
                Container(
                  width: 1,
                  height: 30,
                  color: Colors.grey,
                ),
                const _PlayTrailerWidget(),
              ],
            ),
          ),
          const _SummaryMovieInfoWidget(),
          const _OverviewWidget(),
          _MovieStuffTableWidget(),
        ],
      ),
    );
  }
}

class _TopPosterWidget extends StatelessWidget {
  const _TopPosterWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 200,
      child: Stack(
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 30),
            child: Image(
              image: AssetImage(AppImages.avatarTheWayOfWaterPoster),
              height: 200,
              fit: BoxFit.fitHeight,
              alignment: Alignment.topLeft,
            ),
          ),
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              gradient: AppGradients.movieTopPosterAppLinearGradient,
            ),
          ),
          Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
            clipBehavior: Clip.hardEdge,
            margin: const EdgeInsets.all(20.0),
            child: const Image(
              image: AssetImage(AppImages.avatarTheWayOfWater),
              fit: BoxFit.fitHeight,
            ),
          ),
        ],
      ),
    );
  }
}

class _MovieNameWidget extends StatelessWidget {
  const _MovieNameWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      // color: AppColors.themeColor,
      child: RichText(
        textAlign: TextAlign.center,
        text: const TextSpan(
          children: [
            TextSpan(
              text: 'Avatar: The Way Of Water',
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w600,
              ),
            ),
            TextSpan(
              text: ' (2022)',
              style: TextStyle(
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _UserScoreWidget extends StatelessWidget {
  const _UserScoreWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      child: Row(
        children: const [
          SizedBox(
            height: 50,
            width: 50,
            child: RadialPercentWidget(percent: 0.77, sizeOfBox: 50),
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            'User Score',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}

class _PlayTrailerWidget extends StatelessWidget {
  const _PlayTrailerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      child: Row(
        children: const [
          Icon(
            Icons.play_arrow,
            color: Colors.white,
          ),
          SizedBox(
            width: 5,
          ),
          Text(
            'Play Trailer',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}

class _CertificateWidget extends StatelessWidget {
  const _CertificateWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 2),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(2),
          border: Border.all(color: Colors.grey)),
      child: const Text(
        'PG-13',
        style: TextStyle(color: Colors.grey),
      ),
    );
  }
}

class _ReleaseDateWidget extends StatelessWidget {
  const _ReleaseDateWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text(
      '12/16/2022 (US)',
      style: TextStyle(color: Colors.white),
    );
  }
}

class _MovieDurationWidget extends StatelessWidget {
  const _MovieDurationWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text(
      ' • 3h 12m',
      style: TextStyle(color: Colors.white),
    );
  }
}

class _SummaryMovieInfoWidget extends StatelessWidget {
  const _SummaryMovieInfoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      color: AppColors.themeMoreDarkColor,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              _CertificateWidget(),
              SizedBox(width: 5),
              _ReleaseDateWidget(),
              _MovieDurationWidget(),
            ],
          ),
          const SizedBox(height: 5),
          RichText(
            text: const TextSpan(
              text: 'Science Fiction, Adventure, Action',
            ),
          )
        ],
      ),
    );
  }
}

class _OverviewWidget extends StatelessWidget {
  const _OverviewWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            'Return to Pandora',
            style: TextStyle(
              color: Colors.grey,
              fontStyle: FontStyle.italic,
            ),
          ),
          SizedBox(height: 10),
          Text(
            'Overview',
            style: TextStyle(
              color: Colors.white,
              fontSize: 17,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(height: 10),
          Text(
            'Set more than a decade after the events of the first film, learn the story of the Sully family (Jake, Neytiri, and their kids), the trouble that follows them, the lengths they go to keep each other safe, the battles they fight to stay alive, and the tragedies they endure.',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}

class _MovieStuffTableWidget extends StatelessWidget {
  _MovieStuffTableWidget({Key? key}) : super(key: key);

  final List<_MovieStuff> stuffList = [
    _MovieStuff(
      fullName: 'James Cameron',
      workedOn: 'Characters, Director, Screenplay, Story',
    ),
    _MovieStuff(
      fullName: 'Amanda Silver',
      workedOn: 'Screenplay, Story',
    ),
    _MovieStuff(
      fullName: 'Rick Jaffa',
      workedOn: 'Screenplay, Story',
    ),
    _MovieStuff(
      fullName: 'Josh Friedman',
      workedOn: 'Story',
    ),
    _MovieStuff(
      fullName: 'Shane Salerno',
      workedOn: 'Story',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    List<Row> rowList = _createStuffRowList(stuffList, context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Column(
        children: rowList,
      ),
    );
  }

  List<Row> _createStuffRowList(
      List<_MovieStuff> stuffList, BuildContext context) {
    List<Row> stuffRowList = [];
    for (int i = 0; i < stuffList.length; i++) {
      if ((i + 1) % 2 == 0) {
        stuffRowList.add(Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: SizedBox(
                width: MediaQuery.of(context).size.width / 2 - 30,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      stuffList[i - 1].fullName,
                      softWrap: true,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      stuffList[i - 1].workedOn,
                      softWrap: true,
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: SizedBox(
                width: MediaQuery.of(context).size.width / 2 - 30,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      stuffList[i].fullName,
                      softWrap: true,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      stuffList[i].workedOn,
                      softWrap: true,
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ));
      } else if (i + 1 == stuffList.length) {
        stuffRowList.add(Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: SizedBox(
                width: MediaQuery.of(context).size.width / 2 - 30,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      stuffList[i].fullName,
                      softWrap: true,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      stuffList[i].workedOn,
                      softWrap: true,
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: SizedBox(
                width: MediaQuery.of(context).size.width / 2 - 30,
                child: Column(),
              ),
            ),
          ],
        ));
      }
    }

    return stuffRowList;
  }
}

class _MovieStuff {
  final String fullName;
  final String workedOn;

  _MovieStuff({required this.fullName, required this.workedOn});
}
