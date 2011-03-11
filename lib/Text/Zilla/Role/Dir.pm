package Text::Zilla::Role::Dir;
# ABSTRACT: Required role for all directories
use Moose::Role;
use Text::Zilla::Types ':all';

with qw(
	Text::Zilla::Role::Rights
);

excludes 'Text::Zilla::Role::File';

has tzil_parent => (
	is => 'rw',
	isa => TzilDir,
	predicate => 'has_tzil_parent',
);

has tzil_dir_entries => (
	traits    => ['Hash'],
	is        => 'ro',
	isa       => TzilDirEntries,
	default   => sub {{}},
	handles   => {
		tzil_set_entry => 'set',
		tzil_get_entry => 'get',
		tzil_has_entries => 'is_empty',
		tzil_count_entries => 'count',
		tzil_delete_entries => 'delete',
	},
);

after tzil_set_entry => sub {
	my ( $self, $name, $obj ) = @_;
	if ($obj->does('Text::Zilla::Role::Dir')) {
		die __PACKAGE__." already has a parent" if $self->has_tzil_parent;
		$obj->tzil_parent($self);
	}
};

sub tzil_to {
	my ( $self, $dir ) = @_;
	die __PACKAGE__." no dir given" if !$dir;
	die __PACKAGE__." cant write to dir ".$dir if !-w $dir;
	for (keys %{$self->tzil_dir_entries}) {
		my $entry = $self->tzil_get_entry($_);
		if ($entry->does('Text::Zilla::Role::File')) {
			my @dirs = split('/',$_);
			my $filename = pop @dirs;
			die __PACKAGE__." no filename in entry" if !$filename;
			my $parentdirname = "";
			for (@dirs) {
				$parentdirname .= $_.'/';
				mkdir $dir.'/'.$parentdirname if !-e $dir.'/'.$parentdirname;
			}
			$entry->tzil_write_to($dir.'/'.$parentdirname.$filename);
		} elsif ($entry->does('Text::Zilla::Role::Dir')) {
			my @dirs = split('/',$_);
			my $dirname = pop @dirs;
			die __PACKAGE__." no dirname in entry" if !$dirname;
			my $parentdirname = "";
			for (@dirs) {
				$parentdirname .= $_.'/';
				mkdir $dir.'/'.$parentdirname if !-e $dir.'/'.$parentdirname;
			}
			mkdir $dir.'/'.$parentdirname.$dirname;
			$entry->tzil_to($dir.'/'.$parentdirname.$dirname);			
		} else {
			die __PACKAGE__." entry ".$_." is not a file or a dir";
		}
	}
}

1;








