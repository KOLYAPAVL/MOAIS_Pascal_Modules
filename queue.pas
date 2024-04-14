unit queue;
interface
type qchain = ^elem;
elem = record
  data: integer;
  next: qchain;
end;
procedure qdel_all(var head: qchain);
procedure qdel (var head,tail:qchain;var i:integer);
procedure qinit(var head,tail:qchain);
procedure qadd(var head,tail:qchain;i:integer);
procedure qprint(top:qchain);
function qlength(top: qchain): integer;

   
implementation
procedure qinit(var head,tail:qchain);
begin 
    head:=nil;
    tail:=nil;
end;
procedure qadd(var head,tail:qchain;i:integer);
 var cur:qchain;
        begin 
            new(cur);
            cur^.data:=i;
            cur^.next:=nil;
                if tail = nil then begin
                    head := cur;
                    tail:= cur;
                    end
                else begin
                tail^.next:= cur;
                tail:= cur;
                    end;
        end;
        

procedure qprint(top:qchain);
    var cur:qchain;
    begin
    cur:=top;if cur= nil then writeln('стек пуст');
        while cur <> nil do begin
            write(cur^.data,' ');
            cur := cur^.next;
        end;
        writeln;
    end;
    
procedure qdel (var head,tail:qchain;var i:integer);
    var cur:qchain;
    begin 
        if head = nil then  i := maxint
            else begin
                
                i:= head^.data;
                cur:=head;
                head:=head^.next;
                dispose(cur);
            if head= nil then tail:= nil;
               
            end;
    end;
procedure qdel_all(var head: qchain);

var cur: qchain;

begin
  cur:= head;
  while cur <> nil do begin
    dispose(head);
    cur:= cur^.next;
    head:= cur;
  end;
end;
function qlength(top: qchain): integer;
var
  cur: qchain;
  count: integer;
begin
  cur := top;
  count := 0;
  while cur <> nil do
  begin
    count := count + 1;
    cur := cur^.next;
  end;
  qlength := count;
end;

begin
end.
