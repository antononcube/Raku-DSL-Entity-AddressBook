use v6.d;

role DSL::Entity::AddressBook::Grammar::EntityNames {

    regex entity-addressbook-person-name {
        <entity-name($*resourceObj, 'PersonName')>
    }

    regex entity-addressbook-company-name {
        <entity-name($*resourceObj, 'CompanyName')>
    }

    regex entity-addressbook-occupation {
        <entity-name($*resourceObj, 'Occupation')>
    }
}