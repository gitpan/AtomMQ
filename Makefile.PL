
use strict;
use warnings;



use ExtUtils::MakeMaker 6.31;



my %WriteMakefileArgs = (
  'ABSTRACT' => 'An atompub server that supports the message queue/bus model.',
  'AUTHOR' => 'Naveed Massjouni <naveed.massjouni@rackspace.com>',
  'BUILD_REQUIRES' => {},
  'CONFIGURE_REQUIRES' => {
    'ExtUtils::MakeMaker' => '6.31'
  },
  'DISTNAME' => 'AtomMQ',
  'EXE_FILES' => [],
  'LICENSE' => 'perl',
  'NAME' => 'AtomMQ',
  'PREREQ_PM' => {
    'Atompub::Server' => '0',
    'Capture::Tiny' => '0',
    'DBD::SQLite' => '0',
    'DBIx::Class' => '0.08115',
    'Moose' => '0',
    'MooseX::NonMoose' => '0',
    'SQL::Translator' => '0.11006',
    'Test::Exception' => '0',
    'Test::MockObject' => '0',
    'XML::Atom' => '0'
  },
  'VERSION' => '1.0000',
  'test' => {
    'TESTS' => 't/*.t'
  }
);


unless ( eval { ExtUtils::MakeMaker->VERSION(6.56) } ) {
  my $br = delete $WriteMakefileArgs{BUILD_REQUIRES};
  my $pp = $WriteMakefileArgs{PREREQ_PM};
  for my $mod ( keys %$br ) {
    if ( exists $pp->{$mod} ) {
      $pp->{$mod} = $br->{$mod} if $br->{$mod} > $pp->{$mod};
    }
    else {
      $pp->{$mod} = $br->{$mod};
    }
  }
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);



