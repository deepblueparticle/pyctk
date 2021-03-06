/*=========================================================================

  Library:  PyCTK
  Filename: ctkConsole.sip

  Copyright (c) 2015 Lamond Lab

  Licensed under the Apache License, Version 2.0 (the "License");
  you may not use this file except in compliance with the License.
  You may obtain a copy of the License at

      http://www.apache.org/licenses/LICENSE-2.0.txt

  Unless required by applicable law or agreed to in writing, software
  distributed under the License is distributed on an "AS IS" BASIS,
  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
  See the License for the specific language governing permissions and
  limitations under the License.

=========================================================================*/

class ctkConsoleCompleter : public QCompleter {

%TypeHeaderCode
#include "ctkConsole.h"
%End

public:
  virtual void updateCompletionModel(const QString &str)=0;
  QStringList autocompletePreferenceList();
  void setAutocompletePreferenceList(const QStringList &list);


};

class ctkConsole : public QWidget {

%TypeHeaderCode
#include "ctkConsole.h"
%End

public:
  enum EditorHint {
    NoHints=0,
    AutomaticIndentation=1,
    RemoveTrailingSpaces=2,
    SplitCopiedTextByLine=4,
  };
  typedef QFlags<ctkConsole::EditorHint> EditorHints;

  ctkConsole(QWidget *parentObject /TransferThis/ = 0);
  virtual ~ctkConsole();
  QTextCharFormat getFormat() const;
  void setFormat(const QTextCharFormat &Format);
  QFont shellFont() const;
  void setShellFont(const QFont &font);
  ctkConsoleCompleter *completer() const;
  void setCompleter(ctkConsoleCompleter *completer);
  QColor promptColor() const;
  void setPromptColor(const QColor &newColor);
  QColor outputTextColor() const;
  void setOutputTextColor(const QColor &newColor);
  QColor errorTextColor() const;
  void setErrorTextColor(const QColor &newColor);
  QColor stdinTextColor() const;
  void setStdinTextColor(const QColor &newColor);
  QColor commandTextColor() const;
  void setCommandTextColor(const QColor &newColor);
  QColor welcomeTextColor() const;
  void setWelcomeTextColor(const QColor &newColor);
  QColor backgroundColor() const;
  void setBackgroundColor(const QColor &newColor);
  EditorHints editorHints() const;
  void setEditorHints(const EditorHints &newEditorHints);
  Qt::ScrollBarPolicy scrollBarPolicy() const;
  void setScrollBarPolicy(const Qt::ScrollBarPolicy &newScrollBarPolicy);
  void printMessage(const QString &message, const QColor &color);
  virtual QString ps1() const;
  virtual void setPs1(const QString &newPs1);
  virtual QString ps2() const;
  virtual void setPs2(const QString &newPs2);
  static QString stdInRedirectCallBack(void *callData);

public slots:
  virtual void clear();
  virtual void reset();
  virtual void exec(const QString &);
  virtual void runFile(const QString &filePath);
  virtual void runFile();
  virtual void printHelp();

protected:
  QString readInputLine();
  virtual void executeCommand(const QString &Command);

signals:
  void aboutToExecute(const QString &);
  void executed(const QString &);

private:
  ctkConsole(const ctkConsole &);
  ctkConsole &operator=(const ctkConsole &);

};

