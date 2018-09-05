#!/usr/bin/perl
# password_change.cgi
# Actually update a user's password by directly modifying /etc/shadow

BEGIN { push(@INC, ".."); };
use WebminCore;
use GEHC::Functions;

$ENV{'MINISERV_INTERNAL'} || die "Can only be called by miniserv.pl";
&init_config();
&ReadParse();
&get_miniserv_config(\%miniserv);
$miniserv{'passwd_mode'} == 2 || die "Password changing is not enabled!";

# Validate inputs
$in{'new1'} ne '' || &pass_error($text{'password_enew1'});
$in{'new1'} eq $in{'new2'} || &pass_error($text{'password_enew2'});

if (! GEHC::Functions->isValidPassword($in{'new1'})){
        &pass_error($text{'password_minlenth'});
        }
else {
if  ($in{'new1'} =~ m/^[A-Za-z]+$/)
{
        &pass_error($text{'password_alpha'});
}
if  ($in{'new1'} =~ m/^[0-9]+$/)
{
        &pass_error($text{'password_num'});
}
if($in{'new1'} =~ /[&<>; ]/) {
        &pass_error($text{'password_invalidchar'});
        }
if($in{'new1'} =~ /(.)\1\1+/) {
        &pass_error($text{'password_match'});
        }
if ( ($in{'new1'} !~ /\p{Uppercase}/) || ($in{'new1'} !~ /\p{Lowercase}/) ){
	&pass_error($text{'password_match'});
        }
}
