import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';

import '../../route_paths.dart' as paths;

@Component(
  selector: 'book-detail',
  templateUrl: 'book_detail_component.html',
  styleUrls: ['book_detail_component.scss.css']
)
class BookDetailComponent implements OnActivate {

  String paramId = "Null";

  @override
  void onActivate(_, RouterState current) async {
    final id = paths.getId(current.parameters);

    if (id != null) {
      paramId = id;
    } 
  }

}