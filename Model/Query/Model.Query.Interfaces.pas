unit Model.Query.Interfaces;

interface

uses
  Data.DB;

type
  IModelQuery = interface
    ['{E9DF03FE-F6E6-42AB-8B61-5C3E369697D5}']
    function AdicionarSQL(const pSql: string): IModelQuery;
    function GetQuery: TDataSet;
  end;

implementation

end.
