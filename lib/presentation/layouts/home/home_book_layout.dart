import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:pocket_books/presentation/utils/route_utils.dart';

class HomeBookLayout extends StatefulWidget {
  const HomeBookLayout({Key? key}) : super(key: key);

  @override
  State<HomeBookLayout> createState() => _HomeBookLayoutState();
}

class _HomeBookLayoutState extends State<HomeBookLayout> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Pocket Books',
            style: TextStyle(fontSize: 21, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 12),
          Expanded(
            child: StaggeredGrid.count(
              crossAxisCount: 4,
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
              children: [
                StaggeredGridTile.count(
                  crossAxisCellCount: 2,
                  mainAxisCellCount: 3,
                  child: InkWell(
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        RouteNames.detailBook,
                        arguments:
                            'https://is3.cloudhost.id/beceran-dev-nti/coba/books/2.%20Chapter%201%20-%20Business%20Meeting.pdf',
                      );
                    },
                    child: Container(
                      width: double.infinity,
                      height: double.infinity,
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                        image: const DecorationImage(
                          image: CachedNetworkImageProvider(
                            'https://img.freepik.com/free-photo/aerial-view-business-team_53876-124515.jpg',
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          const Text(
                            'Business Meeting',
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                StaggeredGridTile.count(
                  crossAxisCellCount: 2,
                  mainAxisCellCount: 2,
                  child: InkWell(
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        RouteNames.detailBook,
                        arguments:
                            'https://is3.cloudhost.id/beceran-dev-nti/coba/books/3.%20Chapter%202%20-%20Telephoning.pdf',
                      );
                    },
                    child: Container(
                      width: double.infinity,
                      height: double.infinity,
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                        image: const DecorationImage(
                          image: CachedNetworkImageProvider(
                            'https://www.vads.co.id/media/2962/copy-of-vads-indonesia-kenali-tanggung-jawab-dan-tugas-call-center.jpg',
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          const Text(
                            'Telephoning',
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                StaggeredGridTile.count(
                    crossAxisCellCount: 2,
                    mainAxisCellCount: 3,
                    child: InkWell(
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          RouteNames.detailBook,
                          arguments:
                              'https://is3.cloudhost.id/beceran-dev-nti/coba/books/4.%20Chapter%203%20-%20Setting%20Up%20A%20Business%201.pdf',
                        );
                      },
                      child: Container(
                        width: double.infinity,
                        height: double.infinity,
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5),
                          image: const DecorationImage(
                            image: CachedNetworkImageProvider(
                              'https://asset-a.grid.id/crop/0x0:0x0/700x0/photo/2021/06/03/wwdc-2019-kenalkan-watchos-6jpg-20210603013028.jpg',
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            const Text(
                              'Setting Up A Business 1',
                              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white),
                            )
                          ],
                        ),
                      ),
                    )),
                StaggeredGridTile.count(
                  crossAxisCellCount: 2,
                  mainAxisCellCount: 2,
                  child: InkWell(
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        RouteNames.detailBook,
                        arguments:
                            'https://is3.cloudhost.id/beceran-dev-nti/coba/books/5.%20Chapter%204-%20Setting%20Up%20A%20Business%202.pdf',
                      );
                    },
                    child: Container(
                      width: double.infinity,
                      height: double.infinity,
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                        image: const DecorationImage(
                          image: CachedNetworkImageProvider(
                            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQpruQqlB9EXuOSRQaAlDHKpO04Qjyh-umHVA&usqp=CA',
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            'Setting Up A Business 2',
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
