// Copyright 2014 Google Inc. All Rights Reserved.
// Licensed under the Apache License, Version 2.0, found in the LICENSE file.

part of doc_coverage_common;

class MarkdownWriter {
  final Function openIo;
  final bool shouldClose;

  StringSink _io;
  String buffer, h1Buffer, h2Buffer;

  MarkdownWriter(this.openIo, this.shouldClose);

  get io {
    if (_io == null) {
      _io = openIo();
    }
    return _io;
  }

  void close() {
    if (_io == null) {
      // TODO: optionally write this message. Otherwise, never open io.
      //io.writeln(h1Buffer);
      //io.writeln('_No changes in this package._');
      return;
    }
    if (shouldClose) {
      Future.wait([io.close()]);
    }
  }

  void writeln(String s) {
    if (buffer != null) {
      io.writeln(buffer);
      buffer = null;
    }

    if (h1Buffer != null) {
      io.writeln(h1Buffer);
      h1Buffer = null;
    }

    if (h2Buffer != null) {
      io.writeln(h2Buffer);
      h2Buffer = null;
    }

    io.writeln(s);
  }

  void writeBad(String s, [String s2 = '']) {
    writeln('<p style="color: red;">$s</p>');
    writeln('<pre><code style="color: red;">$s2</code></pre>');
    writeln('<hr />');
  }

  void writeBlockquote(String s) {
    String joined = s.split('\n').map((m) => '> $m\n').join();
    io.writeln(joined);
  }

  void writeCodeblockHr(String s) {
    io.writeln('```dart\n${s}\n```\n---');
  }

  void writeHr() => io.writeln('\n---\n');

  void bufferH1(String s) {
    h1Buffer = '$s\n${'=' * s.length}\n';
  }

  void bufferH2(String s) {
    h2Buffer = '$s\n${'-' * s.length}\n';
  }

  void writeMetadata(String packageName) {
    buffer = """---
layout: page
title: $packageName
permalink: /$packageName/
---""";
  }
}
