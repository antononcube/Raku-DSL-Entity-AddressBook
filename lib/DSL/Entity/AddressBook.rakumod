unit module DSL::Entity::AddressBook;

use DSL::Shared::Utilities::CommandProcessing;

use DSL::Entity::AddressBook::Grammar;
use DSL::Entity::AddressBook::Actions::SQL::Standard;

#-----------------------------------------------------------
#| Target to actions rules
my %targetToAction{Str} =
        "SQL" => DSL::Entity::AddressBook::Actions::SQL::Standard,
        "SQL-Standard" => DSL::Entity::AddressBook::Actions::SQL::Standard;

my %targetToAction2{Str} = %targetToAction.grep({ $_.key.contains('-') }).map({ $_.key.subst('-', '::').Str => $_.value }).Hash;
%targetToAction = |%targetToAction, |%targetToAction2;

#| Target to separators rules
my Str %targetToSeparator{Str} = DSL::Shared::Utilities::CommandProcessing::target-separator-rules();

#-----------------------------------------------------------
my DSL::Entity::AddressBook::ResourceAccess $resourceObj .= new;
$resourceObj.ingest-resource-files("\t");

#| Get the resources access object.
our sub resource-access-object(--> DSL::Entity::AddressBook::ResourceAccess) {
    return $resourceObj;
}

#-----------------------------------------------------------
#| Named entity recognition for jobs. (proto)
proto ToAddressBookEntityCode(Str $command, Str $target = 'SQL-Standard', |) is export {*}

#| Named entity recognition for jobs.
multi ToAddressBookEntityCode(Str $command, Str $target = 'SQL-Standard', :$grammar-args is copy = Whatever, *%args) {

    my $pCOMMAND = DSL::Entity::AddressBook::Grammar.new;

    my $ACTOBJ = %targetToAction{$target}.new(resources => DSL::Entity::AddressBook::resource-access-object());

    if $grammar-args.isa(Whatever) {
        $grammar-args = (DSL::Entity::AddressBook::resource-access-object(),);
    }

    DSL::Shared::Utilities::CommandProcessing::ToWorkflowCode($command,
                                                              grammar => $pCOMMAND,
                                                              :$grammar-args,
                                                              actions => $ACTOBJ,
                                                              separator => %targetToSeparator{$target},
                                                              |%args)
}

#-----------------------------------------------------------
# Optimization (to be invoked when the module matures)
#-----------------------------------------------------------

#$resourceObj := BEGIN {
#    my DSL::Entity::AddressBook::ResourceAccess $obj .= new;
#    $obj.ingest-resource-files("\t");
#    #note $obj.getNameToEntityID().raku;
#    $obj
#}