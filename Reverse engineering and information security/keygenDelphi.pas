unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

//Generate serial number
procedure TForm1.Button1Click(Sender: TObject);
var
  userName:string;
  serial:longword;
  i:integer;
begin
  name := Edit1.Text;
  if name = '' then ShowMessage('Input a name');

  serial := 1;
  for i := 1 to length(name) do
    begin
        // multiply by code of char
        serial := serial * ord(name[i]);
    end;

  // 0FFFFFFF = 268435455 (AND EAX,0FFFFFFF)
  serial := serial and 268435455;
  Edit2.Text := IntToStr(serial);
end;

//Exit
procedure TForm1.Button2Click(Sender: TObject);
begin
Application.Terminate;
end;

end.
