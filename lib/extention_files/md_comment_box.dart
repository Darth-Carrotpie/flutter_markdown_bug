import 'package:markdown/markdown.dart';

class MdCommentInlineSyntax extends InlineSyntax {
  MdCommentInlineSyntax({
    String pattern = r'\+\+(.*?)\+\+',
  }) : super(pattern);

  @override
  bool onMatch(InlineParser parser, Match match) {
    final withoutDashes = match.group(0)?.replaceAll(RegExp(r'\+\+'), "");

    Element el = Element.text("md_comment", withoutDashes.toString());

    parser.addNode(el);
    return true;
  }
}
