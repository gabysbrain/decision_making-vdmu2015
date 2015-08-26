
#@default_files=("uw2015");

# generate a dvi and then convert with ps2pdf
$pdf_mode = 2;

$latex="latex -interaction=nonstopmode";

$dvips = 'dvips -t letter -Pdownload35 -Ppdf -G0 -o %D %S';

$ps2pdf = 'ps2pdf -sPAPERSIZE=letter -dMaxSubsetPct=100 -dCompatibilityLevel=1.3 -dSubsetFonts=true -dEmbedAllFonts=true -dAutoFilterColorImages=false -dAutoFilterGrayImages=false -dColorImageFilter=/FlateEncode -dGrayImageFilter=/FlateEncode -dMonoImageFilter=/FlateEncode %S %D';

# also clean up dependencies
$cleanup_includes_cusdep_generated = 1;

# dependencies for md -> tex files
add_cus_dep('md', 'tex', 0, 'md2tex');
sub md2tex {
  system("pandoc -f markdown -t latex --natbib `basename $_[0].md` > `basename $_[0].tex`");
}

# dependencies for Rtex -> tex files
add_cus_dep('Rtex', 'tex', 0, 'rtex2tex');
sub rtex2tex {
  my $base = shift @_;
  my $rtex = "$base.Rtex";
  system("Rscript -e \"library(knitr); knit('$rtex')\"");
}

