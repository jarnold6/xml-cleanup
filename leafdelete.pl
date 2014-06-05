use strict;
use warnings;


chdir('/Users/arnoldj/Desktop/') or die "$!";

open (FILE, "<text.xml") or die "Can't open text.xml: $!\n";
my @lines = <FILE>;
close FILE;

my @newlines;
foreach ( @lines ) {
$_ =~ 


#  Delete unnecessary leaf info
s/<\/p>\|.//g;
s/\/align\|//g;
s/para:([a-z]*?)$//g;
s/type:([a-z]*?)$^ \((.*?)\)//g;
s/type:([a-z]*)$//g;
s/^ \((.*?)\)//g;
s/\(pdf:(.*?)bx:(.*?);\[(.*?)\]\)/pdf:$1bx:$2/g;
s/re:([_0-9A-Za-z]*) \((.*?)\)//g;
s/\[LW_Check\]//g;
s/^([.^(]*?)\)([ ]*)$//g;
s/^([ ]*)\)([ ]*)$//g;
s/^([ ]+)(.*?)\)([ ]+)page:([0-9]*)(.*?)$/page:$4$5/g;



#  Turn quotes

 
s/([a-z]) \.\.\.\./$1..../g;
s/\.\.\.\.([a-z])/.... $1/g;
s/\.\.\.\./.\&#160;.\&#160;.\&#160;./g;
s/\?\.\.\.([a-z])/?.... $1/g;
s/\?\.\.\./?\&#160;.\&#160;.\&#160;./g;
s/!\.\.\.([a-z])/!…. $1/g;
s/!\.\.\./!\&#160;.\&#160;.\&#160;./g;
s/([a-z])\.\.\./$1 .../g;
s/\.\.\.([a-z])/... $1/g;
s/\.\.\./.\&#160;.\&#160;./g;
s/.\&#160;.\&#160;.\?/.\&#160;.\&#160;.\&#160;?/g;
s/.\&#160;.\&#160;.\!/.\&#160;.\&#160;.\&#160;!/g;
s/\.\&#160;\.\&#160;\.\&#160;\./.\&#160;.\&#160;.\&#160;. /g;
s/"'/"‘/g;
s/ '([-“a-zA-Z])/ ‘$1/g;
s/'/’/g;
s/"(.*?)"/“$1”/g;
s/id=(.)([a-z])(.*?)(.) filename/id="$1$2$3$4" filename/g;
s/filename=(.)([a-z])(.*?)(.) scale/filename="$1$2$3$4"  scale/g;
s/scale=(.)([a-z])(.*?)(.) /scale="$1$2$3$4" /g;
s/” scale=/" scale=/g;
s/” filename=/" filename=/g;
s/version=“1\.0” encoding=“UTF-8”/version="1.0" encoding="UTF-8"/g;
s/SYSTEM “bookXML/SYSTEM "bookXML/g;
s/book-driver\.dtd"/book-driver.dtd”/g;
s/=“/="/g;
s/=”/="/g;
s/”>/">/g;
s/“>/">/g;
s/”\/>/"\/>/g;
s/\. "/. “/g;
s/<\/emph>“/<\/emph>”/g;
s/<\/emph>‘/<\/emph>’/g;
s/&#x2014;”([a-z])/\&#x2014;“$1/g;
s/, "/, “/g;
s/<p>([ ]+)"/<p>$1“/g;
s/<p>"/<p>“/g;
s/"<\/p>/”<\/p>/g;
s/"<break\/>/”<break\/>/g;
s/"([.^"]*?)<\/p>/”$1<\/p>/g;

push(@newlines,$_);
}

open(FILE, ">text.xml") || die "File not found";
print FILE @newlines;
close(FILE);





open(FILE, ">text.xml") || die "File not found";
print FILE @newlines;
close(FILE);



open (FILE, "<text.xml") or die "Can't open text.xml: $!\n";
my @lines2 = <FILE>;
close FILE;

  
my $pattern = '[-!?.> a-zA-Z]["][-.< a-zA-Z]';


sub grep_pattern	# Print strings which contain the pattern
{ foreach (@lines2)
    {print "$_\n" if /$pattern/;
     }
print "\n\n";
}

  
my $pattern2 = '[-!?.> a-zA-Z][\'][-.< a-zA-Z]';


sub grep_pattern_single	# Print strings which contain the pattern
{ foreach (@lines2)
    {print "$_\n" if /$pattern2/;
     }
print "\n\n";
}

print "POSSIBLE DOUBLE QUOTATION ERRORS:";
grep_pattern;


print "POSSIBLE SINGLE QUOTATION ERRORS:";
grep_pattern_single;

