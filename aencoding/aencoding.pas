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

// Encoding values are from fpcsrc/rtl/objpas/sysutils/syscodepages.inc

const
  aeid_CP273 = 20273;
  aeid_CP278 = 20278;
  aeid_CP280 = 20280;
  aeid_CP284 = 20284;
  aeid_CP285 = 20285;
  aeid_CP290 = 20290;
  aeid_CP297 = 20297;
  aeid_CP367 = 20127;
  aeid_CP420 = 20420;
  aeid_CP423 = 20423;
  aeid_CP424 = 20424;
  aeid_CP437 = 437;
  aeid_CP500 = 500;
  aeid_CP819 = 28591;
  aeid_CP850 = 850;
  aeid_CP852 = 852;
  aeid_CP855 = 855;
  aeid_CP856 = 856;
  aeid_CP857 = 857;
  aeid_CP858 = 858;
  aeid_CP860 = 860;
  aeid_CP861 = 861;
  aeid_CP862 = 862;
  aeid_CP863 = 863;
  aeid_CP864 = 864;
  aeid_CP865 = 865;
  aeid_CP866 = 866;
  aeid_CP869 = 869;
  aeid_CP870 = 870;
  aeid_CP871 = 20871;
  aeid_CP875 = 875;
  aeid_CP880 = 20880;
  aeid_CP905 = 20905;
  aeid_JOHAB = 1361;
  aeid_CP930 = 50930;
  aeid_CP933 = 50933;
  aeid_CP935 = 50935;
  aeid_CP937 = 50937;
  aeid_CP939 = 50939;
  aeid_CP949 = 949;
  aeid_CP950 = 950;

  aeid_CP1250 = 1250;
  aeid_CP1251 = 1251;
  aeid_CP1252 = 1252;
  aeid_CP1253 = 1253;
  aeid_CP1254 = 1254;
  aeid_CP1255 = 1255;
  aeid_CP1256 = 1256;
  aeid_CP1257 = 1257;
  aeid_CP1258 = 1258;

  aeid_ISO_8859_1 = 28591;
  aeid_ISO_8859_2 = 28592;
  aeid_ISO_8859_3 = 28593;
  aeid_ISO_8859_4 = 28594;
  aeid_ISO_8859_5 = 28595;
  aeid_ISO_8859_6 = 28596;
  aeid_ISO_8859_7 = 28597;
  aeid_ISO_8859_8 = 28598;
  aeid_ISO_8859_9 = 28599;
  aeid_ISO_8859_10 = 28600;
  aeid_ISO_8859_11 = 874;
  aeid_ISO_8859_13 = 28603;
  aeid_ISO_8859_14 = 28604;
  aeid_ISO_8859_15 = 28605;
  aeid_ISO_8859_16 = 28606;

  aeid_ISO_2022_jp = 50220;
  aeid_ISO_2022_kr = 50225;
  aeid_ISO_2022_jpeuc = 51932;
  aeid_ISO_2022_kr_8 = 51949;


implementation

function AEncodingConvertFromTo(const AInput: RawByteString; out AOutput: RawByteString;
  AEncInput, AEncOutput: TSystemCodePage): boolean;
begin
  AOutput:= AInput;

  if AInput='' then
    exit(true);

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

