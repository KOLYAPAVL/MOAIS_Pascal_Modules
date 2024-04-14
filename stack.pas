unit stack;

interface

type chain = ^elem;
elem = record
  data: integer;
  next: chain;
end;

procedure init(var top: chain);

procedure print(top: chain);

procedure add(var top: chain; d: integer);

procedure del(var top: chain; var d: integer);

procedure del_all(var top: chain);

function stecklength(top: chain): integer;
function stecklength_2(top: chain): integer;

implementation

procedure init(var top: chain);
begin
  top:= nil;
end;


procedure print(top:chain);
    var cur:chain;
    begin
    cur:=top;if cur= nil then writeln('стек пуст');
        while cur <> nil do begin
            write(cur^.data,' ');
            cur := cur^.next;
        end;
        writeln;
    end;
procedure add(var top:chain;d:integer);
    var p:chain;
        begin 
            new(p);
            p^.data:=d;
            p^.next:=top;
            top:=p;
        end;
procedure del (var top:chain;var d:integer);
    var next:chain;
    begin 
        if top = nil then  d := 15//стек не пуст проверка 
            else 
            begin
                next := top^.next;//d:= top^.data;
                d:= top^.data;//next := top;
                dispose(top);//top:=top^.next;
                top:= next;//pispose(next);
            end;
    end;
procedure del_all(var top: chain);

var cur: chain;

begin
  cur:= top;
  while cur <> nil do begin
    dispose(top);
    cur:= cur^.next;
    top:= cur;
  end;
end;
function stecklength(top: chain): integer;
begin
    if top = nil then
        stecklength := 0
    else
        stecklength := 1 + stecklength(top^.next);
        
end;
function stecklength_2(top: chain): integer;
var
    cur: chain;
    count: integer;
begin
    cur := top;
    count := 0;

    while cur <> nil do
    begin
        count := count + 1;
        cur := cur^.next;
    end;

    stecklength_2 := count;
end;

  
end.
