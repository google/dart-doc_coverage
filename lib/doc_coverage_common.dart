// Copyright 2014 Google Inc. All Rights Reserved.
// Licensed under the Apache License, Version 2.0, found in the LICENSE file.

library doc_coverage_common;

import 'dart:async';
import 'dart:convert';

import 'package:html/dom.dart' show Document, Element;
import 'package:html/parser.dart' show parse;

part 'src/common/comment_analyses.dart';
part 'src/common/dartdoc_viewer_utils.dart';
part 'src/common/doc_coverage.dart';
part 'src/common/docs_location.dart';
part 'src/common/gaps_analysis.dart';
part 'src/common/markdown_writer.dart';
part 'src/common/readable_string_sink.dart';
part 'src/common/utils.dart';
part 'src/common/writer_provider.dart';
