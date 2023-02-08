use v6.d;

use DSL::Entity::AddressBook::Grammar;
use DSL::Shared::Actions::English::WL::PipelineCommand;


class DSL::Entity::AddressBook::Actions::SQL::Standard
        is DSL::Shared::Actions::English::WL::PipelineCommand {

    has  DSL::Entity::AddressBook::ResourceAccess $.resources;

    ##========================================================
    ## Grammar methods
    ##========================================================

    method TOP($/) {
        make $/.values[0].made;
    }

    method addressbook-entity-spec($/) {
        make $/.values[0].made;
    }

    method addressbook-entity-spec-list($/) {
        make $<addressbook-entity-spec>>>.made.join(', ');
    }

    method entity-addressbook-person-name($/) {
        my $nm = $!resources.name-to-entity-id('PersonName', $/.Str.lc, :!warn);
        make '"' ~ $nm ~ '"';
    }

    method entity-addressbook-company-name($/) {
        my $nm = $!resources.name-to-entity-id('CompanyName', $/.Str.lc, :!warn);
        make '"' ~ $nm ~ '"';
    }

    method entity-addressbook-occupation($/) {
        my $nm = $!resources.name-to-entity-id('Occupation', $/.Str.lc, :!warn);
        make '"' ~ $nm ~ '"';
    }
}
