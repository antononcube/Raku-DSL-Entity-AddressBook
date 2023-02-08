use v6.d;

role DSL::Entity::AddressBook::Grammar::EntityNames {

    regex entity-addressbook-person-name {
        <entity-name($*resObj, 'PersonName')>
    }

    regex entity-addressbook-company-name {
        <entity-name($*resObj, 'CompanyName')>
    }

    regex entity-addressbook-occupation {
        <entity-name($*resObj, 'Occupation')>
    }
}