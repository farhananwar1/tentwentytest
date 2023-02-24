import 'network_service.dart';

class Repository {
  final NetworkService networkService;

  Repository({required this.networkService});

  Future<List> getMoviesList(page) async {
    final moviesData = await networkService.getMoviesList(page);
    if (moviesData[0] == true) {
      try {
        return [
          true,
          moviesData[1]['page'],
          moviesData[1]['results'],
          moviesData[1]['total_pages'],
          moviesData[1]['total_results']
        ];
      } catch (e) {
        return [false, []];
      }
    }
    return [false, moviesData[1]];
  }
}
