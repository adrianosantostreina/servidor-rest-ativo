unit Unit2;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls,

  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient;

type
  TForm2 = class(TForm)
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    class function ServidorAtivo: Boolean;
  end;

var
  Form2: TForm2;

implementation

{$R *.fmx}

uses ClientModuleUnit1;

procedure TForm2.Button1Click(Sender: TObject);
begin
  if ServidorAtivo then
    //Conexão Ativa
    //Chama método do servidor
  else
    ShowMessage('Conexão inativa!');
end;

class function TForm2.ServidorAtivo: Boolean;
var
  VCon : TIdTCPClient;
begin
  Result := false;

  vCon :=  TIdTCPClient.create;
  try
    vCon.ReadTimeout := 9000;
    vCon.ConnectTimeout := 9000;
    vCon.Port := ClientModule1.DSRestConnection1.Port;
    vCon.Host := ClientModule1.DSRestConnection1.Host;
    vCon.Connect;
    vCon.Disconnect;

    Result := true;
  finally
    vCon.DisposeOf;
  end;
end;
end.
