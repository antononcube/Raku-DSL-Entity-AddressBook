use DSL::Shared::Utilities::FuzzyMatching;
use DSL::Shared::Utilities::MetaSpecsProcessing;
use DSL::Shared::Entity::ResourceAccess;

class DSL::Entity::AddressBook::ResourceAccess
        is DSL::Shared::Entity::ResourceAccess {
    #-----------------------------------------------------------
    # OVERRIDE-START
    #-----------------------------------------------------------

    #| Override the parent class function in order to call
    #| DSL::Shared::Entity::ResourceAccess.make()
    #| with the correct file names.
    method get-resource-files( --> Positional) {
        my @fileNames = <PersonNameToEntityID_EN.tsv CompanyNameToEntityID_EN.tsv OccupationToEntityID_EN.tsv>;
        my @resources = <PersonName CompanyName Occupation> Z=> @fileNames;
        @resources = @resources.map({ $_.key => %?RESOURCES{$_.value} });
        return @resources;
    }

    #-----------------------------------------------------------
    # OVERRIDE-END
    #-----------------------------------------------------------

    #-----------------------------------------------------------
    method known-person-name(Str:D $phrase, Bool :$bool = True, Bool :$warn = True) {
        ## If the name candidate $phrase is a known store name, then return False/Nil.
        if $phrase (elem) self.getKnownNames(){'PersonName'} {
            $bool ?? False !! Nil
        } else {
            self.known-name('PersonName', $phrase, :$bool, :$warn)
        }
    }

    #-----------------------------------------------------------
    method known-company-name(Str:D $phrase, Bool :$bool = True, Bool :$warn = True) {
        ## If the item candidate $phrase is a known item, then return False/Nil.
        if $phrase (elem) self.getKnownNames(){'CompanyName'} {
            $bool ?? False !! Nil
        } else {
            self.known-name('CompanyName', $phrase, :$bool, :$warn)
        }
    }

    #-----------------------------------------------------------
    method known-occupation(Str:D $phrase, Bool :$bool = True, Bool :$warn = True) {
        ## If the item candidate $phrase is a known item, then return False/Nil.
        if $phrase (elem) self.getKnownNames(){'Occupation'} {
            $bool ?? False !! Nil
        } else {
            self.known-name('Occupation', $phrase, :$bool, :$warn)
        }
    }
}
