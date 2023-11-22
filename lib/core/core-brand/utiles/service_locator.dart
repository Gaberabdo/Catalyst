
import 'package:get_it/get_it.dart';

import '../../../features/Catlog-feature/data/repos/category_repo_imp.dart';


GetIt getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<CategoryRepoImpl>(
    CategoryRepoImpl(),
  );
}
