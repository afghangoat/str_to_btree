program Strtobtree;

// Data types
//type
//    THuman = record
//        dna: String;
//        age: Integer;
//    end;

type
    tree_node = object
        data: Char;
        left, right: ^tree_node; // Pointers to left and right children
        constructor init(d: Char);
        procedure print_data;
        procedure append_data(u: Char);
        procedure build_tree(S: String);
    end;

// Functions and procedures
constructor tree_node.init(d: Char);
begin
    data := d;
    left := nil;
    right := nil;
end;

procedure tree_node.print_data;
begin
    write(data);
    if left <> nil then
        left^.print_data;
        
    if right <> nil then
        right^.print_data;
    
end;

procedure tree_node.append_data(u: Char);
begin
    if u < data then
    begin
        if left <> nil then
            left^.append_data(u)
        else
        begin
            new(left);
            left^.init(u);
        end;
    end
    
    else
    begin
        if right <> nil then
            right^.append_data(u)
        else
        begin
            new(right);
            right^.init(u);
        end;
    end;
end;

procedure tree_node.build_tree(S: String); //or A: Array of Byte
var
    C: Char;
begin
    for C in S do
        append_data(C);
end;

// Global variables
var
    //human: THuman;
    //a: Boolean;
    root: ^tree_node;

// Main
begin
    new(root);
    root^.init(' ');
    root^.build_tree('Mountain dew');
    
    //human.dna := 'GAAA';
    
    writeln('The word "Mountain dew" stored a BTree:');
    root^.print_data();
end.
