#!/usr/bin/perlml

print "Content-type: text/html\n\n";     # Display count or errors on the page

############################################################################
#
#   Bestdam Logger Lite  by Keith Parkansky
#     Copyright 1999-2001 All rights reserved.
#
#      Perl script - Version 3.0 - SSI required
#
#      For a detailed explanation of how to set up this script,
#      please read the README.TXT file accompanying this script
#      or go to 
#                 http://www.parkansky.com/bdl/bdlogsu.htm
#
#      Here's the short explanation:
#
#      1. In this file:  verify the path to your Perl installation
#                        given in the first line of this file and
#                        modify if necessary.
#
#      2. In this file:  enter your values for the variables below.
#
#      3. Add this SSI directive tag to each Web page that you want
#         to monitor:
#
#            <!--#exec cgi="/cgi-bin/bdlogger/bdlogger.pl" -->
#
#      4. On the server, create a sub-directory under cgi-bin
#         called 'bdlogger'.
#
#      5. USING  ASCII  MODE !, ftp the all the files to this new
#         bdlogger directory.
#
#      6. CHMOD the files as follows:   bdlogger.pl     755
#                                       period.log      666
#                                       trigger.dat     666
#                                       pagehits.cnt    666
#          and with the Deluxe version:
#                                       history.log     666
#                                       iptrack.num     666
#                                       hithistory.txt  666
#
#      7. If you want to use IP blocking (Deluxe edition only),
#         you must use a text editor to create an empty text file
#         with the name of 'ipblock' (no extension) and transfer
#         (ftp) it with the other files and CHMOD it  666 also.
#         In the file, enter one IP address (or partial IP address
#         for entire sub-net blocking) per line to be blocked from
#         the counting.
#
#
#      By using this script your are agreeing to the conditions of,
#      and to be bound by, the Software Licensing Agreement contained
#      in the accompanying README.TXT file.  This software cannot be
#      distributed, duplicated (except for local archival purposes),
#      shared, or otherwise diseminated, in whole or in part under any
#      circumstances without prior appropriate writeen agreement with
#      the author.
#
#      www.parkansky.com                           keith@parkansky.com
#
#      IT IS BEST TO VIEW THIS FILE WITH "WORD WRAP" TURNED ***OFF***
#
############################################################################


  #  YOU ***MUST*** SET THE FIRST  2  USER VARIABLES !

  #      Example:   $sendto = 'bozo@circus.com';
  #                 $mailprgm = '/usr/lib/sendmail -t';

  #  The remaining user variables are for customization.

  #  LITE EDITION USERS - User variables 3, 4, and 8 
  #                       can be used for customization



#--- User Variable 1 --------------------------------------------------------

  # E-mail address to send reports to  -  MUST ENTER

$sendto = 'rjshaver@windstream.net';



#--- User Variable 2 --------------------------------------------------------

  # Path to your server's e-mail program  -  MUST ENTER

  # If your host has Sendmail but the default value
  # below doesn't work, another common path is
  #    $mailprgm = '/bin/sendmail -t'
  # but be sure to keep the -t switch if using Sendmail

  # If you are using Blat on NT/2K, enter the correct
  # path to your installation of Blat.  The most
  # common path is
  #    $mailprgm = 'c:\\Winnt\\System32\\blat.exe';
  # Be sure to use double back-slashes in the path.

$mailprgm = '/usr/sbin/sendmail -t';



#--- User Variable 3 --------------------------------------------------------

  # Count page hits ?
  #    1=Yes / 0=No

$count_hits = 1;



#--- User Variable 4 --------------------------------------------------------

  # Display the counter on the page ?
  #    1=Yes / 0=No

$display_count = 1;



#--- User Variable 5 - DELUXE Edition Only ----------------------------------

  # Reset page counts to zero when report is mailed ?
  #    1=Yes / 0=No

# $reset_counts = 0;



#--- User Variable 6 - DELUXE Edition Only ----------------------------------

  # Update & mail logs  not-at-all/daily/weekly/monthly
  #    0=Not-at-all / 1=Daily / 2=Weekly / 3=Monthly
 
  #   NOTE:  With this value set to '0' (not at all)
  #          Bestdam Logger will perform like your
  #          run-of-the-mill logger/counter.

# $reporting_period = 1;

  # Due the varying number of days in months,
  # montly logging for the previous month will
  # be done when the first hit of the new month
  # is received (probably very early a.m. on the 1st).

  # CAUTION !!!   Choosing 3 (Monthly) could result
  #               in very big period log files by the
  #               last week of the month which could
  #               slow the execution of the script.
  #               It should only be used if you get
  #               less than several hundred hits a
  #               week or have a very fast server.



#--- User Variable 7 - DELUXE Edition Only ----------------------------------

  #  If weekly:  Enter a value between  0  and  6  only !
  #                    Sunday=0 ......... Saturday=6
  #              Report is mailed at your first hit of the
  #              day you specify (probably very early a.m.).

# $day_of_week = 0;



#--- User Variable 8 --------------------------------------------------------

  # E-mail the "period" report ?
  #    1=Yes / 0=No

$mail_report = 1;



#--- User Variable 9 - DELUXE Edition Only ----------------------------------

  # Include the contents of the period log
  # in the e-mailed reports ?
  #    1=Yes / 0=No

# $log_in_mail = 1;



#--- User Variable 10 - DELUXE Edition Only ---------------------------------

  # Double-space the log file in the e-mail report ?
  #    1=Yes / 0=No
  #   The "period" log file lines can be quite long.
  #   You may want to set this to 1 ("Yes") if your
  #      mail reader "wraps" text.  Adjusting the
  #      wrap width will affect log appearance.
  #      Log lines are formatted to appear correctly
  #      with a width of not less than 72 characters.
  #   NOTE that the log will be easier to read if
  #     you set your mail reader to not wrap text.

# $double_space = 0;



#--- User Variable 11 - DELUXE Edition Only ---------------------------------

  # Keep a cummulative "history log" of log entries ?
  #    1=Yes / 0=No
  #   This will be an accumulation of the daily,
  #   weekly, or monthly "period" logs

# $keep_history = 0;



#--- User Variables 12, 13, 14, 15 - DELUXE Edition Only --------------------

  # Keep a history of hit counts for a recurring period
  # to tab-delimited text file for viewing and optional
  # import into into a spreadsheet program for analysis
  # and graphing ?
  #    0=Not-at-all / 1=Daily / 2=Weekly / 3=Monthly

  # NOTE: If set to 1, 2, or 3, the  $count_hits  variable (No. 3)
  #       MUST be set to 'Yes' (1).

# $hit_count_history = 1;


  # Due the varying number of days in months,
  # montly logging for the previous month will
  # be done when the first hit of the new month
  # is received (probably very early a.m. on the 1st).

  #  If weekly:  Enter a value between  0  and  6  only !
  #                    Sunday=0 ......... Saturday=6
  #              The hit count will be logged on the first hit
  #              of the day you specify (probably very early a.m.).

# $hit_count_history_dow = 0;


  # Enter the name of the page you want to
  # you want to keep a history on (ONE PAGE ONLY).
  # In most cases you want to keep this
  # history for your site in general so
  # enter the name of the home page.
  # (Ex: index.html, default.asp, etc.)

# $hit_count_history_page = 'index.html';


  # Inlcude the contents of the hit history file
  # in the e-mailed reports ?
  #    1=Yes / 0=No

# $hit_count_history_in_mail = 0;



#--- User Variable 16 - DELUXE Edition Only ---------------------------------

  # Check IP address so multiple hits from
  # the same address aren't counted  ?
  #    1=Yes / 0=No

  # DON'T set to '1' if you are monitoring mutliple pages

# $check_ip = 0;

  # The default level of "back tracking" is 5 addresses.
  # To lower this, open the 'iptrack.num' file in a
  # text editor and delete the appropriate number
  # of '0.0.0.0' IP addresses.  To increase it,
  # add the appropriate number of '0.0.0.0'
  # IP addresses with each being on their own line.



#--- User Variables 17, 18, 19 - DELUXE Edition Only ------------------------

  # If 'Yes' to display hit counts:
  # Use graphics digits for counter ?
  #    1=Yes / 0=No

# $graphics_count = 0;


  # If 'Yes' to graphics:
  # Enter the path to the digits files RELATIVE to
  # your root URL (www.mydomain.com).
  # This value must begin and end with a '/'
  # Ex:  With the value given below, the URL to the
  # digit graphics files would be www.mydomain.com/digits/

# $digits_path = '/digits/';


  # If 'Yes' to graphics:
  # File extension of digit graphics.
  #   If necessary - rename digit files to 1. 2. 3. etc.
  #     Ex: 1.gif 2.gif 3.gif etc.
  #   Large selection of digits are available at
  #    www.digitmania.holowww.com

# $digits_type = '.gif';

  #  Don't put the digits under the CGI-BIN folder as
  #  people may not be able access them there.
  #
  #  With the above 2 values set correctly you should be
  #  able to view the digits on your browser.  Using the
  #  above settings as an example, you should be able to
  #  see the '1' digit by going to
  #     http://www.mydomain.com/digits/1.gif



#--- User Variables 20, 21 - DELUXE Edition Only ----------------------------

  # Create the hits.htm Web page to view current
  # hit counts using a browser ?
  #    1=Yes / 0=No
  # View the page at http://www.mydomain.com/hits.htm

# $web_count = 0;


  # If 'Yes' to create a hits.htm page,
  # you MUST enter the SYSTEM path to your Web root
  # for the hits.htm file (typically where your home 
  # page is located).

  # The value here is just an example of what's needed.
  # Be sure to leave the   '/   at the beginning and
  # the   /hits.htm';   on the end.
  # If you wish, you can use a name other than 'hits'
  # for the page.

# $count_path = '/usr/local/etc/httpd/usersites/mysite/hits.htm';



#--- User Variables 22, 23 - DELUXE Edition Only ----------------------------

  # Create a Web-page version of the period report
  # (which also contains the hit count data) to
  # view using a browser ?    (preport.htm)
  #    1=Yes / 0=No
  # View the page at http://www.mydomain.com/preport.htm

# $web_report = 0;


  # If 'Yes' to create a preport.htm page,
  # you MUST enter the SYSTEM path to your Web root
  # for the preport.htm file (typically where your 
  # home page is located).

  # The value here is just an example of what's needed.
  # Be sure to leave the   '/   at the beginning and
  # the   /preport.htm';   on the end.
  # If you wish, you can use a name other than 'preport'
  # for the page.

# $report_path = '/usr/local/etc/httpd/usersites/mysite/preport.htm';



#--- User Variables 24, 25 - DELUXE Edition Only ----------------------------

  # Create a Web-page version of the hit count history
  # file to view using a browser ?    (hithistory.htm)
  #    1=Yes / 0=No
  # View the page at http://www.mydomain.com/hithistory.htm

# $web_history = 0;


  # If 'Yes' to create a hithistory.htm page,
  # you MUST enter the SYSTEM path to your Web root
  # for the hithistory.htm file (typically where your 
  # home page is located).

  # The value here is just an example of what's needed.
  # Be sure to leave the   '/   at the beginning and
  # the   /hithistory.htm';   on the end.
  # If you wish, you can use a name other than 'hithistory'
  # for the page.

# $web_history_path = '/usr/local/etc/httpd/usersites/mysite/hithistory.htm';




#==========  STOP HERE !  -  Save your changes and exit
#!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!#


   #--- Initialize variables

   #--- Read current system date/time values into variables
($sec,$min,$hour,$today,$month,$year,$weekday,$dayofyear,$isDST) = localtime(time);

   #--- Environment (visitor and page info)
$os = $ENV{'SERVER_SOFTWARE'};
$sitename = $ENV{'SERVER_NAME'};
$page = $ENV{'DOCUMENT_NAME'};
$client = $ENV{'HTTP_USER_AGENT'};
$addrin = $ENV{'REMOTE_ADDR'};
@ip = split (/\./, $addrin);                   # Break IP address into octets for pack()
$binip = pack ("C4", @ip);                     # Put IP in binary form needed by gethostbyaddr()
$isp = gethostbyaddr ($binip, 2);              # Get domain name of visitor from IP address

   #--- File alias variables
$pagehits = 'pagehits.cnt';
$lasthit = 'trigger.dat';
$periodlog = 'period.log';



#========================  Start of MAIN routine  ====================


  if (index($os,'Microsoft') == -1)           # If server software environment
  {                                           # doesn't contain the word 'Microsoft'
    $winflag = 0;                             # Unix/Linux or Mac server
  }
  else
  {
    $winflag = 1;                             # Evil Empire server
  }


&format_fields;                                # Format log fields (add trailing spaces
                                               # or truncate for fixed length)


   #--- Read day-of-week number of last hit from the trigger file
open (LAST_HIT,"<$lasthit") || die 'Could not OPEN trigger file for READ in MAIN';
flock(LAST_HIT, 1) || die 'Could not LOCK trigger file for READ in MAIN';
$WkDayOfLastHit = <LAST_HIT>;
close LAST_HIT;

if ($WkDayOfLastHit ne $weekday)               # If day change
{

     #--- Update trigger file with new day-of-week number
  open (LAST_HIT,">$lasthit") || die 'Could not OPEN trigger file for WRITE in MAIN';
  flock (LAST_HIT, 2) || die 'Could not LOCK trigger file for WRITE in MAIN';
  print LAST_HIT $weekday;
  close LAST_HIT;

    #--- Do period processing of logs according to period setting in user variable
&update_logs;
if ($mail_report == 1)
  {
    &mail_log;                                 # Generate report e-mail
  }
}



   #--- Update hit counter if enabled in user variable
if ($count_hits == 1)
{
  &count_up;
}


     #--- Update period log file with hit info 
$hit_info = "$hitdate $hittime  $pageft   $isp  $addr  $client\n";
open (PERIOD_LOG,">>$periodlog") || die 'Could not OPEN period log file for APPEND in MAIN';
flock (PERIOD_LOG, 2) || die 'Could not LOCK period log file for APPEND in MAIN';
print PERIOD_LOG "$hit_info";
close PERIOD_LOG; 


exit;

#==========================  End of MAIN  =============================


#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

sub count_up
{

     #--- Open hit count file
  open(PAGE_HITS, "<$pagehits") || die 'Could not OPEN count file for READ in COUNT_UP';
  flock(PAGE_HITS, 1) || die 'Could not LOCK count file for READ in COUNT_UP';

     #--- Load page/hit-count file lines into an array
  while (<PAGE_HITS>)
  {
    chop;
    ($PageURL, $PageCount) = split(/ = /, $_);
    $Allcounts{$PageURL} = $PageCount;
  }

  close(PAGE_HITS);



     #--- Increment the count for the appropriate page
  $Allcounts{$page}++;

     #--- Re-write the page/hit-count file with the updated count
  open(PAGE_HITS, ">$pagehits") || die 'Could not OPEN count file for WRITE in COUNT_UP';
  flock(PAGE_HITS, 2) || die 'Could not LOCK count file for WRITE in COUNT_UP';

  foreach $PageURL (sort keys(%Allcounts))
  {
    print PAGE_HITS "$PageURL = $Allcounts{$PageURL}\n";
  }

  close PAGE_HITS;



    #--- If user chose option to display the count
 if ($display_count == 1)
 {
   print $Allcounts{$page};                    # Text counter
 }

}  # end sub


#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

sub format_fields
{

     #---  Format current date and time

  if ((length($hour))==1)
  {
    $hour = "0".$hour;                         # Create two-digit hours
  }

  if ((length($min))==1)
  {
    $min = "0".$min;                           # Create two-digit minutes
  }

     #-- Set up array for two-digit months
  @months = ('01','02','03','04','05','06','07','08','09','10','11','12');
  $monthft = $months[$month];                  # Secondary value for month

  if (length($today)==1)
  {
    $dayft = '0'.$today;                       # Create two-digit day (date)
  }
  else
  {
    $dayft = $today;
  }

  if ($year > 99)
  {
    $year = $year - 100;                       # Y2K adjustment
  }

  if ((length($year))==1)
  {
    $year = "0".$year;                         # Create two digit year
  }

  $hitdate = "$monthft-$dayft-$year";          # Create log entry variables
  $hittime = "$hour:$min";                  


     #-- Format remaining fields

  $pageft = sprintf("%-16s",$page);            # Make sure field is at least 20 chrs long
  if (length($pageft)>16)                      # Secondary value for page
  {
    $pageft=substr($pageft,0,16);              # If more than 20 chrs, truncate
  }

  $addr = sprintf("%-15s",$addrin);            # Pad IP address with spaces if necessary

  $isp = sprintf("%24s",$isp);                 # Format ISP info for 24 characters
  if (length($isp)>24)
  {
    $isp = reverse ($isp);
    $isp = substr($isp,0,24);                  # If truncating, chop off *leading* chrs
    $isp = reverse ($isp);
  }
                                               # "%-65s" formatting string
  $client = sprintf("%-65s",$client);          #  % = format identifier
  if (length($client)>65)                      #  - = left justify
  {
    $client = substr($client,0,65);            # 65 = minimum length (pad with spaces if necessary)
  }                                            #  s = string

}  # end sub


#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

sub get_yesterday
{


      #--- Get current date/time minus 24 hours (86400 seconds)
  ($ysec,$ymin,$yhour,$ytoday,$ymonth,$yyear,$yweekday,$ydayofyear,$yisDST) = localtime(time-86400);

      #--- Set up array for single-digit months for e-mail
  @ymonths = ('1','2','3','4','5','6','7','8','9','10','11','12');
  $ymonth = $ymonths[$ymonth];

  if (length($ymonth)==1)
  {
    $ymonthft = '0'.$ymonth;                   # Create two-digit month for hit history
  }
  else
  {
    $ymonthft = $ymonth;
  }

  if (length($ytoday)==1)
  {
    $ytodayft = '0'.$ytoday;                   # Create two-digit day for hit history
  }
  else
  {
    $ytodayft = $ytoday;
  }

  if ($yyear > 99)
  {
    $yyear = $yyear - 100;                     # Y2K adjustment
  }

  if ((length($yyear))==1)
  {
    $yyear = "0".$yyear;                       # Create two-digit year for mail and hit history
  }

  $previousday = "$ymonth/$ytoday/$yyear";             # Non-zero-padded date
  $previousdayft = "$ymonthft/$ytodayft/$yyear";       # Zero-padded date

}  # end sub



#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

sub update_logs
{

     #--- Load Period Log into an array
  open (PERIOD_LOG,"<$periodlog") || die 'Could not OPEN period log for READ in UPDATE_LOGS';
  flock(PERIOD_LOG, 1) || die 'Could not LOCK period log for READ in UPDATE_LOGS';
  @periodloglines=<PERIOD_LOG>;                # Load lines of period log into array
  close (PERIOD_LOG);

     #--- Clear the Period Log
  open (PERIOD_LOG,">$periodlog") || die 'Could not OPEN period log for CLEAR in UPDATE_LOGS';
  flock (PERIOD_LOG, 2) || die 'Could not LOCK period log for CLEAR in UPDATE_LOGS';
  print PERIOD_LOG "\n";                       # Overwrite period log with a line-feed to clear it
  close (PERIOD_LOG);

}  # end sub



#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

sub mail_log {

   &get_yesterday;                             # Get previous day's date

   $dashes = '-' x 74;

      #--- Open the user-specified e-mail program with recipient info

   if ($winflag == 1)
   {
     $subject = "$ymonth/$ytoday Report for $sitename";
     $blatprgm = "$mailprgm - -t $sendto -s \"$subject\" -q";
     open (MAIL, "|$blatprgm") || die 'Could not open mail program';
   } 
   else
   {
     open (MAIL, "|$mailprgm") || die 'Could not open mail program';
     print MAIL "To: $sendto\n";
     print MAIL "From: Bestdam-Logger\n";
     print MAIL "Subject: $ymonth/$ytoday Report for $sitename\n\n";
   }


      #--- Print hit stats if user chose the option
   if ($count_hits == 1)
   {
     open(PAGE_HITS, "<$pagehits") || die 'Could not OPEN count file for READ in MAIL_LOG';
     flock(PAGE_HITS, 1) || die 'Could not LOCK count file for READ in MAIL_LOG';

        #--- Load page/hit-count records into an array
     @hitfilelines=<PAGE_HITS>;
     close(PAGE_HITS);

     foreach  $hitline (@hitfilelines)
     {
       print MAIL "$hitline";
     }

   }
   else
   {
     print MAIL "Hit counting is disabled in user settings.\n";
   }

   print MAIL "\n\nHit count history table:  n/a  (feature of the Deluxe Edition)";
   print MAIL "\n\nHistory Log file size is now  n/a  bytes  (feature of the Deluxe Edition)\n\n";
   print MAIL "$dashes\n\n";
   print MAIL "Period log:  n/a  (feature of the Deluxe Edition)\n";
   print MAIL "\n$dashes\n";
   print MAIL "     Report compiled and sent by Bestdam Logger Lite v3.0\n";
   print MAIL "     http://www.parkansky.com/bdl/bdlogger.htm\n";
   close (MAIL);

}  # end sub


####################################################################
