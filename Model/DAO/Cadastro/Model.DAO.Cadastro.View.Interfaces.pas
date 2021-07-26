unit Model.DAO.Cadastro.View.Interfaces;

interface

uses
  Data.DB,
  //Model.Eventos.Preencher.Interfaces,
  Model.DAO.Cadastro.Interfaces;

type
  IModelDAOCadastroClienteView = interface
    ['{54920BE1-382A-46C6-82B5-959CF64F2CCD}']
    function Codigo(const pValor: Integer): IModelDAOCadastroClienteView;
    function SetAfterDelete(pValor: TDataSetNotifyEvent): IModelDAOCadastroClienteView;

    function Consultar: IModelDAOCadastro;
  end;

implementation

end.
