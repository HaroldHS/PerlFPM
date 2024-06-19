# PerlFPM
PerlFPM (Perl Functional Programming Module) contains functionalities to utilize functional programming paradigm in Perl 5.

> NOTE:
> This module is not intended for utilizing all concepts of functional programming but to utilize some aspects of functional programming paradigm.
> In addition, this module __is not fully functional__, so there are parts that use imperative approach in the underlying mechanism.
> As a result, there are 2 implementations for the same functionality \(e.g. for mapping, imprMap = imperative map & mapping = functional map\).
<br/>

### Installation / Run

No additional program is needed for running this module. Just append this code snippet inside the perl file:

```perl
use lib 'directory of PerlFPM and append /lib';
use PerlFPM qw();
```

> NOTE:
> Obtaining directory location of PerlFPM could be done with going inside the directory of PerlFPM and run `pwd` command for Linux or `chdir` command for Windows.
<br/>

As an example: If PerlFPM folder located in `/home/user/PerlFPM`, then append this code snippet inside the perl file.

```perl
use lib '/home/user/PerlFPM/lib';
use PerlFPM qw(imprMap);
```
<br/>

### Example

> NOTE:
> Sample files `example*.pl` inside `/script` folder are provided in order to show the usage of PerlFPM.

```perl
use lib '/home/user/PerlFPM/lib';
use PerlFPM qw(addn imprMap);

my @input = (1,2,3);
my $addn1_function = addn->(1);
my @result = imprMap(\&$addn1_function, \@input);
print "$_ " for @result; # 2 3 4
```
<br/>

### Features

- [x] Type
- [x] Currying
- [ ] Function declaration
- [x] High Order Function
- [ ] Applicative / Application
