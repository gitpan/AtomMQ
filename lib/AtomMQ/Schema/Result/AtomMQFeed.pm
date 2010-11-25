package AtomMQ::Schema::Result::AtomMQFeed;
use strict;
use warnings;
use base 'DBIx::Class::Core';

__PACKAGE__->table("atommq_feed");

__PACKAGE__->add_columns(
  id =>           { data_type => "varchar", is_nullable => 0, size => 100 },
  title =>        { data_type => "varchar", is_nullable => 0, size => 255 },
  author_name =>  { data_type => "varchar", is_nullable => 1, size => 255 },
  author_email => { data_type => "varchar", is_nullable => 1, size => 255 },
  updated =>      { data_type => "varchar", is_nullable => 0, size => 100 },
);
__PACKAGE__->set_primary_key("id");
__PACKAGE__->add_unique_constraint("title_unique", ["title"]);

__PACKAGE__->has_many(
  "atommq_entries",
  "AtomMQ::Schema::Result::AtomMQEntry",
  { "foreign.feed_title" => "self.title" },
  { cascade_copy => 0, cascade_delete => 0 },
);


1;

__END__
=pod

=head1 NAME

AtomMQ::Schema::Result::AtomMQFeed

=head1 VERSION

version 1.0100

=head1 NAME

AtomMQ::Schema::Result::AtomMQFeed

=head1 ACCESSORS

=head2 id

  data_type: 'varchar'
  is_nullable: 0
  size: 100

=head2 title

  data_type: 'varchar'
  is_nullable: 0
  size: 255

=head2 author_name

  data_type: 'varchar'
  is_nullable: 1
  size: 255

=head2 author_email

  data_type: 'varchar'
  is_nullable: 1
  size: 255

=head2 updated

  data_type: 'varchar'
  is_nullable: 0
  size: 100

=head1 RELATIONS

=head2 atommq_entries

Type: has_many

Related object: L<AtomMQ::Schema::Result::AtomMQEntry>

=head1 AUTHOR

Naveed Massjouni <naveed.massjouni@rackspace.com>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2010 by Naveed Massjouni.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut

