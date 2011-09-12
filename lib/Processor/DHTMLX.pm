package Processor::DHTMLX;

use strict;
use warnings;
use XML::Simple;

sub new {
    my $self = shift;
    
    $self = {
        type => shift,
        sid => shift,
        tid => shift,
        encoding => shift || 'utf8'
    };
    
    bless($self);
    
    return $self;
}

sub xml {
    my $self = shift;
    
    my $xml = new XML::Simple (RootName=>'data');
    
    my $data = {
        action => [
            {
                type => $self->{type},
                sid => $self->{sid},
                tid => $self->{tid}
            }
        ]
    };
    
    my $result = "<?xml version='1.0' encoding='$self->{encoding}'?>\n";
    $result .= $xml->XMLout($data);
    
    return $result;
}


1;


=head1 NAME

Processor::DHTMLX - Grid Processor in XML

=head1 VERSION

Version 0.01

=head1 SYNOPSIS
    
    use CGI;
    use Processor::DHTMLX;
    
    my $q = CGI->new;
    
    $q->header('text/xml');
    
    my $data = Processor::DHTMLX->new('updated', 135, 135, 'ISO-8859-1');
    print $data->xml;
    
Processor::DHTMLX->(type, sid, tid, encoding)

parameter type: inserted, updated, deleted

parameter sid: new id

parameter tid: old id

parameter encoding: optional, default utf8

=head2 xml

To generate the XML

=head1 AUTHOR

Lucas Tiago de Moraes -> C<< <lucastiagodemoraes@gmail.com> >>

=head1 COPYRIGHT

Lucas1 2011
    



