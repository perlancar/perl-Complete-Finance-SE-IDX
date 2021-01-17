package Complete::Finance::SE::IDX;

# AUTHORITY
# DATE
# DIST
# VERSION

use 5.010001;
use strict;
use warnings;

use Complete::Common qw(:all);

our %SPEC;
require Exporter;
our @ISA       = qw(Exporter);
our @EXPORT_OK = qw(
                       complete_idx_listed_stock_code
               );

$SPEC{':package'} = {
    v => 1.1,
    summary => 'Completion routines related to Indonesian Stock Exchange',
};

$SPEC{complete_idx_listed_stock_code} = {
    v => 1.1,
    summary => 'Complete from list of currently listed stock codes',
    args => {
        %arg_word,
    },
    result_naked => 1,
};
sub complete_idx_listed_stock_code {
    require Complete::Util;
    require Finance::SE::IDX::Static;

    my %args = @_;

    Complete::Util::complete_array_elem(
        word => $args{word},
        array     => [map {$_->[0]} @{$Finance::SE::IDX::Static::data_stock}],
        summaries => [map {$_->[2]} @{$Finance::SE::IDX::Static::data_stock}],
    );
}

1;
#ABSTRACT:
