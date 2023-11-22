import 'dart:convert';
import 'dart:convert';
import 'package:xml/xml.dart' as xml;

class XmlToJson{
  String xmlToJson(xml.XmlDocument document) {
    var buffer = StringBuffer();
    var builder = json.JsonEncoder.withIndent('  ');

    // Convert XML to Map
    var map = _xmlToMap(document);

    // Convert Map to JSON
    var jsonStr = builder.convert(map);

    // Write JSON string to buffer
    buffer.write(jsonStr);

    return buffer.toString();
  }

  Map<String, dynamic> _xmlToMap(xml.XmlNode node) {
    if (node is xml.XmlElement) {
      var map = <String, dynamic>{};
      map['name'] = node.name.local;

      for (var attribute in node.attributes) {
        map[attribute.name.local] = attribute.value;
      }

      if (node.children.length == 1 && node.children.first is xml.XmlText) {
        // If the element has only text content, store it directly
        map['value'] = node.text;
      } else {
        // If the element has child elements, recursively convert them to a map
        map['children'] = <Map<String, dynamic>>[];
        for (var child in node.children) {
          map['children'].add(_xmlToMap(child));
        }
      }

      return map;
    } else if (node is xml.XmlText) {
      return node.text;
    }

    return <String, dynamic>{};
  }
}