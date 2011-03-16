package Text::Zilla::Role::Dir::Stash;
# ABSTRACT: Directory which has a stash
use Moose::Role;

with qw(
	Text::Zilla::Role::Dir::Base
	Text::Zilla::Role::Stash
);

before tzil_to => sub {
	my ( $self ) = @_;
	for (keys %{$self->tzil_dir_entries}) {
		my $entry = $self->tzil_get_entry($_);
		if ($entry->does('Text::Zilla::Role::Stash')) {
			$entry->parent_tzil_stash(%{$self->tzil_stash});
		}
	}
};

1;