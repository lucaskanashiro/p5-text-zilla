package Text::Zilla::Dir::FromHash;
# ABSTRACT: Generate a directory based on a hash structure
use Text::Zilla;
use Text::Zilla::Dir;
use Text::Zilla::File;

tzil_dir;

around BUILDARGS => sub {
	my $orig  = shift;
	my $class = shift;
	my $hash = shift;
	
	die __PACKAGE__." requires a hashref as first parameter" if ref $hash ne 'HASH';

	return $class->$orig( tzil_dir_entries => $class->generate_tzil_entries($hash) );
};

sub generate_tzil_entries {
	my $class = shift;
	my $hash = shift;
	my %result;
	for (keys %{$hash}) {
		my $ref = ref $hash->{$_};
		if ($ref eq 'HASH') {
			$result{$_} = Text::Zilla::Dir::FromHash->new($hash->{$_});
		} else {
			$result{$_} = Text::Zilla::File->new(scalar ($hash->{$_}));
		}
	}
	return \%result;
}

1;