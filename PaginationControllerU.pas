unit PaginationControllerU;

interface

uses
  System.JSON, System.SysUtils;

type
  TPaginationData = class
  public
    fHasNextPage: boolean;
    fHasPrevPage: boolean;
    fCurrentPage: Integer;
    fTotalPages: Integer;
  end;

procedure GetPaginationData(Resp: string; out PaginationData: TPaginationData);

implementation


{ TPaginationData }

procedure GetPaginationData(Resp: string; out PaginationData: TPaginationData);
var
  JSONValue: TJSONValue;
begin
  JSONValue := TJSONObject.ParseJSONValue(Resp);

  PaginationData.fHasNextPage := not JSONValue.GetValue<string>('meta.next_page_uri', '').IsEmpty;
  PaginationData.fHasPrevPage := not JSONValue.GetValue<string>('meta.prev_page_uri', '').IsEmpty;
  PaginationData.fCurrentPage := JSONValue.GetValue<Integer>('meta.curr_page', 0);
  PaginationData.fTotalPages := JSONValue.GetValue<Integer>('meta.total_page', 0);
end;

end.
