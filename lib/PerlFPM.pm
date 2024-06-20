package PerlFPM;

use strict;
use warnings;

# Types
use Type::Integer qw(integer);
use Type::Float qw(float);
use Type::Bool qw(bool);
use Type::Any qw(any);
use Type::List qw(list);

# Operations
use Operation::ListOperation qw(perlListToFunctionalList functionalListToPerlList printFunctionalList print2DFunctionalList);

# Curried Functions
use Currying::Arithmetic qw(addn subn muln divn addition subtraction multiplication division);
use Currying::Equality qw(eqto grtn grto smtn smto equal greaterThan greaterTo smallerThan smallerTo);
use Currying::NumberType qw(isOdd isEven isOddInteger isEvenInteger);

# Utilities / Functions which implement High Order Function
use HighOrderFunction::Filter qw(imprFilter filtering);
use HighOrderFunction::Map qw(imprMap mapping);
use HighOrderFunction::Zip qw(imprZip imprZipList zipping zippingWithFunction);

# Applicative
use Applicative::Application qw(imprSeqApplication);


require Exporter;
our $VERSION = '0.0.1';
our @ISA = qw(Exporter);
our %EXPORT_TAGS = ('all' => [
	qw(
	integer float bool any list
	perlListToFunctionalList functionalListToPerlList printFunctionalList print2DFunctionalList
	addn subn muln divn addition subtraction multiplication division
	eqto grtn grto smtn smto equal greaterThan greaterTo smallerThan smallerTo
	isOdd isEven isOddInteger isEvenInteger
	imprFilter filtering
	imprMap mapping
	imprZip imprZipList zipping zippingWithFunction
	imprSeqApplication
	)
]);
our @EXPORT_OK = (@{ $EXPORT_TAGS{'all'} });

1;
