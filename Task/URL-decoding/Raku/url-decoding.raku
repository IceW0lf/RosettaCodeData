my @urls = < http%3A%2F%2Ffoo%20bar%2F
             google.com/search?q=%60Abdu%27l-Bah%C3%A1 >;

say .subst( :g,
    / [ '%' ( <xdigit> ** 2 ) ]+ / ,
    { Blob.new((:16(~$_) for $0)).decode }
    ) for @urls;
