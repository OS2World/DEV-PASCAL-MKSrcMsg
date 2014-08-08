Unit MKDos;
{$I MKB.Def}

Interface Uses Dos, Use32, VPUtils;


Function GetDosDate: LongInt;
Function GetDOW: Word;
Function TimeOut(Time:LongInt):Boolean;

Implementation

Function TimeOut(Time:LongInt):Boolean;
  Var
    TimeDiff: LongInt;

  Begin
  TimeDiff := Time - GetTimeMSec;
  If TimeDiff < 0 Then
    TimeOut := True
  Else
    Begin
    If (TimeDiff > 780000) Then
    Dec(TimeDiff, 1572480);
    If TimeDiff < 0 Then
      TimeOut := True
    Else
      TimeOut := False;
    End;
  End;

Function GetDosDate: LongInt;
  Var
    {$IFDEF WINDOWS}
    DT: TDateTime;
    {$ELSE}
    DT: DateTime;
    {$ENDIF}
    DosDate: LongInt;
    DOW: Word;

  Begin
  GetDate(DT.Year, DT.Month, DT.Day, DOW);
  GetTime(DT.Hour, DT.Min, DT.Sec, DOW);
  PackTime(DT, DosDate);
  GetDosDate := DosDate;
  End;


Function GetDOW: Word;
  Var
    {$IFDEF WINDOWS}
    DT: TDateTime;
    {$ELSE}
    DT: DateTime;
    {$ENDIF}
    DOW: Word;

  Begin
  GetDate(DT.Year, DT.Month, DT.Day, DOW);
  GetDOW := DOW;
  End;


End.
