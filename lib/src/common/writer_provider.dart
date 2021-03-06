// Copyright 2015 Google Inc. All Rights Reserved.
// Licensed under the Apache License, Version 2.0, found in the LICENSE file.

part of doc_coverage_common;

abstract class WriterProvider {
  MarkdownWriter writerFor(String libraryName);
}
