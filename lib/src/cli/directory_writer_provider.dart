// Copyright 2015 Google Inc. All Rights Reserved.
// Licensed under the Apache License, Version 2.0, found in the LICENSE file.

part of doc_coverage_cli;

/// A [WriterProvider] that provides a [MarkdownWriter] that writes to a new
/// Markdown file for each library.
class DirectoryWriterProvider extends WriterProvider {
  String path;

  /// Constructs a [DirectoryWriterProvider] that will use [path] when creating
  /// new writers.
  DirectoryWriterProvider(this.path) {
    new Directory(path)
      ..createSync(recursive: true);
  }

  /// Provides a [MarkdownWriter] that writes to a new Markdown file for
  /// [libraryName], directly inside [path].
  MarkdownWriter writerFor(String libraryName) {
    fileTargetBuilder() {
      File f = new File('$path/$libraryName.markdown')
        ..createSync(recursive: true);
      return f.openWrite();
    }

    return writerCtor(fileTargetBuilder, shouldClose: true);
  }

  MarkdownWriter writerCtor(fileTargetBuilder, {bool shouldClose: true}) =>
      new MarkdownWriter(fileTargetBuilder, shouldClose: shouldClose);
}
