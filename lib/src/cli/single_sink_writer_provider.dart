// Copyright 2015 Google Inc. All Rights Reserved.
// Licensed under the Apache License, Version 2.0, found in the LICENSE file.

part of doc_coverage_cli;

/// A [WriterProvider] that provides a [MarkdownWriter] that always writes to
/// the same [IOSink].
class SingleSinkWriterProvider extends WriterProvider {
  IOSink sink;

  /// Constructs a [SingleSinkWriteProvider] that provides a [MarkdownWriter]
  /// that always writes to [sink].
  SingleSinkWriterProvider(this.sink);

  /// Provides a new [MarkdownWriter] to the original sink.
  MarkdownWriter writerFor(String _) =>
      new MarkdownWriter(() => sink, shouldClose: false);
}
