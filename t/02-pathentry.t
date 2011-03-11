use strict;
use warnings;
use Test::More;
use Test::Dirs;
use FindBin qw($Bin);

use Text::Zilla::File;
use Text::Zilla::Dir;

my $root = Text::Zilla::Dir->new;
isa_ok($root, 'Text::Zilla::Dir');

my $testfile = Text::Zilla::File->new();
isa_ok($testfile, 'Text::Zilla::File');

my $testdir = Text::Zilla::Dir->new;
isa_ok($testdir, 'Text::Zilla::Dir');

$testdir->tzil_set_entry('deeper/testfile',$testfile);
is($testdir->tzil_get_entry('deeper/testfile'), $testfile, 'Checking entry deeper/testfile of testdir');
$testdir->tzil_set_entry('more/deeper/testfile',$testfile);
is($testdir->tzil_get_entry('more/deeper/testfile'), $testfile, 'Checking entry more/deeper/testfile of testdir');

$root->tzil_set_entry('longdir/longerdir/testdir',$testdir);
is($root->tzil_get_entry('longdir/longerdir/testdir'), $testdir, 'Checking entry longdir/longerdir/testdir of root');
$root->tzil_set_entry('otherdir/testfile',$testfile);
is($root->tzil_get_entry('otherdir/testfile'), $testfile, 'Checking entry otherdir/testfile of root');
$root->tzil_set_entry('otherdir2/testfile',$testfile);
is($root->tzil_get_entry('otherdir2/testfile'), $testfile, 'Checking entry otherdir2/testfile of root');
$root->tzil_set_entry('otherdir3/testfile',$testfile);
is($root->tzil_get_entry('otherdir3/testfile'), $testfile, 'Checking entry otherdir3/testfile of root');

my $dir = File::Temp->newdir();
$root->tzil_to($dir);

is_dir($dir, $Bin.'/result-02', 'Checking resulting directory', [], 'verbose' );

done_testing;
