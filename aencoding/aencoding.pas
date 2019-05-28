{
Unit to replace complex LazUtils.LConvEncoding by using Free Pascal API SetCodePage().
Author: Alexey Torgashin, UVviewsoft.com
License: MPL 2.0 or LGPL
}
unit AEncoding;

interface

uses
  SysUtils;
  
function AEncodingConvertFromUTF8(const AInput: RawByteString; out AOutput: RawByteString;
  AEnc: TSystemCodePage): boolean; inline;

function AEncodingConvertToUTF8(const AInput: RawByteString; out AOutput: RawByteString;
  AEnc: TSystemCodePage): boolean; inline;

function AEncodingConvertFromTo(const AInput: RawByteString; out AOutput: RawByteString;
  AEncInput, AEncOutput: TSystemCodePage): boolean;


implementation

function AEncodingConvertFromTo(const AInput: RawByteString; out AOutput: RawByteString;
  AEncInput, AEncOutput: TSystemCodePage): boolean;
begin
  AOutput:= AInput;

  if AEncInput=AEncOutput then
    exit(true);

  SetCodePage(AOutput, AEncInput, false);
  SetCodePage(AOutput, AEncOutput, true);
  SetCodePage(AOutput, CP_UTF8, false); //mark as UTF8 for compatability with Lazarus

  Result:= true;
end;

function AEncodingConvertFromUTF8(const AInput: RawByteString; out AOutput: RawByteString;
  AEnc: TSystemCodePage): boolean; inline;
begin
  Result:= AEncodingConvertFromTo(AInput, AOutput, CP_UTF8, AEnc);
end;

function AEncodingConvertToUTF8(const AInput: RawByteString; out AOutput: RawByteString;
  AEnc: TSystemCodePage): boolean; inline;
begin
  Result:= AEncodingConvertFromTo(AInput, AOutput, AEnc, CP_UTF8);
end;


end.

