package Dancer::Template::HtmlTemplate;

use strict;
use warnings;
use Dancer::Config 'setting';
use Dancer::ModuleLoader;
use Dancer::FileUtils 'path';

use base 'Dancer::Template::Abstract';

my $_engine;

sub init {
    my ($self) = @_;

    die "HTML::Template is needed by Dancer::Template::HtmlTemplate"
      unless Dancer::ModuleLoader->load('HTML::Template');

    $_engine = Template->new(%$tt_config);
}

sub render($$$) {
    my ($self, $template, $tokens) = @_;
    die "'$template' is not a regular file"
      if !ref($template) && (!-f $template);

    my $template = HTML::Template->new(filename => $template, %{$self->config});
    $template->param($tokens);
    return $template->output;

}

1;
__END__

=pod

=head1 NAME

Dancer::Template::HtmlTemplate - HTML::Template wrapper for Dancer

=head1 DESCRIPTION

This class is an interface between Dancer's template engine abstraction layer
and the L<HTML::Template> module.

In order to use this engine, use the template setting:

    template: html_template

This can be done in your config.yml file or directly in your app code with the
B<set> keyword.


=head1 SEE ALSO

L<Dancer>, L<HTML::Template>


=head1 AUTHOR
 
David Precious, C<< <davidp@preshweb.co.uk> >>
 
 
=head1 CONTRIBUTING
 
This module is developed on Github at:                                                          
 
L<http://github.com/bigpresh/Dancer-Template-HtmlTemplate>
 
Feel free to fork the repo and submit pull requests!


=head1 LICENSE

This module is free software and is released under the same terms as Perl
itself.

=cut

