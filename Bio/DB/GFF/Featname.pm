=head1 NAME

Bio::DB::GFF::Featname -- The name of a feature

=head1 SYNOPSIS

  use Bio::DB::GFF;

  my $db      = Bio::DB::GFF->new( -adaptor => 'dbi:mysql',
                                   -dsn     => 'dbi:mysql:elegans42');

  my $feature = Bio::DB::GFF::Featname->new(Locus => 'unc-19');
  my $segment = $db->segment($feature);

=head1 DESCRIPTION

Bio::DB::GFF::Featname is the name of a feature.  It contains two
fields: name and class.  It is typically used by the Bio::DB::GFF
module to denote a group, and is accepted by
Bio::DB::Relsegment->new() and Bio::DB::GFF->segment() as a
replacement for the -name and -class arguments.

=head1 METHODS

=cut

package Bio::DB::GFF::Featname;
use strict;

use overload 
  '""' => 'asString',
  fallback => 1;

=head2 new

 Title   : new
 Usage   : $name = Bio::DB::GFF::Featname->new($class,$name)
 Function: create a new Bio::DB::GFF::Featname object
 Returns : a new Bio::DB::GFF::Featname object
 Args    : class and ID
 Status  : Public

=cut

sub new    { bless {class=>$_[1],name=>$_[2]},$_[0] }

=head2 id

 Title   : id
 Usage   : $id = $name->id
 Function: return a unique ID for the combination of class and name
 Returns : a string
 Args    : none
 Status  : Public

This method returns a unique combination of the name and class in the
form "class:name".  Coincidentally, this is the same format used
by AceDB.

=cut

sub id     {
  my $self = shift;
  return join ':',@{$self}{qw(class name)};
}

=head2 name

 Title   : name
 Usage   : $name = $name->name
 Function: return the name of the Featname
 Returns : a string
 Args    : none
 Status  : Public

=cut

sub name   { shift->{name} }

=head2 class

 Title   : class
 Usage   : $class = $name->class
 Function: return the name of the Featname
 Returns : a string
 Args    : none
 Status  : Public

=cut

sub class  { shift->{class} }


=head2 asString

 Title   : asString
 Usage   : $string = $name->asString
 Function: same as name()
 Returns : a string
 Args    : none
 Status  : Public

This method is used to overload the "" operator.  It is equivalent to
calling name().

=cut

sub asString { shift->name }

=head1 BUGS

This module is still under development.

=head1 SEE ALSO

L<bioperl>, L<Bio::DB::GFF>, L<Bio::DB::RelSegment>

=head1 AUTHOR

Lincoln Stein E<lt>lstein@cshl.orgE<gt>.

Copyright (c) 2001 Cold Spring Harbor Laboratory.

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

1;
