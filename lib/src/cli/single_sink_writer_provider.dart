// Copyright 2015 Google Inc. All Rights Reserved.
// Licensed under the Apache License, Version 2.0, found in the LICENSE file.

part of doc_coverage_cli;

class SingleSinkWriterProvider extends WriterProvider {
  IOSink sink;
  SingleSinkWriterProvider(this.sink);

  /// In the SingleSinkWriter, the writer is simple the original sink.
  MarkdownWriter writerFor(String _) => new MarkdownWriter(() => sink, false);
}
