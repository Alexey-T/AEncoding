unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    ListBox1: TListBox;
    procedure FormCreate(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

uses
  AEncoding, FileUtil;

{$R *.lfm}

{ TForm1 }

procedure TForm1.FormCreate(Sender: TObject);
var
  fn_ger, fn_greek: string;
  s1, s2: RawByteString;
begin
  fn_ger:= ExtractFilePath(Application.ExeName)+'enc cp1250 german.txt';
  fn_greek:= ExtractFilePath(Application.ExeName)+'enc cp1253 greek.txt';

  ListBox1.items.add('--- show German text (cp1250) ---');

  s1:= ReadFileToString(fn_ger);
  AEncodingConvertToUTF8(s1, s2, 1250);
  Listbox1.items.add(s2);

  ListBox1.items.add('--- show Greek text (cp1253) ---');

  s1:= ReadFileToString(fn_greek);
  AEncodingConvertToUTF8(s1, s2, 1253);
  Listbox1.items.add(s2);
end;

end.

