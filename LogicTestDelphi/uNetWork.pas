unit uNetWork;

interface

uses
  System.Classes,
  System.SysUtils;

type
  NetWork = class
  private
    parent: array of Integer;
    function Find(element: Integer) : Integer;
  public
    constructor Create(numElements: Integer);
    procedure Connect(element1, element2: Integer);
    function Query(element1, element2: Integer): Boolean;
  end;

implementation

{ NetWork }

procedure NetWork.Connect(element1, element2: Integer);
var
  root1, root2: Integer;
begin
  root1 := Find(element1);
  root2 := Find(element2);

  if (root1 <> root2) then //Caso forem iguais j� est�o conectados
  begin
    if (root1 > root2) then
      parent[root1] := root2
    else if (root1 < root2) then
      parent[root2] := root1;
  end
  else
    raise Exception.Create('Esses elementos j� est�o conectados!');
end;

constructor NetWork.Create(numElements: Integer);
var
  i: Integer;
begin
  if (numElements <= 0) then
    raise Exception.Create('O tamanho do conjunto de dados deve ser um n�mero e maior do que zero!');

  SetLength(parent, numElements + 1); //Criando com mais um para que quando for fazer a liga��o n�o precise ficar decrementando

  for i := 0 to numElements + 1 do
    parent[i] := i;
end;

function NetWork.Find(element: Integer): Integer;
begin
  if ((element < 0) or (element >= Length(parent))) then
    raise Exception.Create('O elemento deve ser um n�mero maior do que zero e estar dentro do conjunto de dados!');

  if (parent[element] <> element) then
    parent[element] := Find(parent[element]);

  Result := parent[element];
end;

function NetWork.Query(element1, element2: Integer): Boolean;
begin
  Result := Find(element1) = Find(element2);
end;

end.

