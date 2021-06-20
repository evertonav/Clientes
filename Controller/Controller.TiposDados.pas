unit Controller.TiposDados;

interface

type
  TPermissaoCadastro = (acTotal, acEditarExcluir);

  TTipoFiltro = (tfNome, tfCPF);

  TDadosCliente = packed record
    Codigo: Integer;
    Nome: string;
    CPF: string;
  end;

implementation

end.
