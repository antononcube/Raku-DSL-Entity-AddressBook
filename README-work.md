# DSL::Entity::AddressBook

Raku grammar classes with example address book entities.

This is an example data package used in demos of 
["DSL::FiniteStateMachines"](https://raku.land/zef:antononcube/DSL::FiniteStateMachines), [AAp5].

------

## Installation

From Zef ecosystem:

```
zef install DSL::Entity::AddressBook
```

From GitHub:

```
zef install https://github.com/antononcube/Raku-DSL-Entity-AddressBook.git
```

------

## Examples

Here are examples of recognizing different types of data acquisition related specifications:

```perl6
use DSL::Entity::AddressBook;
use DSL::Entity::AddressBook::Grammar;

my &ab-parse = { DSL::Entity::AddressBook::Grammar.parse($_, args => (DSL::Entity::AddressBook::resource-access-object(),))};

say &ab-parse('Orlando Bloom');
```

```perl6
say &ab-parse('Lort of the Rings');
```

```perl6
say &ab-parse('X-Men');
```

------

## References

### Packages

[AAp1] Anton Antonov,
[DSL::Shared Raku package](https://github.com/antononcube/Raku-DSL-Shared),
(2020),
[GitHub/antononcube](https://github.com/antononcube).

[AAp2] Anton Antonov,
[DSL::Entity::Geographics Raku package](https://github.com/antononcube/Raku-DSL-Entity-Geographics),
(2021),
[GitHub/antononcube](https://github.com/antononcube).

[AAp3] Anton Antonov,
[DSL::Entity::Jobs Raku package](https://github.com/antononcube/Raku-DSL-Entity-Jobs),
(2021),
[GitHub/antononcube](https://github.com/antononcube).

[AAp4] Anton Antonov,
[DSL::Entity::Foods Raku package](https://github.com/antononcube/Raku-DSL-Entity-Foods),
(2021),
[GitHub/antononcube](https://github.com/antononcube).

[AAp5] Anton Antonov,
[DSL::FiniteStateMachines Raku package](https://github.com/antononcube/Raku-DSL-FiniteStateMachines),
(2022-2023),
[GitHub/antononcube](https://github.com/antononcube).