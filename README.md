# PerlFPM
PerlFPM (Perl Functional Programming Module) contains functionalities to utilize functional programming paradigm in Perl.\

> NOTE:
> This module is not intended for utilizing all concepts of functional programming but to utilize some aspects of functional programming paradigm.
> In addition, this module __is not fully functional__, so there are parts \(most of them\) that use imperative approach in the underlying mechanism.
> As a result, the functional paradigm/aspect is utilized when using the provided functions.

### Installation / Run

No additional program is needed for running this module. Just append this code snippet inside the perl file:\

```perl
use lib 'directory of PerlFPM and append /lib';
use PerlFPM;
```

> NOTE:
> Obtaining directory location of PerlFPM could be done with going inside the directory of PerlFPM and run `pwd` command for Linux or `chdir` command for Windows.

As an example: If PerlFPM folder located in `/home/user/PerlFPM`, then append this code snippet inside the perl file.\

```perl
use lib '/home/user/PerlFPM/lib';
use PerlFPM;
```

### Example

> NOTE:
> A sample file `main.pl` inside `/script` folder is provided in order to show the usage of PerlFPM.

### Features

- [x] Currying
- [x] High Order Function
- [ ] Lazy Evaluation
- [ ] Applicative
