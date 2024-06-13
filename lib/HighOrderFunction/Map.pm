package HighOrderFunction::Map;

use Exporter "import";
our @EXPORT_OK = qw(mapp);

sub mapp {
	my $function = $_[0];
	my @target_list = @{$_[1]};
	my @result = ();

	for $target (@target_list) {
		push(@result, $function->($target));
	}

	return @result;
}

1;
