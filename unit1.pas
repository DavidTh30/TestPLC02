unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls,
  Menus, ComCtrls, uCmdBox, TAGraph, TASources, TATransformations, tcp_udpport,
  ISOTCPDriver, PLCBlock, PLCBlockElement, TagBit, HMILabel, jwawindows, JWAIPTYPES,
   hmi_polyline, TASeries, TAChartUtils, LazUTF8, process,
   windows, AsyncProcess, LCLType, ECRuler, WinSock, JwaIpHlpAPI, JwaIpRtrMib;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button3: TButton;
    Button6: TButton;
    Button7: TButton;
    CloseDisconnectPanel: TButton;
    ButtonComputerName: TButton;
    ButtonCurrentActToFile: TButton;
    ButtonCurrentActual: TButton;
    Button4: TButton;
    Button5: TButton;
    AutoPingBatchFile: TButton;
    ButtonPing: TButton;
    ButtonIpconfig: TButton;
    ButtonIpconfigAl: TButton;
    ButtonGetIPAddress: TButton;
    DB1_22: TPLCBlock;
    DB1_26: TPLCBlock;
    DB1_30: TPLCBlock;
    DB1_34: TPLCBlock;
    DB1_38: TPLCBlock;
    DB1_DBB22: TPLCBlockElement;
    DB1_DBB22_bit0: TTagBit;
    DB1_DBB22_bit1: TTagBit;
    DB1_DBB22_bit2: TTagBit;
    DB1_DBB22_bit3: TTagBit;
    DB1_DBB22_bit4: TTagBit;
    DB1_DBB22_bit5: TTagBit;
    DB1_DBB22_bit6: TTagBit;
    DB1_DBB22_bit7: TTagBit;
    DB1_DBB26: TPLCBlockElement;
    DB1_DBB26_bit0: TTagBit;
    DB1_DBB26_bit1: TTagBit;
    DB1_DBB26_bit2: TTagBit;
    DB1_DBB26_bit3: TTagBit;
    DB1_DBB26_bit4: TTagBit;
    DB1_DBB26_bit5: TTagBit;
    DB1_DBB26_bit6: TTagBit;
    DB1_DBB26_bit7: TTagBit;
    DB1_DBB30: TPLCBlockElement;
    DB1_DBB30_bit0: TTagBit;
    DB1_DBB30_bit1: TTagBit;
    DB1_DBB30_bit2: TTagBit;
    DB1_DBB30_bit3: TTagBit;
    DB1_DBB30_bit4: TTagBit;
    DB1_DBB30_bit5: TTagBit;
    DB1_DBB30_bit6: TTagBit;
    DB1_DBB30_bit7: TTagBit;
    DB1_DBB34: TPLCBlockElement;
    DB1_DBB34_bit0: TTagBit;
    DB1_DBB34_bit1: TTagBit;
    DB1_DBB34_bit2: TTagBit;
    DB1_DBB34_bit3: TTagBit;
    DB1_DBB34_bit4: TTagBit;
    DB1_DBB34_bit5: TTagBit;
    DB1_DBB34_bit6: TTagBit;
    DB1_DBB34_bit7: TTagBit;
    DB1_DBB38: TPLCBlockElement;
    DB1_DBB38_bit0: TTagBit;
    DB1_DBB38_bit1: TTagBit;
    DB1_DBB38_bit2: TTagBit;
    DB1_DBB38_bit3: TTagBit;
    DB1_DBB38_bit4: TTagBit;
    DB1_DBB38_bit5: TTagBit;
    DB1_DBB38_bit6: TTagBit;
    DB1_DBB38_bit7: TTagBit;
    DB1_DBD278: TPLCBlockElement;
    DB1_DBD48: TPLCBlockElement;
    DB1_48: TPLCBlock;
    DB1_278: TPLCBlock;
    ECRuler1: TECRuler;
    ECRuler2: TECRuler;
    ECRuler3: TECRuler;
    Edit1: TEdit;
    Flags_From_MB0: TPLCBlock;
    FProcess: TAsyncProcess;
    Button1: TButton;
    Button2: TButton;
    ButtonSimulate: TButton;
    Chart1: TChart;
    Chart1LineSeries1: TLineSeries;
    Chart1LineSeries2: TLineSeries;
    Chart1LineSeries3: TLineSeries;
    Chart1LineSeries4: TLineSeries;
    Chart1LineSeries5: TLineSeries;
    ChartAxisTransformations1: TChartAxisTransformations;
    ChartAxisTransformations1LinearAxisTransform1: TLinearAxisTransform;
    CmdBox1: TCmdBox;
    ConnectMenu: TPopupMenu;
    Connect: TMenuItem;
    Disconnect: TMenuItem;
    HMILabel1: THMILabel;
    HMIPolyline1: THMIPolyline;
    HMIPolyline2: THMIPolyline;
    HMIPolyline3: THMIPolyline;
    HMIPolyline4: THMIPolyline;
    HMI_SpecificPowerAct: THMILabel;
    Image_Info: TImage;
    ISOTCPDriver1: TISOTCPDriver;
    Label1: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label_OperateValue: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label_PowerLevel: TLabel;
    Label_PLset: TLabel;
    Label_Alarms: TLabel;
    Label_Warnings: TLabel;
    Label_Emergency: TLabel;
    Label_PowerAlarm: TLabel;
    Label_OzoneSuction: TLabel;
    Label_VccFault: TLabel;
    Label_ThermalSwitch: TLabel;
    Label_OverloadIdc: TLabel;
    Label_HVDischarge: TLabel;
    Label_InterlockCor: TLabel;
    Label_LowSpeed: TLabel;
    Label_StationOpen: TLabel;
    Lable_SpecificPowerAct: TLabel;
    Label_Speed: TLabel;
    Label_PwrOut: TLabel;
    Label_Idc: TLabel;
    Label_PL: TLabel;
    Label_ACT: TLabel;
    Label_Vdc: TLabel;
    Label_Vout: TLabel;
    MB0: TPLCBlockElement;
    MB0_bit0: TTagBit;
    MB0_bit1: TTagBit;
    MB0_bit2: TTagBit;
    MB0_bit3: TTagBit;
    MB0_bit4: TTagBit;
    MB0_bit5: TTagBit;
    MB0_bit6: TTagBit;
    MB0_bit7: TTagBit;
    Memo01SelectAll: TMenuItem;
    Memo01Copy: TMenuItem;
    Memo01Clear: TMenuItem;
    Memo01PopupMenu: TPopupMenu;
    Memo01Tool: TMenuItem;
    Memo01Getfileandfolder: TMenuItem;
    Memo01IpconfigAll: TMenuItem;
    Memo01Ping: TMenuItem;
    Memo01Ipconfig: TMenuItem;
    ConnectStep5: TShape;
    ConnectStep6: TShape;
    ConnectStep7: TShape;
    ConnectStep8: TShape;
    ConnectStep9: TShape;
    ConnectStep10: TShape;
    ConnectStep1: TShape;
    ConnectStep2: TShape;
    ConnectStep3: TShape;
    ConnectStep4: TShape;
    MenuComputerName: TMenuItem;
    MenuCurrentActualToFile: TMenuItem;
    MenuIPAddress: TMenuItem;
    Auto_Ping_Batch_File: TMenuItem;
    MenuItemCurrentActual: TMenuItem;
    Disconnect_Panel: TPanel;
    ProgressBar_PwrOut: TProgressBar;
    ProgressBar_PL: TProgressBar;
    ProgressBar_ACT: TProgressBar;
    Shape_ThermalSwitch: TShape;
    Shape_OverloadIdc: TShape;
    Shape_HVDischarge: TShape;
    Shape_InterlockCor: TShape;
    Shape_LowSpeed: TShape;
    Shape_StationOpen: TShape;
    Shape_PowerAlarm: TShape;
    Shape_Alarms: TShape;
    Shape_Warnings: TShape;
    Shape_Emergency: TShape;
    Shape_OzoneSuction: TShape;
    Shape_VccFault: TShape;
    Shape_PowerLevel: TShape;
    Shape_OperatValue: TShape;
    Shape_PwrRegMan: TShape;
    Shape_AutSpecPw: TShape;
    Shape9: TShape;
    TabSheet4: TTabSheet;
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
    HMI_Idc: THMILabel;
    HMI_Vdc: THMILabel;
    HMI_Vout: THMILabel;
    HMI_Speed: THMILabel;
    HMI_PwrOut: THMILabel;
    ImageList1: TImageList;
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
    procedure AutoPingBatchFileClick(Sender: TObject);
    procedure Auto_Ping_Batch_FileClick(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure ButtonComputerNameClick(Sender: TObject);
    procedure ButtonCurrentActToFileClick(Sender: TObject);
    procedure ButtonCurrentActualClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure ButtonSimulateClick(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure ButtonPingClick(Sender: TObject);
    procedure ButtonIpconfigClick(Sender: TObject);
    procedure ButtonIpconfigAlClick(Sender: TObject);
    procedure ButtonGetIPAddressClick(Sender: TObject);
    procedure Chart1Click(Sender: TObject);
    procedure Chart1DragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure Chart1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Chart1MouseEnter(Sender: TObject);
    procedure Chart1MouseLeave(Sender: TObject);
    procedure CloseDisconnectPanelClick(Sender: TObject);
    procedure ConnectClick(Sender: TObject);
    procedure DisconnectClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormMouseWheel(Sender: TObject; Shift: TShiftState;
      WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean);
    procedure ChartZoomOutMenuClick(Sender: TObject);
    procedure ChartRefreshMenuClick(Sender: TObject);
    procedure FProcessReadData(Sender: TObject);
    procedure FProcessTerminate(Sender: TObject);
    procedure I_DC_CheckBoxEditingDone(Sender: TObject);
    procedure LineSpeed_CheckBoxEditingDone(Sender: TObject);
    procedure Memo01ClearClick(Sender: TObject);
    procedure Memo01CopyClick(Sender: TObject);
    procedure Memo01GetfileandfolderClick(Sender: TObject);
    procedure Memo01IpconfigAllClick(Sender: TObject);
    procedure Memo01IpconfigClick(Sender: TObject);
    procedure Memo01PingClick(Sender: TObject);
    procedure Memo01SelectAllClick(Sender: TObject);
    procedure Memo1KeyPress(Sender: TObject; var Key: char);
    procedure MenuComputerNameClick(Sender: TObject);
    procedure MenuCurrentActualToFileClick(Sender: TObject);
    procedure MenuIPAddressClick(Sender: TObject);
    procedure MenuItem3Click(Sender: TObject);
    procedure MenuItem4Click(Sender: TObject);
    procedure ChartZoomInMenuClick(Sender: TObject);
    procedure MenuItemCurrentActualClick(Sender: TObject);
    procedure Power_Out_CheckBoxEditingDone(Sender: TObject);
    procedure Shape_PowerLevelChangeBounds(Sender: TObject);
    procedure TabSheet1ContextPopup(Sender: TObject; MousePos: TPoint;
      var Handled: Boolean);
    procedure Timer1Timer(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    procedure V_DC_CheckBoxEditingDone(Sender: TObject);
    procedure V_Out_CheckBoxEditingDone(Sender: TObject);
  private
    function getlocalip:string;
    function ReadOutput(const aproc : TAsyncProcess) : string;
    procedure Log(const s : string);
    procedure Log(Const Fmt : String; const Args : Array of const);
  public
    Function CheckFile(C_DNAME: string; C_FNAME: string; Debug_:TMemo):boolean;
    Function CheckDirectory(C_DNAME: string;Debug_:TMemo):boolean;
    Function DoubleBooleanToStr(DoubleBoolean: double):string;
  end;

var
  Form1: TForm1;
  FileName_: string;
  Directory_:string;
  Chart_Enter:boolean;
  Chatr_Zoom:integer;
  ChartSimulate:boolean;
  CPU_Clock_counter:integer;
  CPU_Clock_OldBit:Boolean;
  Old_CPU_Clock_counter:integer;
  Error_CPU_Clock_counter:integer;

implementation

uses LCLProc;

//function GetIpAddrTable( pIpAddrTable: Array of Byte; var pdwSize: Cardinal; bOrder: WordBool ): DWORD; external 'GetIpAddrTable@IpHlpApi.dll stdcall';
//function GetIpAddrTable( pIpAddrTable: Array of Byte; var pdwSize: Cardinal; bOrder: WordBool ): DWORD; stdcall; external 'IPHLPAPI.DLL';
//function GetIfTable: DWORD; stdcall; external 'IPHLPAPI.DLL';
//function GetIpAddrTable: DWORD; stdcall; external 'IPHLPAPI.DLL';
{$R *.lfm}

{ TForm1 }
//procedure GetIpAddresses(Addresses : TStringList);
//var
// Size : Cardinal;
// Buffer : Array of Byte;
// IpAddr : String;
// AddrCount : Integer;
// I, J : Integer;
//begin
//  { Find Size }
//  if GetIpAddrTable(Buffer,Size,False) = ERROR_INSUFFICIENT_BUFFER then
//  begin
//     { Allocate Buffer with large enough size }
//     SetLength(Buffer,Size);
//     { Get List of IP Addresses into Buffer }
//     if GetIpAddrTable(Buffer,Size,True) = 0 then
//     begin
//       { Find out how many addresses will be returned. }
//       AddrCount := (Buffer[1] * 256) + Buffer[0];
//       { Loop through addresses. }
//       For I := 0 to AddrCount - 1 do
//       begin
//         IpAddr := '';
//         { Loop through each byte of the address }
//         For J := 0 to 3 do
//         begin
//           if J > 0 then
//             IpAddr := IpAddr + '.';
//           { Navigate through record structure to find correct byte of Addr }
//           IpAddr := IpAddr + IntToStr(Buffer[I*24+J+4]);
//         end;
//         Addresses.Add(IpAddr);
//       end;
//     end;
//  end;
//end;

function TForm1.getlocalip:string;
type
  TaPInAddr = array [0..10] of PInAddr;
  PaPInAddr = ^TaPInAddr;
var
  phe : PHostEnt;
  pptr : PaPInAddr;
  buffer : array [0..63] of char;
  i : integer;
  GInitData : TWSADATA;
begin
  WSAStartup($101, GInitData);
  Result:='';
  GetHostName(buffer, sizeof(buffer));
  phe:=gethostbyname(buffer);
  if phe = nil then
  begin
    Exit;
  end;
  pptr:= PaPInAddr(phe^.h_addr_list);
  i:=0;
  while not (pptr^[i] = nil) do
  begin
    result:=result+'['+StrPas(inet_ntoa(pptr^[i]^))+']';
    Inc(i);
  end;
  WSACleanup;
end;

function TForm1.ReadOutput(const aproc : TAsyncProcess) : string;
var tempStrings : TStringList;
begin
  tempStrings := TStringList.Create;
  try
    if assigned(aproc.Output) then
      tempStrings.LoadFromStream(aproc.Output);
    Result := tempStrings.Text;
  finally
    tempStrings.Free;
  end;
end;

procedure TForm1.Log(const s : string);
begin
  Memo1.Lines.Add(s);
end;

procedure TForm1.Log(const Fmt : String; const Args : array of const);
begin
  Log(Format(Fmt,Args));
end;

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
Function TForm1.DoubleBooleanToStr(DoubleBoolean: double):string;
begin
  result:='False';
  if DoubleBoolean<=0 then result:='False';
  if DoubleBoolean>0 then result:='True';
end;

procedure TForm1.ButtonSimulateClick(Sender: TObject);
begin
  ChartSimulate:=not ChartSimulate;
end;

procedure TForm1.Button4Click(Sender: TObject);
var
  AProcess: TProcess;
begin
  // Now we will create the TProcess object, and
  // assign it to the var AProcess.
  AProcess := TProcess.Create(nil);

  // Tell the new AProcess what the command to execute is.
  // Let's use the Free Pascal compiler (i386 version that is)
  AProcess.Executable:= 'ppc386';

  // Pass -h together with ppc386 so actually 'ppc386 -h' is executed:
  AProcess.Parameters.Add('-h');

  // We will define an option for when the program
  // is run. This option will make sure that our program
  // does not continue until the program we will launch
  // has stopped running.                vvvvvvvvvvvvvv
  AProcess.Options := AProcess.Options + [poWaitOnExit];

  // Now let AProcess run the program
  AProcess.Execute;

  // This is not reached until ppc386 stops running.
  FProcess.Free;
end;

procedure TForm1.Button5Click(Sender: TObject);
const
  BUF_SIZE = 2048; // Buffer size for reading the output in chunks

var
  AProcess     : TProcess;
  OutputStream : TStream;
  BytesRead    : longint;
  Buffer       : array[1..BUF_SIZE] of byte;
begin
  // Set up the process; as an example a recursive directory search is used
  // because that will usually result in a lot of data.
  AProcess := TProcess.Create(nil);

  // The commands for Windows and *nix are different hence the $IFDEFs
  {$IFDEF Windows}
    // In Windows the dir command cannot be used directly because it's a build-in
    // shell command. Therefore cmd.exe and the extra parameters are needed.
    AProcess.Executable := 'c:\windows\system32\cmd.exe';
    AProcess.Parameters.Add('/c');
    AProcess.Parameters.Add('dir /w');     //'dir /s c:\windows' //'dir /w'
  {$ENDIF Windows}

  {$IFDEF Unix}
    AProcess.Executable := '/bin/ls';

    {$IFDEF Darwin}
      AProcess.Parameters.Add('-recursive');
      AProcess.Parameters.Add('-all');
    {$ENDIF Darwin}

    {$IFDEF Linux}
      AProcess.Parameters.Add('--recursive');
      AProcess.Parameters.Add('--all');
    {$ENDIF Linux}

    {$IFDEF FreeBSD}
      AProcess.Parameters.Add('-R');
      AProcess.Parameters.Add('-a');
    {$ENDIF FreeBSD}

    AProcess.Parameters.Add('-l');
  {$ENDIF Unix}

  // Process option poUsePipes has to be used so the output can be captured.
  // Process option poWaitOnExit can not be used because that would block
  // this program, preventing it from reading the output data of the process.
  AProcess.Options := [poUsePipes];

  // Start the process (run the dir/ls command)
  AProcess.Execute;

  // Create a stream object to store the generated output in. This could
  // also be a file stream to directly save the output to disk.
  OutputStream := TMemoryStream.Create;

  // All generated output from AProcess is read in a loop until no more data is available
  repeat
    // Get the new data from the process to a maximum of the buffer size that was allocated.
    // Note that all read(...) calls will block except for the last one, which returns 0 (zero).
    BytesRead := AProcess.Output.Read(Buffer, BUF_SIZE);

    // Add the bytes that were read to the stream for later usage
    OutputStream.Write(Buffer, BytesRead)

  until BytesRead = 0;  // Stop if no more data is available

  // The process has finished so it can be cleaned up
  AProcess.Free;

  // Now that all data has been read it can be used; for example to save it to a file on disk
  with TFileStream.Create('output.txt', fmCreate) do
  begin
    OutputStream.Position := 0; // Required to make sure all data is copied from the start
    CopyFrom(OutputStream, OutputStream.Size);
    Free
  end;

  // Or the data can be shown on screen
  with TStringList.Create do
  begin
    OutputStream.Position := 0; // Required to make sure all data is copied from the start
    LoadFromStream(OutputStream);
    Log('>>: "%s"',[Text]);
    //writeln(Text);
    Log('--- Number of lines = ',[Count]);
    //writeln('--- Number of lines = ', Count, '----');
    Free
  end;

  // Clean up
  OutputStream.Free;
end;

procedure TForm1.ButtonPingClick(Sender: TObject);
const
  BUF_SIZE = 2048; // Buffer size for reading the output in chunks

var
  AProcess     : TProcess;
  OutputStream : TStream;
  BytesRead    : longint;
  Buffer       : array[1..BUF_SIZE] of byte;
begin
  // Set up the process; as an example a recursive directory search is used
  // because that will usually result in a lot of data.
  AProcess := TProcess.Create(nil);

  // The commands for Windows and *nix are different hence the $IFDEFs
  {$IFDEF Windows}
    // In Windows the dir command cannot be used directly because it's a build-in
    // shell command. Therefore cmd.exe and the extra parameters are needed.
    AProcess.Executable := 'c:\windows\system32\cmd.exe';
    AProcess.Parameters.Add('/c');
    AProcess.Parameters.Add('ping '+Edit1.Caption);     //'dir /s c:\windows' //'dir /w'
  {$ENDIF Windows}

  // Process option poUsePipes has to be used so the output can be captured.
  // Process option poWaitOnExit can not be used because that would block
  // this program, preventing it from reading the output data of the process.
  AProcess.Options := [poUsePipes];

  AProcess.ShowWindow:=swoHide;   //swoShow   //swoHide
  Log('>> %s',['Please wait']);

  // Start the process (run the dir/ls command)
  AProcess.Execute;

  // Create a stream object to store the generated output in. This could
  // also be a file stream to directly save the output to disk.
  OutputStream := TMemoryStream.Create;

  // All generated output from AProcess is read in a loop until no more data is available
  repeat
    // Get the new data from the process to a maximum of the buffer size that was allocated.
    // Note that all read(...) calls will block except for the last one, which returns 0 (zero).
    BytesRead := AProcess.Output.Read(Buffer, BUF_SIZE);

    // Add the bytes that were read to the stream for later usage
    OutputStream.Write(Buffer, BytesRead)

  until BytesRead = 0;  // Stop if no more data is available

  // The process has finished so it can be cleaned up
  AProcess.Free;

  // Or the data can be shown on screen
  with TStringList.Create do
  begin
    OutputStream.Position := 0; // Required to make sure all data is copied from the start
    LoadFromStream(OutputStream);
    Log('>> %s',[Text]);
    Free
  end;

  // Clean up
  OutputStream.Free;
end;

procedure TForm1.ButtonIpconfigClick(Sender: TObject);
const
  BUF_SIZE = 2048; // Buffer size for reading the output in chunks

var
  AProcess     : TProcess;
  OutputStream : TStream;
  BytesRead    : longint;
  Buffer       : array[1..BUF_SIZE] of byte;
begin
  // Set up the process; as an example a recursive directory search is used
  // because that will usually result in a lot of data.
  AProcess := TProcess.Create(nil);

  // The commands for Windows and *nix are different hence the $IFDEFs
  {$IFDEF Windows}
    // In Windows the dir command cannot be used directly because it's a build-in
    // shell command. Therefore cmd.exe and the extra parameters are needed.
    AProcess.Executable := 'c:\windows\system32\cmd.exe';
    AProcess.Parameters.Add('/c');
    AProcess.Parameters.Add('ipconfig');     //'dir /s c:\windows' //'dir /w'
  {$ENDIF Windows}

  // Process option poUsePipes has to be used so the output can be captured.
  // Process option poWaitOnExit can not be used because that would block
  // this program, preventing it from reading the output data of the process.
  AProcess.Options := [poUsePipes];

  AProcess.ShowWindow:=swoHide;   //swoShow   //swoHide
  Log('>> %s',['Please wait']);

  // Start the process (run the dir/ls command)
  AProcess.Execute;

  // Create a stream object to store the generated output in. This could
  // also be a file stream to directly save the output to disk.
  OutputStream := TMemoryStream.Create;

  // All generated output from AProcess is read in a loop until no more data is available
  repeat
    // Get the new data from the process to a maximum of the buffer size that was allocated.
    // Note that all read(...) calls will block except for the last one, which returns 0 (zero).
    BytesRead := AProcess.Output.Read(Buffer, BUF_SIZE);

    // Add the bytes that were read to the stream for later usage
    OutputStream.Write(Buffer, BytesRead)

  until BytesRead = 0;  // Stop if no more data is available

  // The process has finished so it can be cleaned up
  AProcess.Free;

  // Or the data can be shown on screen
  with TStringList.Create do
  begin
    OutputStream.Position := 0; // Required to make sure all data is copied from the start
    LoadFromStream(OutputStream);
    Log('>> %s',[Text]);
    Free
  end;

  // Clean up
  OutputStream.Free;
end;

procedure TForm1.ButtonIpconfigAlClick(Sender: TObject);
const
  BUF_SIZE = 2048; // Buffer size for reading the output in chunks

var
  AProcess     : TProcess;
  OutputStream : TStream;
  BytesRead    : longint;
  Buffer       : array[1..BUF_SIZE] of byte;
begin
  // Set up the process; as an example a recursive directory search is used
  // because that will usually result in a lot of data.
  AProcess := TProcess.Create(nil);

  // The commands for Windows and *nix are different hence the $IFDEFs
  {$IFDEF Windows}
    // In Windows the dir command cannot be used directly because it's a build-in
    // shell command. Therefore cmd.exe and the extra parameters are needed.
    AProcess.Executable := 'c:\windows\system32\cmd.exe';
    AProcess.Parameters.Add('/c');
    AProcess.Parameters.Add('ipconfig /all');     //'dir /s c:\windows' //'dir /w'
  {$ENDIF Windows}

  // Process option poUsePipes has to be used so the output can be captured.
  // Process option poWaitOnExit can not be used because that would block
  // this program, preventing it from reading the output data of the process.
  AProcess.Options := [poUsePipes];

  AProcess.ShowWindow:=swoHide;   //swoShow   //swoHide
  Log('>> %s',['Please wait']);

  // Start the process (run the dir/ls command)
  AProcess.Execute;

  // Create a stream object to store the generated output in. This could
  // also be a file stream to directly save the output to disk.
  OutputStream := TMemoryStream.Create;

  // All generated output from AProcess is read in a loop until no more data is available
  repeat
    // Get the new data from the process to a maximum of the buffer size that was allocated.
    // Note that all read(...) calls will block except for the last one, which returns 0 (zero).
    BytesRead := AProcess.Output.Read(Buffer, BUF_SIZE);

    // Add the bytes that were read to the stream for later usage
    OutputStream.Write(Buffer, BytesRead)

  until BytesRead = 0;  // Stop if no more data is available

  // The process has finished so it can be cleaned up
  AProcess.Free;

  // Or the data can be shown on screen
  with TStringList.Create do
  begin
    OutputStream.Position := 0; // Required to make sure all data is copied from the start
    LoadFromStream(OutputStream);
    Log('>> %s',[Text]);
    Free
  end;

  // Clean up
  OutputStream.Free;
end;

procedure TForm1.ButtonGetIPAddressClick(Sender: TObject);
var
  Ret: DWord;
  Table: PMib_IPAddrTable;
  TableSize: ULong;
  i: Integer;
  //Row: PMib_IPAddrRow;
  Addr: IN_ADDR;
begin
  // We begin by assuming there's just one entry, so we allocate space
  // for that one
  TableSize := SizeOf(Table^);
  GetMem(Table, TableSize);
  try
    // Request a list of IP addresses, unsorted
    Ret := GetIpAddrTable(Table, TableSize, False);
    case Ret of
      No_Error: ; // No error. Continue at the end of the case statement
      Error_Insufficient_Buffer:
      begin
        // Oops. Space for just one entry wasn't enough. Allocate more.
        ReallocMem(Table, TableSize);
        Ret := GetIpAddrTable(Table, TableSize, False);
        if Ret <> No_Error then
        begin
          // Function expects signed value, but Ret is unsigned. Type
          // cast to avoid range-check error, however unlikely.
          RaiseLastOSError(Integer(Ret));
        end;
      end;
    else
      RaiseLastOSError(Integer(Ret));
    end;
  //writeln(Table.dwNumEntries, ' entries:');

  if Table^.dwNumEntries > 0 then
  begin
    //Row := @Table^.Table[0];
    //for i := 0 to Pred(Table^.dwNumEntries) do
    //begin
    //  //writeln(inet_ntoa(in_addr(Row.dwAddr)));
    //  log(inet_ntoa(in_addr(Row^.dwAddr)));
    //  Inc(Row);
    //end;

    for i := 0 to Table^.dwNumEntries-1 do
    begin
      // Convert ADDR to String and add to IPList
      Addr.S_addr := Table^.table[i].dwAddr;
      // Prevent implicit string conversion warning in D2009 by explicit cast to string
      log(inet_ntoa(Addr));
    end;

  end;
  finally
    FreeMem(Table);
  end;
end;

procedure TForm1.Button1Click(Sender: TObject);
const
  READ_BYTES = 2048;
var
  InputStr: String;
  CmdProcess: TProcess;
  MemStr: TMemoryStream;
  StrList: TStringList;
  n: Integer;
  ErrMsg: PChar;
begin
  try
    CmdProcess:=TProcess.Create(nil);
    MemStr:=TMemoryStream.Create;
    StrList:=TStringList.Create;
    MemStr.SetSize(READ_BYTES);
    InputStr:='dir';
    with CmdProcess do begin
      CommandLine:=InputStr;
      Options:=[poUsePipes,poStderrToOutPut];
      ShowWindow:=swoShow;  //swoShow   //swoHide
      Execute;
      while Running do begin
        n:=Output.Read(MemStr.Memory^,READ_BYTES);
        if n>0 then begin
          StrList.LoadFromStream(MemStr);
          CmdBox1.Write(StrList.Text); // CmdBox.WriteStream causes Access Violation
          MemStr.Clear;
        end else
          Sleep(100);
      end;
    end;
  except
    on e: EProcess do begin
      {$IFDEF Windows}
      FormatMessage(
        FORMAT_MESSAGE_ALLOCATE_BUFFER or FORMAT_MESSAGE_FROM_SYSTEM,
        nil,GetLastError,MAKELANGID(LANG_NEUTRAL,SUBLANG_DEFAULT),
        @ErrMsg,0,nil
      );
      {$ELSE}
      ErrMsg:=@e.Message[1];
      {$ENDIF}
      CmdBox1.WriteLn(ErrMsg);

      //SetCmdBoxPrompt(FPath+'>');
      Exit;
    end;
  on e: Exception do begin
      MessageDlg('Error',e.Message,mtError,[mbOK],0);
      Exit;
    end;
  end;
  repeat
    n:=CmdProcess.Output.Read(MemStr.Memory^,READ_BYTES);
    if n>0 then CmdBox1.WriteStream(MemStr);
  until n<=0;
  StrList.Free;
  MemStr.Free;
  CmdProcess.Free;
  //SetCmdBoxPrompt(FPath+'>');
end;

procedure TForm1.ButtonComputerNameClick(Sender: TObject);
var
ComputerName: Array [0 .. 256] of char;
Size: DWORD;
begin
     Size := 256;
     GetComputerName(ComputerName, Size);
     Log('>> %s',[ComputerName]);
end;

procedure TForm1.Button3Click(Sender: TObject);
var
  Ret: DWord;
  Table: PMib_IPAddrTable;
  TableSize: ULong;
  i: Integer;
  Row: PMib_IPAddrRow;
  Addr: IN_ADDR;
begin
  // We begin by assuming there's just one entry, so we allocate space
  // for that one
  TableSize := SizeOf(Table^);
  GetMem(Table, TableSize);
  try
    // Request a list of IP addresses, unsorted
    Ret := GetIpAddrTable(Table, TableSize, False);
    case Ret of
      No_Error: ; // No error. Continue at the end of the case statement
      Error_Insufficient_Buffer:
      begin
        // Oops. Space for just one entry wasn't enough. Allocate more.
        ReallocMem(Table, TableSize);
        Ret := GetIpAddrTable(Table, TableSize, False);
        if Ret <> No_Error then
        begin
          // Function expects signed value, but Ret is unsigned. Type
          // cast to avoid range-check error, however unlikely.
          RaiseLastOSError(Integer(Ret));
        end;
      end;
    else
      RaiseLastOSError(Integer(Ret));
    end;
  //writeln(Table.dwNumEntries, ' entries:');

  if Table^.dwNumEntries > 0 then
  begin
    Row := @Table^.Table[0];
    for i := 0 to Pred(Table^.dwNumEntries) do
    begin
      //writeln(inet_ntoa(in_addr(Row.dwAddr)));
      log(inet_ntoa(in_addr(Row^.dwAddr)));
      Inc(Row);
    end;

    for i := 0 to Table^.dwNumEntries-1 do
    begin
      // Convert ADDR to String and add to IPList
      Addr.S_addr := Table^.table[i].dwAddr;
      // Prevent implicit string conversion warning in D2009 by explicit cast to string
      log(inet_ntoa(Addr));
    end;
  end;
  finally
    FreeMem(Table);
  end;
end;

procedure TForm1.AutoPingBatchFileClick(Sender: TObject);
begin
  //sc query  Winmgmt | find "RUNNING" >nul 2>&1 && (echo service is started) || (echo service is stopped)
  Log('----- AutoPing.bat -----');
  Log('@echo off');
  Log(':LOOPSTART');
  Log('set IPADDRESS=10.10.10.40');
  Log('set File=Ping_%date:~4,2%_%date:~7,2%_%date:~10,4%.log');
  Log('echo ------------------------ >> %File%');
  Log('echo %date% %time% >> %File%');
  Log('rem ping %IPADDRESS% -n 1 -I 10 | find "Reply from" >> %File%');
  Log('ping %IPADDRESS% -n 1 -l 10 | find "Reply from" > nul 2>&1 >> %File% || (echo Request timed out) >> %File%');
  Log('rem ping 127.0.0.1 -n 1 > NUL');
  Log('rem sleep 1000');
  Log('rem timeout /t 1 /nobreak');
  Log('timeout 1 > NUL');
  Log('GOTO LOOPSTART');
end;

procedure TForm1.Auto_Ping_Batch_FileClick(Sender: TObject);
begin
  AutoPingBatchFileClick(Sender);
end;

procedure TForm1.Button6Click(Sender: TObject);
const
CFormatIPMask = '%d.%d.%d.%d';
var
 //SL : TStringList;
  VWSAData: TWSAData;
  VName: string;
  VHostEnt: PHostEnt;
  Result_:string;
begin

  {$IFDEF MSWINDOWS}
  {$HINTS OFF}
  WSAStartup(2, VWSAData);
  {$HINTS ON}
  SetLength(VName, 255);
  GetHostName(PChar(VName), 255);
  //Log('>> %s',[VName]);
  SetLength(VName, StrLen(PChar(VName)));
  VHostEnt := GetHostByName(PChar(VName));
  Result_ := Format(CFormatIPMask, [Byte(VHostEnt^.h_addr^[0]), Byte(VHostEnt^.h_addr^[1]),Byte(VHostEnt^.h_addr^[2]), Byte(VHostEnt^.h_addr^[3])]);
  Log('>> %s',[Result_]);
  WSACleanup;
  {$ENDIF}

  Log('>> %s',[getlocalip]);

  //SL := TStringList.Create;
  //GetIpAddresses(SL);
  //MsgBox(SL.Text, mbInformation, MB_OK);
  //Log('>> %s',[SL.Text]);
  //SL.Free;
end;

procedure TForm1.Button7Click(Sender: TObject);
var
  pAdapterInfo: PIP_ADAPTER_INFO;
  AdapterInfo: IP_ADAPTER_INFO;
  BufLen: DWORD;
  Status: DWORD;
  strMAC: String;
  i: Integer;
begin
  BufLen:= sizeof(AdapterInfo);
  pAdapterInfo:= @AdapterInfo;
  Status:= GetAdaptersInfo(nil, BufLen);
  pAdapterInfo:= AllocMem(BufLen);
  try
    Status:= GetAdaptersInfo(pAdapterInfo, BufLen);
    if (Status <> ERROR_SUCCESS) then
    begin
      case Status of
        ERROR_NOT_SUPPORTED: Memo1.Lines.Add('GetAdaptersInfo is not supported by the operating ' +
          'system running on the local computer.');
        ERROR_NO_DATA: Memo1.Lines.Add('No network adapter on the local computer.');
      else
        Memo1.Lines.Add('GetAdaptersInfo failed with error #' + IntToStr(Status));
      end;
      Dispose(pAdapterInfo);
      exit;
    end;

    while (pAdapterInfo <> nil) do
    begin
      memo1.Lines.Add('----------------------------------------------');
      memo1.Lines.Add('Description: ' + pAdapterInfo^.Description);
      memo1.Lines.Add('Name: ' + pAdapterInfo^.AdapterName);
      strMAC := '';
      for i := 0 to pAdapterInfo^.AddressLength - 1 do
         strMAC := strMAC + '-' + IntToHex(pAdapterInfo^.Address[i], 2);
      memo1.Lines.Add('MAC address: ' + Copy(strMAC, 2, Length(strMAC) - 1));
      memo1.Lines.Add('IP address: ' + pAdapterInfo^.IpAddressList.IpAddress.S);
      memo1.Lines.Add('IP subnet mask: ' + pAdapterInfo^.IpAddressList.IpMask.S);
      memo1.Lines.Add('Gateway: ' + pAdapterInfo^.GatewayList.IpAddress.S);
      memo1.Lines.Add('DHCP enabled: ' + IntTOStr(pAdapterInfo^.DhcpEnabled));
      memo1.Lines.Add('DHCP: ' + pAdapterInfo^.DhcpServer.IpAddress.S);
      memo1.Lines.Add('Have WINS: ' + BoolToStr(pAdapterInfo^.HaveWins,True));
      memo1.Lines.Add('Primary WINS: ' + pAdapterInfo^.PrimaryWinsServer.IpAddress.S);
      memo1.Lines.Add('Secondary WINS: ' + pAdapterInfo^.SecondaryWinsServer.IpAddress.S);
      pAdapterInfo:= pAdapterInfo^.Next;
    end;
  finally
    Dispose(pAdapterInfo);
  end;
end;


procedure TForm1.ButtonCurrentActToFileClick(Sender: TObject);
var
  SS_Name:string;
  fileout : TextFile;
begin
  SS_Name:='Log'+'\'+'CurrentActFile'+'.ini';
  CheckDirectory('Log',Memo1);
  try
    AssignFile(fileout, SS_Name);
  except
    on E: EInOutError do
    begin
      showmessage('AssignFile: '+E.ClassName+'/'+ E.Message+'/'+IntToStr(E.ErrorCode));
      exit;
    end;
  end;

  rewrite(fileout);
  writeln(fileout,'Date:'+FormatDateTime('DD/MM/YYYY',Now));
  writeln(fileout,'Time:'+FormatDateTime('hh:nn:ss',Now));
  writeln(fileout,'[DB1.DBD68] I_DC:'+FormatFloat('####0.00',DB1_DBD68.Value));
  writeln(fileout,'[DB1.DBD72] V_DC:'+FormatFloat('####0.00',DB1_DBD72.Value));
  writeln(fileout,'[DB1.DBD76] V_Out:'+FormatFloat('####0.00',DB1_DBD76.Value));
  writeln(fileout,'[DB1.DBD252] LineSpeed:'+FormatFloat('####0.00',DB1_DBD252.Value));
  writeln(fileout,'[DB1.DBD258] Power_Out:'+FormatFloat('####0.00',DB1_DBD258.Value));
  writeln(fileout,'[DB1.DBD48] PowerSetSpecPower:'+FormatFloat('####0.00',DB1_DBD48.Value));
  writeln(fileout,'[DB1.DBD278] SpecificPower:'+FormatFloat('####0.00',DB1_DBD278.Value));

  writeln(fileout,'[DB1.DBB30_bit1] Emergency: '+DoubleBooleanToStr(DB1_DBB30_bit1.Value));
  writeln(fileout,'[DB1.DBB30_bit0] Ozone suction: '+DoubleBooleanToStr(DB1_DBB30_bit0.Value));
  writeln(fileout,'[DB1.DBB26_bit2] Vcc fault: '+DoubleBooleanToStr(DB1_DBB26_bit2.Value));
  writeln(fileout,'[DB1.DBB26_bit3] Thermal switch: '+DoubleBooleanToStr(DB1_DBB26_bit3.Value));
  writeln(fileout,'[DB1.DBB34_bit0] Overload Idc: '+DoubleBooleanToStr(DB1_DBB34_bit0.Value));
  writeln(fileout,'[DB1.DBB38_bit0] H.V.discharge: '+DoubleBooleanToStr(DB1_DBB38_bit0.Value));
  writeln(fileout,'[DB1.DBB38_bit1] Interlock Cor: '+DoubleBooleanToStr(DB1_DBB38_bit1.Value));
  writeln(fileout,'[DB1.DBB22_bit3] Low speed: '+DoubleBooleanToStr(DB1_DBB22_bit3.Value));
  writeln(fileout,'[DB1.DBB22_bit1] Station open: '+DoubleBooleanToStr(DB1_DBB22_bit1.Value));
  writeln(fileout,'[DB1.DBB22_bit6] Power alarm: '+DoubleBooleanToStr(DB1_DBB22_bit6.Value));

  CloseFile(fileout);

end;

procedure TForm1.ButtonCurrentActualClick(Sender: TObject);
begin
  Log('-------------------------------------');
  Log('Date: '+FormatDateTime('DD/MM/YYYY',Now));
  Log('Time: '+FormatDateTime('hh:nn:ss',Now));
  Log('[DB1.DBD68] I_DC: '+FormatFloat('####0.00',DB1_DBD68.Value));
  Log('[DB1.DBD72] V_DC: '+FormatFloat('####0.00',DB1_DBD72.Value));
  Log('[DB1.DBD76] V_Out: '+FormatFloat('####0.00',DB1_DBD76.Value));
  Log('[DB1.DBD252] LineSpeed: '+FormatFloat('####0.00',DB1_DBD252.Value));
  Log('[DB1.DBD258] Power_Out: '+FormatFloat('####0.00',DB1_DBD258.Value));
  Log('[DB1.DBD48] PowerSetSpecPower: '+FormatFloat('####0.00',DB1_DBD48.Value));
  Log('[DB1.DBD278] SpecificPower: '+FormatFloat('####0.00',DB1_DBD278.Value));

  Log('[DB1.DBB30_bit1] Emergency: '+DoubleBooleanToStr(DB1_DBB30_bit1.Value));
  Log('[DB1.DBB30_bit0] Ozone suction: '+DoubleBooleanToStr(DB1_DBB30_bit0.Value));
  Log('[DB1.DBB26_bit2] Vcc fault: '+DoubleBooleanToStr(DB1_DBB26_bit2.Value));
  Log('[DB1.DBB26_bit3] Thermal switch: '+DoubleBooleanToStr(DB1_DBB26_bit3.Value));
  Log('[DB1.DBB34_bit0] Overload Idc: '+DoubleBooleanToStr(DB1_DBB34_bit0.Value));
  Log('[DB1.DBB38_bit0] H.V.discharge: '+DoubleBooleanToStr(DB1_DBB38_bit0.Value));
  Log('[DB1.DBB38_bit1] Interlock Cor: '+DoubleBooleanToStr(DB1_DBB38_bit1.Value));
  Log('[DB1.DBB22_bit3] Low speed: '+DoubleBooleanToStr(DB1_DBB22_bit3.Value));
  Log('[DB1.DBB22_bit1] Station open: '+DoubleBooleanToStr(DB1_DBB22_bit1.Value));
  Log('[DB1.DBB22_bit6] Power alarm: '+DoubleBooleanToStr(DB1_DBB22_bit6.Value));
end;

procedure TForm1.Button2Click(Sender: TObject);
var
  inputstr : TCaption;
begin
  FProcess.Executable := 'dir';
  FProcess.Parameters.Add('/w');
  //FLastRunning := true;
  FProcess.Execute;
  FProcessReadData(Sender);

  inputstr := 'dir';
  Log('Sending input: "%s"',[inputstr]);
  Memo1.Append('Sending input: "%s"'+inputstr);
  inputstr := inputstr + #10;
  FProcess.Input.Write(inputstr[1],Length(inputstr));

  //if Key = VK_RETURN then
  //btnExecClick(Sender);
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

procedure TForm1.CloseDisconnectPanelClick(Sender: TObject);
begin
  Disconnect_Panel.Top:=0;
  Disconnect_Panel.Left:=0;
  Disconnect_Panel.Width:=0;
  Disconnect_Panel.Height:=0;
end;

procedure TForm1.ConnectClick(Sender: TObject);
var
  i:integer;
begin
  ConnectMenu.Items[0].Enabled:=false;
  ConnectMenu.Items[1].Enabled:=true;
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
  ConnectMenu.Items[1].Enabled:=false;
  ConnectMenu.Items[0].Enabled:=true;
  TCP_UDPPort1.Active:=false;
    for i := 0 to 1000 do
    begin
      application.ProcessMessages;
    end;
    TCP_UDPPort1.ExclusiveDevice:=false;
    Disconnect_Panel.Top:=64;
    Disconnect_Panel.Left:=48;
    Disconnect_Panel.Width:=776;
    Disconnect_Panel.Height:=450;
    Disconnect_Panel.Visible:=true;
end;

procedure TForm1.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
  FProcess.Terminate(0);
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

  CPU_Clock_counter:=0;
  CPU_Clock_OldBit:=false;

  Old_CPU_Clock_counter:=0;
  Error_CPU_Clock_counter:=0;
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

procedure TForm1.FProcessReadData(Sender: TObject);
var newOutput : string;
begin

  newOutput :=  ReadOutput(FProcess);
  if newOutput <> '' then
    Log(newOutput);
end;

procedure TForm1.FProcessTerminate(Sender: TObject);
begin
  Log('Process Terminate');
end;

procedure TForm1.I_DC_CheckBoxEditingDone(Sender: TObject);
begin
  Chart1LineSeries1.Active:=I_DC_CheckBox.Checked;
end;

procedure TForm1.LineSpeed_CheckBoxEditingDone(Sender: TObject);
begin
  Chart1LineSeries3.Active:=LineSpeed_CheckBox.Checked;
end;

procedure TForm1.Memo01ClearClick(Sender: TObject);
begin
  Memo1.Clear
end;

procedure TForm1.Memo01CopyClick(Sender: TObject);
begin
  Memo1.CopyToClipboard;

  //my_clipboard.Clear;
  //curr_text:= Memo1.Lines.Text;//curr_text : String
  //if my_clipboard.HasFormat(CF_Text) then
    //my_clipboard.AsText:= curr_text;
end;

procedure TForm1.Memo01GetfileandfolderClick(Sender: TObject);
begin
  Memo1.Append('Directory ='+Directory_);
  Memo1.Append('FileName ='+FileName_);
end;

procedure TForm1.Memo01IpconfigAllClick(Sender: TObject);
begin
  ButtonIpconfigAlClick(Sender);
end;

procedure TForm1.Memo01IpconfigClick(Sender: TObject);
begin
  ButtonIpconfigClick(Sender);
end;

procedure TForm1.Memo01PingClick(Sender: TObject);
begin
  ButtonPingClick(Sender);
end;

procedure TForm1.Memo01SelectAllClick(Sender: TObject);
var
  i:integer;
begin
  Memo1.Refresh;
  Memo1.Focused;
  for i := 0 to 100 do
    begin
      application.ProcessMessages;
    end;
  Memo1.SelStart:=0;
  Memo1.SelLength := 0;
  Memo1.SelectAll;
end;

procedure TForm1.Memo1KeyPress(Sender: TObject; var Key: char);
begin
  if Key = ^A then
  begin
    (Sender as TMemo).SelectAll;
    Key := #0;
  end;
end;

procedure TForm1.MenuComputerNameClick(Sender: TObject);
begin
  ButtonComputerNameClick(Sender);
end;

procedure TForm1.MenuCurrentActualToFileClick(Sender: TObject);
begin
  ButtonCurrentActToFileClick(Sender);
end;

procedure TForm1.MenuIPAddressClick(Sender: TObject);
begin
  ButtonGetIPAddressClick(Sender);
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

procedure TForm1.MenuItemCurrentActualClick(Sender: TObject);
begin
  ButtonCurrentActualClick(Sender);
end;

procedure TForm1.Power_Out_CheckBoxEditingDone(Sender: TObject);
begin
  Chart1LineSeries4.Active:=Power_Out_CheckBox.Checked;
end;

procedure TForm1.Shape_PowerLevelChangeBounds(Sender: TObject);
begin

end;

procedure TForm1.TabSheet1ContextPopup(Sender: TObject; MousePos: TPoint;
  var Handled: Boolean);
begin

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
       writeln(fileout, 'Date,Time,I_DC,V_DC,V_Out,LineSpeed,Power_Out,PowerSetSpecPower,SpecificPower');
     except
       //on E: EInOutError do
       //showmessage('Append: '+E.ClassName+'/'+ E.Message+'/'+IntToStr(E.ErrorCode));
     end;
   end;

   try         //FloatToStr(Int(Random(1*10)))
     if (not TCP_UDPPort1.Active) or (Error_CPU_Clock_counter >= 10) then
     begin
       writeln(fileout, FormatDateTime('DD/MM/YYYY',Now)+','+FormatDateTime('hh:nn:ss',Now)+',-,-,-,-,-,-,-');
     end;
     if TCP_UDPPort1.Active and (not (Error_CPU_Clock_counter >= 10)) then
     begin
       //FormatFloat('####0.00',DB3_DBD12.Value)//FloatToStr(Q1_7.Value)
       //Date,                             Time,                           I_DC,                                    V_DC,                                    V_Out,                                   LineSpeed,                                Power_Out,                                PowerSetSpecPower,                       SpecificPower
       //FormatDateTime('DD/MM/YYYY',Now), FormatDateTime('hh:nn:ss',Now), FormatFloat('####0.00',DB1_DBD68.Value), FormatFloat('####0.00',DB1_DBD72.Value), FormatFloat('####0.00',DB1_DBD76.Value), FormatFloat('####0.00',DB1_DBD252.Value), FormatFloat('####0.00',DB1_DBD258.Value), FormatFloat('####0.00',DB1_DBD48.Value), FormatFloat('####0.00',DB1_DBD278.Value)
       writeln(fileout, FormatDateTime('DD/MM/YYYY',Now)+','+FormatDateTime('hh:nn:ss',Now)+','+FormatFloat('####0.00',DB1_DBD68.Value)+','+FormatFloat('####0.00',DB1_DBD72.Value)+','+FormatFloat('####0.00',DB1_DBD76.Value)+','+FormatFloat('####0.00',DB1_DBD252.Value)+','+FormatFloat('####0.00',DB1_DBD258.Value)+','+FormatFloat('####0.00',DB1_DBD48.Value)+','+FormatFloat('####0.00',DB1_DBD278.Value));
     end;
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

  if TCP_UDPPort1.Active then Ra:= DB1_DBD68.Value;
  if not TCP_UDPPort1.Active then Ra:=0.0;
  if ChartSimulate then Ra:= Int(Random(1*1000));
  if Chart1.Extent.YMax<Ra then Chart1.Extent.YMax:=Ra+1;
  if Chart1.Extent.YMin>Ra then Chart1.Extent.YMin:=Ra-1;
  if ListChartSource1.Count < MaxRecordTime then ListChartSource1.Add(ListChartSource1.Count,Ra,Txt,clBlue);    //I_DC_CheckBox  DB1_DBD68

  if TCP_UDPPort1.Active then Ra:= DB1_DBD72.Value;
  if not TCP_UDPPort1.Active then Ra:=0.0;
  if ChartSimulate then Ra:= Int(Random(1*1000));
  if Chart1.Extent.YMax<Ra then Chart1.Extent.YMax:=Ra+1;
  if Chart1.Extent.YMin>Ra then Chart1.Extent.YMin:=Ra-1;
  if ListChartSource4.Count < MaxRecordTime then ListChartSource2.Add(ListChartSource2.Count,Ra,Txt,clMaroon); //V_DC  DB1_DBD72

  if TCP_UDPPort1.Active then Ra:= DB1_DBD76.Value;
  if not TCP_UDPPort1.Active then Ra:=0.0;
  if ChartSimulate then Ra:= Int(Random(1*1000));
  if Chart1.Extent.YMax<Ra then Chart1.Extent.YMax:=Ra+1;
  if Chart1.Extent.YMin>Ra then Chart1.Extent.YMin:=Ra-1;
  if ListChartSource5.Count < MaxRecordTime then ListChartSource3.Add(ListChartSource3.Count,Ra,Txt,clFuchsia);   //LineSpeed  DB1_DBD76

  if TCP_UDPPort1.Active then Ra:= DB1_DBD252.Value;
  if not TCP_UDPPort1.Active then Ra:=0.0;
  if ChartSimulate then Ra:= Int(Random(1*1000));
  if Chart1.Extent.YMax<Ra then Chart1.Extent.YMax:=Ra+1;
  if Chart1.Extent.YMin>Ra then Chart1.Extent.YMin:=Ra-1;
  if ListChartSource5.Count < MaxRecordTime then ListChartSource4.Add(ListChartSource4.Count,Ra,Txt,clGreen);   //Power_Out  DB1_DBD252

  if TCP_UDPPort1.Active then Ra:= DB1_DBD258.Value;
  if not TCP_UDPPort1.Active then Ra:=0.0;
  if ChartSimulate then Ra:= Int(Random(1*1000));
  if Chart1.Extent.YMax<Ra then Chart1.Extent.YMax:=Ra+1;
  if Chart1.Extent.YMin>Ra then Chart1.Extent.YMin:=Ra-1;
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

  if not TCP_UDPPort1.Active then
  begin
    HMI_Speed.Visible:=false;
    HMI_Idc.Visible:=false;
    HMI_Vdc.Visible:=false;
    HMI_Vout.Visible:=false;
    HMI_PwrOut.Visible:=false;
    HMILabel1.Visible:=false;
    HMI_SpecificPowerAct.Visible:=false;
    ProgressBar_PwrOut.Position:= round(0);
    ProgressBar_PL.Position:= round(0);
    ProgressBar_ACT.Position:= round(0);
    Shape_Emergency.Visible:=false;
    Shape_OzoneSuction.Visible:=false;
    Shape_VccFault.Visible:=false;
    Shape_ThermalSwitch.Visible:=false;
    Shape_OverloadIdc.Visible:=false;
    Shape_HVDischarge.Visible:=false;
    Shape_InterlockCor.Visible:=false;
    Shape_LowSpeed.Visible:=false;
    Shape_StationOpen.Visible:=false;
    Shape_PowerAlarm.Visible:=false;
  end;
  if TCP_UDPPort1.Active then
  begin
    HMI_Speed.Visible:=true;
    HMI_Idc.Visible:=true;
    HMI_Vdc.Visible:=true;
    HMI_Vout.Visible:=true;
    HMI_PwrOut.Visible:=true;
    HMILabel1.Visible:=true;
    HMI_SpecificPowerAct.Visible:=true;
    ProgressBar_PwrOut.Position:= round(DB1_DBD258.Value);
    ProgressBar_PL.Position:= round(DB1_DBD48.Value);
    ProgressBar_ACT.Position:= round(DB1_DBD278.Value);
    Shape_Emergency.Visible:=true;
    Shape_OzoneSuction.Visible:=true;
    Shape_VccFault.Visible:=true;
    Shape_ThermalSwitch.Visible:=true;
    Shape_OverloadIdc.Visible:=true;
    Shape_HVDischarge.Visible:=true;
    Shape_InterlockCor.Visible:=true;
    Shape_LowSpeed.Visible:=true;
    Shape_StationOpen.Visible:=true;
    Shape_PowerAlarm.Visible:=true;
    if DB1_DBB30_bit1.Value>0 then Shape_Emergency.Brush.Color:=clRed;
    if DB1_DBB30_bit1.Value=0 then Shape_Emergency.Brush.Color:=clWhite;
    if DB1_DBB30_bit0.Value>0 then Shape_OzoneSuction.Brush.Color:=clRed;
    if DB1_DBB30_bit0.Value=0 then Shape_OzoneSuction.Brush.Color:=clWhite;
    if DB1_DBB26_bit2.Value>0 then Shape_VccFault.Brush.Color:=clRed;
    if DB1_DBB26_bit2.Value=0 then Shape_VccFault.Brush.Color:=clWhite;
    if DB1_DBB26_bit3.Value>0 then Shape_ThermalSwitch.Brush.Color:=clRed;
    if DB1_DBB26_bit3.Value=0 then Shape_ThermalSwitch.Brush.Color:=clWhite;
    if DB1_DBB34_bit0.Value>0 then Shape_OverloadIdc.Brush.Color:=clRed;
    if DB1_DBB34_bit0.Value=0 then Shape_OverloadIdc.Brush.Color:=clWhite;
    if DB1_DBB38_bit0.Value>0 then Shape_HVDischarge.Brush.Color:=clRed;
    if DB1_DBB38_bit0.Value=0 then Shape_HVDischarge.Brush.Color:=clWhite;
    if DB1_DBB38_bit1.Value>0 then Shape_InterlockCor.Brush.Color:=clRed;
    if DB1_DBB38_bit1.Value=0 then Shape_InterlockCor.Brush.Color:=clWhite;

    if DB1_DBB22_bit3.Value>0 then Shape_LowSpeed.Brush.Color:=clYellow;
    if DB1_DBB22_bit3.Value=0 then Shape_LowSpeed.Brush.Color:=clWhite;
    if DB1_DBB22_bit1.Value>0 then Shape_StationOpen.Brush.Color:=clYellow;
    if DB1_DBB22_bit1.Value=0 then Shape_StationOpen.Brush.Color:=clWhite;
    if DB1_DBB22_bit6.Value>0 then Shape_PowerAlarm.Brush.Color:=clYellow;
    if DB1_DBB22_bit6.Value=0 then Shape_PowerAlarm.Brush.Color:=clWhite;

  end;

end;

procedure TForm1.Timer2Timer(Sender: TObject);
begin

  if (CPU_Clock_OldBit=true) and (MB0_bit1.Value=0) then CPU_Clock_OldBit:=false;
  if (CPU_Clock_OldBit=false) and (MB0_bit1.Value>0) then
  begin
    CPU_Clock_OldBit:=true;
    CPU_Clock_counter:=CPU_Clock_counter+1;
  end;

  if CPU_Clock_counter>=10 then CPU_Clock_counter:=0;

  if CPU_Clock_counter=0 then
    ConnectStep1.Brush.Color:=clLime
  else
    ConnectStep1.Brush.Color:=clWhite;

  if CPU_Clock_counter=1 then
    ConnectStep2.Brush.Color:=clLime
  else
    ConnectStep2.Brush.Color:=clWhite;

  if CPU_Clock_counter=2 then
    ConnectStep3.Brush.Color:=clLime
  else
    ConnectStep3.Brush.Color:=clWhite;

  if CPU_Clock_counter=3 then
    ConnectStep4.Brush.Color:=clLime
  else
    ConnectStep4.Brush.Color:=clWhite;

  if CPU_Clock_counter=4 then
    ConnectStep5.Brush.Color:=clLime
  else
    ConnectStep5.Brush.Color:=clWhite;

  if CPU_Clock_counter=5 then
    ConnectStep6.Brush.Color:=clLime
  else
    ConnectStep6.Brush.Color:=clWhite;

  if CPU_Clock_counter=6 then
    ConnectStep7.Brush.Color:=clLime
  else
    ConnectStep7.Brush.Color:=clWhite;

  if CPU_Clock_counter=7 then
    ConnectStep8.Brush.Color:=clLime
  else
    ConnectStep8.Brush.Color:=clWhite;

  if CPU_Clock_counter=8 then
    ConnectStep9.Brush.Color:=clLime
  else
    ConnectStep9.Brush.Color:=clWhite;

  if CPU_Clock_counter=9 then
    ConnectStep10.Brush.Color:=clLime
  else
    ConnectStep10.Brush.Color:=clWhite;

  if Old_CPU_Clock_counter<>CPU_Clock_counter then
  begin
    Error_CPU_Clock_counter:=0;
    Old_CPU_Clock_counter:=CPU_Clock_counter;
  end;

  //if (Old_CPU_Clock_counter=CPU_Clock_counter) and TCP_UDPPort1.Active then Error_CPU_Clock_counter:=Error_CPU_Clock_counter+1;
  if (Old_CPU_Clock_counter=CPU_Clock_counter) then Error_CPU_Clock_counter:=Error_CPU_Clock_counter+1;
  if Error_CPU_Clock_counter = 50-1 then
  begin
    Disconnect_Panel.Top:=64;
    Disconnect_Panel.Left:=48;
    Disconnect_Panel.Width:=776;
    Disconnect_Panel.Height:=450;
  end;
   if Error_CPU_Clock_counter = 50 then
  begin
    ConnectMenu.Items[1].Enabled:=false;
    ConnectMenu.Items[0].Enabled:=true;
  end;
  if Error_CPU_Clock_counter >= 50 then
  begin
    Error_CPU_Clock_counter:=50;
    //DisconnectClick(Sender);
    Disconnect_Panel.Visible:=true;
  end
  else
  begin
    Disconnect_Panel.Visible:=false;
    ConnectMenu.Items[0].Enabled:=false;
    ConnectMenu.Items[1].Enabled:=true;
  end;
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

