unit uMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, uNetWork;

type
  TfrMain = class(TForm)
    btnMain: TButton;
    procedure btnMainClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frMain: TfrMain;

implementation

{$R *.dfm}

procedure TfrMain.btnMainClick(Sender: TObject);
var
  wNetwork: NetWork;
begin
  try
    wNetwork := NetWork.Create(8);

    wNetwork.Connect(1, 2);
    wNetwork.Connect(6, 2);
//    wNetwork.Connect(1, 6); //Causa erro por conta de já estarem conectados
    wNetwork.Connect(2, 4);
    wNetwork.Connect(5, 8);
//    wNetwork.Connect(1, 9); //Causa erro por conta de não existir o elemento!

    wNetwork.Query(1, 6);
//    wNetwork.Query(1, 9); //Causa erro por conta de não existir o elemento!
    wNetwork.Query(6, 4);
    wNetwork.Query(7, 4);
    wNetwork.Query(5, 6);
  except
    on E: Exception do
      Application.MessageBox(PWideChar('Erro: ' + E.Message), 'Atenção!', MB_ICONWARNING + MB_OK);
  end;
end;

end.
