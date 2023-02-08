use v6.d;

use DSL::Shared::Roles::PredicateSpecification;
use DSL::Shared::Roles::ErrorHandling;
use DSL::Shared::Roles::English::PipelineCommand;
use DSL::Shared::Entity::Grammar::EntityNames;

use DSL::Entity::AddressBook::Grammar::EntityNames;
use DSL::Entity::AddressBook::ResourceAccess;

grammar DSL::Entity::AddressBook::Grammar
        does DSL::Shared::Roles::ErrorHandling
        does DSL::Shared::Entity::Grammar::EntityNames
        does DSL::Entity::AddressBook::Grammar::EntityNames
        does DSL::Shared::Roles::English::PipelineCommand {

    # TOP
    regex TOP($*resObj) {
        <pipeline-command> |
        <addressbook-entity-spec-list> |
        <recommend-for-addressbook-command> |
        <data-query-command>
    }

    regex addressbook-entity-spec { <entity-addressbook-person-name> | <entity-addressbook-company-name> | <entity-addressbook-occupation> }

    regex addressbook-entity-spec-list { <addressbook-entity-spec>+ % <.list-separator> }

    regex recommend-for-addressbook-command { 'i' \h+ [ 'want' | 'am' \h+ 'interested' \h+ 'in'] \h+ <addressbook-entity-spec-list> }

    regex data-query-command { [ 'how' \h+ 'many' | 'what' \h+ 'count' ] \h+ .'of' \h+ <addressbook-entity-command> \h+ 'is' \h+  'in' \h+  'my' \h+ [ 'database' | 'catalog' | 'store' ] }

}

