import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;

import 'package:mobile_arquitetura_01/data/datasources/product_remote_datasource.dart';
import 'package:mobile_arquitetura_01/data/repositories/product_repository_impl.dart';
import 'package:mobile_arquitetura_01/main.dart';

void main() {
  testWidgets('App renders without crashing', (WidgetTester tester) async {
    final client = http.Client();
    final datasource = ProductRemoteDatasource(client);
    final repository = ProductRepositoryImpl(datasource);

    await tester.pumpWidget(MyApp(repository: repository));

    expect(find.text('Produtos'), findsOneWidget);
  });
}
