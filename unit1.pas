unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls,
  Menus, ComCtrls, TAGraph, TASources, TATransformations, tcp_udpport,
  ISOTCPDriver, PLCBlock, PLCBlockElement, HMILabel,
  TASeries, TAChartUtils, Types, LazUTF8;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button3: TButton;
    Chart1: TChart;
    Chart1LineSeries1: TLineSeries;
    Chart1LineSeries2: TLineSeries;
    Chart1LineSeries3: TLineSeries;
    Chart1LineSeries4: TLineSeries;
    Chart1LineSeries5: TLineSeries;
    ChartAxisTransformations1: TChartAxisTransformations;
    ChartAxisTransformations1LinearAxisTransform1: TLinearAxisTransform;
    ConnectMenu: TPopupMenu;
    Connect: TMenuItem;
    Disconnect: TMenuItem;
    ToolButton2: TToolButton;
    V_DC_CheckBox: TCheckBox;
    LineSpeed_CheckBox: TCheckBox;
    Power_Out_CheckBox: TCheckBox;
    V_Out_CheckBox: TCheckBox;
    I_DC_CheckBox: TCheckBox;
    DB1_258: TPLCBlock;
    DB1_252: TPLCBlock;
    DB1_68to76: TPLCBlock;
    DB1_DBD252: TPLCBlockElement;
    DB1_DBD258: TPLCBlockElement;
    DB1_DBD68: TPLCBlockElement;
    DB1_DBD72: TPLCBlockElement;
    DB1_DBD76: TPLCBlockElement;
    HMILabel1: THMILabel;
    HMILabel2: THMILabel;
    HMILabel3: THMILabel;
    HMILabel4: THMILabel;
    HMILabel5: THMILabel;
    ImageList1: TImageList;
    ISOTCPDriver1: TISOTCPDriver;
    ListChartSource1: TListChartSource;
    ListChartSource2: TListChartSource;
    ListChartSource3: TListChartSource;
    ListChartSource4: TListChartSource;
    ListChartSource5: TListChartSource;
    Memo1: TMemo;
    ChartZoomOutMenu: TMenuItem;
    MenuItem10: TMenuItem;
    MenuItem11: TMenuItem;
    MenuItem12: TMenuItem;
    MenuItem13: TMenuItem;
    MenuItem14: TMenuItem;
    MenuItem15: TMenuItem;
    MenuItem16: TMenuItem;
    MenuItem17: TMenuItem;
    ChartRefreshMenu: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    ChartZoomInMenu: TMenuItem;
    MenuItem6: TMenuItem;
    MenuItem7: TMenuItem;
    MenuItem8: TMenuItem;
    MenuItem9: TMenuItem;
    PageControl1: TPageControl;
    ChartMenu: TPopupMenu;
    FileMenu: TPopupMenu;
    Shape1: TShape;
    Shape2: TShape;
    Shape3: TShape;
    Shape4: TShape;
    Shape5: TShape;
    StatusBar1: TStatusBar;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    TCP_UDPPort1: TTCP_UDPPort;
    Timer1: TTimer;
    Timer2: TTimer;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    procedure Button3Click(Sender: TObject);
    procedure Chart1Click(Sender: TObject);
    procedure Chart1DragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure Chart1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Chart1MouseEnter(Sender: TObject);
    procedure Chart1MouseLeave(Sender: TObject);
    procedure ConnectClick(Sender: TObject);
    procedure DisconnectClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormMouseWheel(Sender: TObject; Shift: TShiftState;
      WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean);
    procedure ChartZoomOutMenuClick(Sender: TObject);
    procedure ChartRefreshMenuClick(Sender: TObject);
    procedure I_DC_CheckBoxEditingDone(Sender: TObject);
    procedure LineSpeed_CheckBoxEditingDone(Sender: TObject);
    procedure MenuItem3Click(Sender: TObject);
    procedure MenuItem4Click(Sender: TObject);
    procedure ChartZoomInMenuClick(Sender: TObject);
    procedure Power_Out_CheckBoxEditingDone(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    procedure V_DC_CheckBoxEditingDone(Sender: TObject);
    procedure V_Out_CheckBoxEditingDone(Sender: TObject);
  private

  public
    Function CheckFile(C_DNAME: string; C_FNAME: string; Debug_:TMemo):boolean;
    Function CheckDirectory(C_DNAME: string;Debug_:TMemo):boolean;
  end;

var
  Form1: TForm1;
  FileName_: string;
  Directory_:string;
  Chart_Enter:boolean;
  Chatr_Zoom:integer;
  ChartSimulate:boolean;

implementation

{$R *.lfm}

{ TForm1 }

Function TForm1.CheckFile(C_DNAME: string; C_FNAME: string; Debug_:TMemo):boolean; //True=Error
var
  tfOut: TextFile;
begin
  result:= false;

  if(C_DNAME<>'')then
  if Not DirectoryExists(C_DNAME) Then
  begin
    {$I-}
    //{$I-} or {$IOCHECKS OFF}
    //{$I-} rewrite (f); {$I+}
    //if IOResult<>0 then begin Writeln ('Error opening file: "file.txt"'); exit; end;
    mkdir(C_DNAME);
    {$I+}
    if IOResult<>0 then
    begin
      Debug_.Append('Directory '+C_DNAME+' error occurred. Details: '+ EInOutError.ClassName);
      ShowMessage('Cannot create '+C_DNAME+' directory. Details: '+ EInOutError.ClassName);
      result:= true;
    end;
  end;

  if(C_FNAME<>'')then
  if DirectoryExists(C_DNAME) Then
  If Not FileExists(C_FNAME) Then
  begin
    AssignFile(tfOut, C_FNAME);
    {$I+}
    try
      rewrite(tfOut);
      CloseFile(tfOut);
    except
      on E: EInOutError do
      begin
        Debug_.Append('File '+C_FNAME+' handling error occurred. Details: '+ EInOutError.ClassName);
        showmessage('File '+C_FNAME+' handling error occurred. Details: '+ E.ClassName+ '/'+ E.Message);
        result:= true;
      end;
    end;
  end;

end;

Function TForm1.CheckDirectory(C_DNAME: string;Debug_:TMemo):boolean; //True=Error
var
  tfOut: TextFile;
begin
  result:= false;

  if(C_DNAME<>'')then
  if Not DirectoryExists(C_DNAME) Then
  begin
    {$I-}
    //{$I-} or {$IOCHECKS OFF}
    //{$I-} rewrite (f); {$I+}
    //if IOResult<>0 then begin Writeln ('Error opening file: "file.txt"'); exit; end;
    mkdir(C_DNAME);
    {$I+}
    if IOResult<>0 then
    begin
      Debug_.Append('Directory '+C_DNAME+' error occurred. Details: '+ EInOutError.ClassName);
      ShowMessage('Cannot create '+C_DNAME+' directory. Details: '+ EInOutError.ClassName);
      result:= true;
    end;
  end;

end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  ChartSimulate:=not ChartSimulate;
end;

procedure TForm1.Chart1Click(Sender: TObject);
begin
  Chart1.Tag :=1;
end;

procedure TForm1.Chart1DragOver(Sender, Source: TObject; X, Y: Integer;
  State: TDragState; var Accept: Boolean);
begin
  Chart1.Tag :=1;
end;

procedure TForm1.Chart1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  Chart1.Tag :=1;
end;

procedure TForm1.Chart1MouseEnter(Sender: TObject);
begin
  Chart_Enter:=true;
end;

procedure TForm1.Chart1MouseLeave(Sender: TObject);
begin
  Chart_Enter:=false;
end;

procedure TForm1.ConnectClick(Sender: TObject);
var
  i:integer;
begin
  TCP_UDPPort1.ExclusiveDevice:=True;
    for i := 0 to 1000 do
    begin
      application.ProcessMessages;
    end;
    TCP_UDPPort1.Active:=True;
end;

procedure TForm1.DisconnectClick(Sender: TObject);
var
  i:integer;
begin
  TCP_UDPPort1.Active:=false;
    for i := 0 to 1000 do
    begin
      application.ProcessMessages;
    end;
    TCP_UDPPort1.ExclusiveDevice:=false;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin

  Directory_:=FormatDateTime('MM YYYY',Now); FileName_:= Directory_+'\'+FormatDateTime('DD MM YYYY',Now)+'.CSV';
  if CheckDirectory(Directory_,Memo1) then begin Application.Terminate; end;

  Memo1.Append('Directory ='+Directory_);
  Memo1.Append('FileName ='+FileName_);

  Chart_Enter:=false;
  Chart1.Tag:=0;
  Chatr_Zoom:=0;
  PageControl1.TabIndex:=0;

end;

procedure TForm1.FormMouseWheel(Sender: TObject; Shift: TShiftState;
  WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean);
var
  AC: TDoublePoint;
  AZ: TDoubleRect;
begin
  if (Chart_Enter) and (Chart1.Tag=1) then
  begin
    if(WheelDelta>0)then
    begin
      if(Chatr_Zoom<=26)then
      begin
        AC:=Chart1.LogicalExtent.a;
        AC.X:=AC.X+2;
        AC.Y:=AC.Y+2;
        AZ.a:=AC;
        AC:=Chart1.LogicalExtent.b;
        AC.X:=AC.X-2;
        AC.Y:=AC.Y-2;
        AZ.b:=AC;
        Chart1.LogicalExtent:=AZ;
        Chatr_Zoom:=Chatr_Zoom+2;
      end;
    end;
    if(WheelDelta<0)then
    begin
      AC:=Chart1.LogicalExtent.a;
      AC.X:=AC.X-2;
      AC.Y:=AC.Y-2;
      AZ.a:=AC;
      AC:=Chart1.LogicalExtent.b;
      AC.X:=AC.X+2;
      AC.Y:=AC.Y+2;
      AZ.b:=AC;
      Chart1.LogicalExtent:=AZ;
      Chatr_Zoom:=Chatr_Zoom-2;
    end;
  end;

end;

procedure TForm1.ChartZoomOutMenuClick(Sender: TObject);
var
  AC: TDoublePoint;
  AZ: TDoubleRect;
begin
  Chart1.Tag:=1;
  AC:=Chart1.LogicalExtent.a;
  AC.X:=AC.X-2;
  AC.Y:=AC.Y-2;
  AZ.a:=AC;
  AC:=Chart1.LogicalExtent.b;
  AC.X:=AC.X+2;
  AC.Y:=AC.Y+2;
  AZ.b:=AC;
  Chart1.LogicalExtent:=AZ;
  Chatr_Zoom:=Chatr_Zoom-2;
end;

procedure TForm1.ChartRefreshMenuClick(Sender: TObject);
begin
  Chart1.Tag:=0;
  Chatr_Zoom:=0;
end;

procedure TForm1.I_DC_CheckBoxEditingDone(Sender: TObject);
begin
  Chart1LineSeries1.Active:=I_DC_CheckBox.Checked;
end;

procedure TForm1.LineSpeed_CheckBoxEditingDone(Sender: TObject);
begin
  Chart1LineSeries3.Active:=LineSpeed_CheckBox.Checked;
end;

procedure TForm1.MenuItem3Click(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TForm1.MenuItem4Click(Sender: TObject);
begin
  //Directory_
  //FileName_
  //SysUtils.ExecuteProcess(UTF8ToSys('explorer.exe'), '/select,C:\Windows\explorer.exe', []);
  SysUtils.ExecuteProcess(UTF8ToSys('explorer.exe'), '/select,'+FileName_, []);
end;

procedure TForm1.ChartZoomInMenuClick(Sender: TObject);
var
  AC: TDoublePoint;
  AZ: TDoubleRect;
begin
  if(Chatr_Zoom<=26)then
      begin
        Chart1.Tag:=1;
        AC:=Chart1.LogicalExtent.a;
        AC.X:=AC.X+2;
        AC.Y:=AC.Y+2;
        AZ.a:=AC;
        AC:=Chart1.LogicalExtent.b;
        AC.X:=AC.X-2;
        AC.Y:=AC.Y-2;
        AZ.b:=AC;
        Chart1.LogicalExtent:=AZ;
        Chatr_Zoom:=Chatr_Zoom+2;
      end;
end;

procedure TForm1.Power_Out_CheckBoxEditingDone(Sender: TObject);
begin
  Chart1LineSeries4.Active:=Power_Out_CheckBox.Checked;
end;

procedure TForm1.Timer1Timer(Sender: TObject);
var
  i:integer;
  //MaxRecordTime:integer;
  //Txt:String;
  fileout : TextFile;
  S_Name:string;
  File_OK:Boolean;

  MaxRecordTime:integer;
  Txt:String;
  Ra:Double;
begin
  //if not TCP_UDPPort1.Active then exit;
  if (FormatDateTime('MM YYYY',Now)<>Directory_) then
  begin
    Directory_:=FormatDateTime('MM YYYY',Now); FileName_:= Directory_+'\'+FormatDateTime('DD MM YYYY',Now)+'.CSV';
  end;
  if CheckDirectory(Directory_,Memo1) then begin Application.Terminate; end;

  S_Name:=Directory_+'\'+FormatDateTime('DD MM YYYY',Now)+'.CSV';
  i:=0;
  File_OK:=True;

  try
    AssignFile(fileout, S_Name);
  except
    on E: EInOutError do
    begin
      //showmessage('AssignFile: '+E.ClassName+'/'+ E.Message+'/'+IntToStr(E.ErrorCode));
      File_OK:=False;
    end;
  end;

  //if File_OK then showmessage('File_OK=OK');
  //if not File_OK then showmessage('File_OK=not OK');
  //Timer3.Enabled:=False;

  while((File_OK = False) and (i<100)) do
  begin
    i:=i+1;
    S_Name:=Directory_+'\'+FormatDateTime('DD MM YYYY',Now)+'_'+IntToStr(i)+'.CSV';
    File_OK:=True;
    try
      AssignFile(fileout, S_Name);
    except
      on E: EInOutError do
      begin
        //showmessage('AssignFile: '+E.ClassName+'/'+ E.Message+'/'+IntToStr(E.ErrorCode));
        File_OK:=False;
      end;
    end;
  end;

   try
     Append(fileout);
   except
     //on E: EInOutError do
     //showmessage('Append: '+E.ClassName+'/'+ E.Message+'/'+IntToStr(E.ErrorCode));
     on E: EInOutError do
     try
       rewrite (fileout);
       writeln(fileout, 'Date,Time,I_DC,V_DC,LineSpeed,Power_Out,V_Out');
     except
       //on E: EInOutError do
       //showmessage('Append: '+E.ClassName+'/'+ E.Message+'/'+IntToStr(E.ErrorCode));
     end;
   end;

   try         //FloatToStr(Int(Random(1*10)))
     //writeln(fileout, FormatDateTime('DD/MM/YYYY',Now)+','+FormatDateTime('hh:nn:ss',Now)+','+FormatFloat('####0.00',DB3_DBD12.Value)+','+FormatFloat('####0.00',DB3_DBD30.Value)+','+FormatFloat('####0.00',DB24_DBD62.Value)+','+FloatToStr(Q1_7.Value)+','+FloatToStr(I7_0.Value));
     writeln(fileout, FormatDateTime('DD/MM/YYYY',Now)+','+FormatDateTime('hh:nn:ss',Now)+','+FormatFloat('####0.00',DB1_DBD68.Value)+','+FormatFloat('####0.00',DB1_DBD72.Value)+','+FormatFloat('####0.00',DB1_DBD76.Value)+','+FormatFloat('####0.00',DB1_DBD252.Value)+','+FormatFloat('####0.00',DB1_DBD258.Value));
     CloseFile(fileout);
   except
     //on E: EInOutError do
     //showmessage('Append: '+E.ClassName+'/'+ E.Message+'/'+IntToStr(E.ErrorCode));
   end;

   Randomize();

  MaxRecordTime:=60*60*12;
  if ListChartSource1.Count >= MaxRecordTime then
  begin
    for i:=0 to MaxRecordTime-2 do
    begin
      ListChartSource1.Item[i]^.Y:=ListChartSource1.Item[i+1]^.Y;
      ListChartSource1.Item[i]^.Text:=ListChartSource1.Item[i+1]^.Text;

      ListChartSource4.Item[i]^.Y:=ListChartSource4.Item[i+1]^.Y;
      ListChartSource4.Item[i]^.Text:=ListChartSource4.Item[i+1]^.Text;

      ListChartSource5.Item[i]^.Y:=ListChartSource5.Item[i+1]^.Y;
      ListChartSource5.Item[i]^.Text:=ListChartSource5.Item[i+1]^.Text;

    end;
    ListChartSource1.Delete(MaxRecordTime-1);
    ListChartSource4.Delete(MaxRecordTime-1);
    ListChartSource5.Delete(MaxRecordTime-1);
  end;


  Txt:=FormatDateTime('hh',  Now)+':'+FormatDateTime('nn',  Now)+':'+FormatDateTime('ss',  Now);

  Ra:= DB1_DBD68.Value;
  if ChartSimulate then Ra:= Int(Random(1*1000));
  if Chart1.Extent.YMax<Ra then Chart1.Extent.YMax:=Ra+1;
  if ListChartSource1.Count < MaxRecordTime then ListChartSource1.Add(ListChartSource1.Count,Ra,Txt,clBlue);    //I_DC_CheckBox  DB1_DBD68

  Ra:= DB1_DBD72.Value;
  if ChartSimulate then Ra:= Int(Random(1*1000));
  if Chart1.Extent.YMax<Ra then Chart1.Extent.YMax:=Ra+1;
  if ListChartSource4.Count < MaxRecordTime then ListChartSource2.Add(ListChartSource2.Count,Ra,Txt,clMaroon); //V_DC  DB1_DBD72

  Ra:= DB1_DBD76.Value;
  if ChartSimulate then Ra:= Int(Random(1*1000));
  if Chart1.Extent.YMax<Ra then Chart1.Extent.YMax:=Ra+1;
  if ListChartSource5.Count < MaxRecordTime then ListChartSource3.Add(ListChartSource3.Count,Ra,Txt,clFuchsia);   //LineSpeed  DB1_DBD76

  Ra:= DB1_DBD252.Value;
  if ChartSimulate then Ra:= Int(Random(1*1000));
  if Chart1.Extent.YMax<Ra then Chart1.Extent.YMax:=Ra+1;
  if ListChartSource5.Count < MaxRecordTime then ListChartSource4.Add(ListChartSource4.Count,Ra,Txt,clGreen);   //Power_Out  DB1_DBD252

  Ra:= DB1_DBD258.Value;
  if ChartSimulate then Ra:= Int(Random(1*1000));
  if Chart1.Extent.YMax<Ra then Chart1.Extent.YMax:=Ra+1;
  if ListChartSource5.Count < MaxRecordTime then ListChartSource5.Add(ListChartSource5.Count,Ra,Txt,clRed);   //V_Out  DB1_DBD258

If (ListChartSource1.Count>240) and (Chart1.Tag = 0) then
  begin
    Chart1.BottomAxis.Range.Max:=ListChartSource1.Count;
    //Chart1.BottomAxis.Range.UseMax:=True;
    Chart1.BottomAxis.Range.Min:=ListChartSource1.Count-240;
    //Chart1.BottomAxis.Range.UseMin:=True;
    Chart1.Extent.XMin:=ListChartSource1.Count-240;  Chart1.Extent.XMax:=ListChartSource1.Count;
  end;
  If (ListChartSource1.Count<=240) and (Chart1.Tag = 0) then
  begin
    if(ListChartSource1.Count<=60)then
    Chart1.BottomAxis.Range.Max:=60;
    if(ListChartSource1.Count>60)then
    Chart1.BottomAxis.Range.Max:=ListChartSource1.Count;
    Chart1.BottomAxis.Range.Min:=0;
    Chart1.Extent.XMin:=0;
    if(ListChartSource1.Count<=60)then
    Chart1.Extent.XMax:=60;
    if(ListChartSource1.Count>60)then
    Chart1.Extent.XMax:=ListChartSource1.Count;
  end;
end;

procedure TForm1.Timer2Timer(Sender: TObject);
begin


end;

procedure TForm1.V_DC_CheckBoxEditingDone(Sender: TObject);
begin
  Chart1LineSeries2.Active:=V_DC_CheckBox.Checked;
end;

procedure TForm1.V_Out_CheckBoxEditingDone(Sender: TObject);
begin
  Chart1LineSeries5.Active:=V_Out_CheckBox.Checked;
end;

end.

