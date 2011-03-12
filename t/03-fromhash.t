use strict;
use warnings;
use Test::More;
use Test::Dirs;
use FindBin qw($Bin);

use Text::Zilla::Dir::FromHash;

my $root = Text::Zilla::Dir::FromHash->new({
	test_13 => 'bla',
	'test_14/door/blub' => 'blub',
	test_17 => {
		test_23 => 'blub',
		'test_24/dir' => 'foobar',
		'test/top/test' => {
			boooooooomdidi => 'byebye',
			'LOSTS_OF_POWERFUL_POINTS....' => 'boom!',
		}
	},
});

my $dir = File::Temp->newdir();
$root->tzil_to($dir);

is_dir($dir, $Bin.'/result-03', 'Checking resulting directory', [], 'verbose' );

done_testing;
