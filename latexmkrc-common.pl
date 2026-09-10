$bibtex_use = 2;

my $epoch = $ENV{SOURCE_DATE_EPOCH};
if ( !defined $epoch ) {
    chomp( my $from_git = `git log -1 --format=%ct 2>/dev/null` );
    $epoch = $from_git if $from_git =~ /^\d+$/;
}
if ( defined $epoch ) {
    $ENV{SOURCE_DATE_EPOCH} = $epoch;
    $ENV{FORCE_SOURCE_DATE} = '1';
}

my $engine_opts = '-synctex=1 -interaction=nonstopmode -file-line-error';
$pdflatex = "pdflatex $engine_opts %O %S";
$lualatex = "lualatex $engine_opts %O %S";
$xelatex  = "xelatex -no-pdf $engine_opts %O %S";

ensure_path( 'BIBINPUTS', '..' );

$clean_ext = 'bbl nav snm vrb run.xml synctex.gz';
