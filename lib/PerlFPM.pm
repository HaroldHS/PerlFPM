package PerlFPM;

use strict;
use warnings;

use Currying::Arithmetic qw(addn subn muln divn);
use Currying::Equality qw(eqto grtn grto smtn smto);
use Currying::NumberType qw(isOdd isEven);
use HighOrderFunction::Filter qw(filt);
use HighOrderFunction::Map qw(mapp);
use HighOrderFunction::Zip qw(zipp zipplist);

require Exporter;

our $VERSION = '0.0.1';

our @ISA = qw(Exporter);
our %EXPORT_TAGS = ('all' => [
	qw(
	addn subn muln divn
	eqto grtn grto smtn smto
	isOdd isEven
	filt mapp zipp zipplist
	)
]);
our @EXPORT_OK = (@{ $EXPORT_TAGS{'all'} });

1;
