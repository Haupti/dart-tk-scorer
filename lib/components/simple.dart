import 'package:ssr/html.dart' as ssr;
class SimpleComponent implements ssr.Component{
  
  final String _htmlString;
  SimpleComponent(this._htmlString);

  @override
  String render() {
    return this._htmlString;
  } 
}