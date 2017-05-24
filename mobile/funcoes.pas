unit funcoes;

interface

uses
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient;

type
  TFuncoes = class
    public
      class function ServidorAtivo: Boolean;
  end;

implementation

{ TFuncoes }

class function TFuncoes.ServidorAtivo: Boolean;
var
  VCon : TIdTCPClient;
begin
  Result := false;

  vCon :=  TIdTCPClient.create;
  try
    vCon.ReadTimeout := 9000;
    vCon.ConnectTimeout := 9000;
    vCon.Port := CM.DSRestConnection1.Port;
    vCon.Host := CM.DSRestConnection1.Host;
    vCon.Connect;
    vCon.Disconnect;

    Result := true;
  finally
    vCon.DisposeOf;
  end;
end;

end.
