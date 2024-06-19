package PerlFPM;

use strict;
use warnings;

# Types
use Type::Integer qw(integer);
use Type::Float qw(float);
use Type::Bool qw(bool);
use Type::List qw(list);

# Operations
use Operation::ListOperation qw(perlListToFunctionalList functionalListToPerlList);

# Curried Functions
use Currying::Arithmetic qw(addn subn muln divn);
use Currying::Equality qw(eqto grtn grto smtn smto);
use Currying::NumberType qw(isOdd isEven);

# Utilities / Functions which implement High Order Function
use HighOrderFunction::Filter qw(filt);
use HighOrderFunction::Map qw(mapp f_mapp);
use HighOrderFunction::Zip qw(zipp zipplist);

# Applicative
use Applicative::Application qw(seqApplicationList);


require Exporter;
our $VERSION = '0.0.1';
our @ISA = qw(Exporter);
our %EXPORT_TAGS = ('all' => [
	qw(
	integer float bool list
	perlListToFunctionalList functionalListToPerlList
	addn subn muln divn
	eqto grtn grto smtn smto
	isOdd isEven
	filt
	mapp f_mapp
	zipp zipplist
	seqApplicationList
	)
]);
our @EXPORT_OK = (@{ $EXPORT_TAGS{'all'} });

1;
