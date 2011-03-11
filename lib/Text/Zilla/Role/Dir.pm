package Text::Zilla::Role::Dir;
# ABSTRACT: Required role for all directories
use Moose::Role;
use Text::Zilla::Types ':all';

with qw(
	Text::Zilla::Role::Rights
);

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

1;