use lib <. lib>;

use DSL::Entity::AddressBook;
use DSL::Entity::AddressBook::Actions::SQL::Standard;

my $pCOMMAND = DSL::Entity::AddressBook::Grammar;

my $tstart = now;
say $pCOMMAND.parse('i want LOTR, X-Men, and Liv Tyler', args => (DSL::Entity::AddressBook::resource-access-object(),));
say "Parsing time: { now - $tstart }";

my @testCommands = (
'Orlando Bloom',
'Lord of the Rings',
'LOTR',
'X-Men'
);

my @targets = ('SQL-Standard');

for @testCommands -> $c {
    say "=" x 30;
    say $c;
    for @targets -> $t {
        say '-' x 30;
        say $t;
        say '-' x 30;
        my $start = now;
        my $res = ToAddressBookEntityCode($c, $t);
        say "time:", now - $start;
        say $res.raku;
    }
}
