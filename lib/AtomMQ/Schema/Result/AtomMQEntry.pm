package AtomMQ::Schema::Result::AtomMQEntry;
use strict;
use warnings;
use base 'DBIx::Class::Core';

__PACKAGE__->table("atommq_entry");

__PACKAGE__->add_columns(
    id => {
        data_type => 'integer',
        is_nullable => 0,
        is_auto_increment => 1,
    },
    feed => {
        data_type => 'varchar',
        is_nullable => 0,
        size => 255,
    },
    title => {
        data_type => 'varchar',
        is_nullable => 0,
        size => 255,
    },
    content => {
        data_type => 'text',
        is_nullable => 0,
    },
);

__PACKAGE__->set_primary_key("id");

1;

__END__
=pod

=head1 NAME

AtomMQ::Schema::Result::AtomMQEntry

=head1 VERSION

version 0.0100

=head1 AUTHOR

Naveed Massjouni <naveed.massjouni@rackspace.com>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2010 by Naveed Massjouni.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut

