package Text::Zilla::Role::Dir::Stash;
# ABSTRACT: Directory which has a stash
use Moose::Role;

with qw(
	Text::Zilla::Role::Dir::Base
);

has tzil_stash => (
	traits    => ['Hash'],
	is        => 'ro',
	isa       => 'HashRef',
	default   => sub {{}},
	handles   => {
		tzil_stash_set => 'set',
		tzil_stash_get => 'get',
		tzil_stash_empty => 'is_empty',
		tzil_stash_count => 'count',
		tzil_stash_delete => 'delete',
	},
);

after tzil_set_entry => sub {
	my ( $self, $name, $obj ) = @_;
	if ($obj->does('Text::Zilla::Role::Dir::Stash')) {
		my %new_stash = %{$obj->tzil_stash};
		$obj->tzil_stash(\%new_stash);
	}
};

1;