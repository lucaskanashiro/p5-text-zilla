package Text::Zilla::Role::Stash;
# ABSTRACT: Something with a stash ;)
use Moose::Role;

has tzil_stash => (
	traits    => ['Hash'],
	is        => 'rw',
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

sub parent_tzil_stash {
	my ( $self, %new_stash ) = @_;
	for (keys %new_stash) {
		$self->tzil_stash_set($_,$new_stash{$_});
	}
}

1;