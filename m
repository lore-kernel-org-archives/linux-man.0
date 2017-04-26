From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] Use lower case for hostname example
Date: Wed, 26 Apr 2017 13:14:06 +0200
Message-ID: <4cf42c3d-d16d-37e9-b885-0e7ac69409a8@gmail.com>
References: <142de45e-6ca5-bfea-60ab-9d634740a709@redhat.com>
 <dc80bc0c-97ed-c06b-a9f8-328f7e9c07f0@redhat.com>
 <9c83498f-bb57-4263-bfb0-fb12ac5cf8d6@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <9c83498f-bb57-4263-bfb0-fb12ac5cf8d6-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marko Myllynen <myllynen-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Florian Weimer <fweimer-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hello Marko,

On 04/26/2017 12:07 PM, Marko Myllynen wrote:
> Hi,
> 
> On 2017-04-18 23:00, Florian Weimer wrote:
>> On 04/18/2017 12:54 PM, Marko Myllynen wrote:
>>> I think upper-casing hostnames was a thing of the 90s, is this ok?
>>
>> I think the expectation today is to use example (the TLD) or
>> example.com/example.net/example.org in documentation.
> 
> Good point, below are two patches, the first updated hostname.7 to use
> example.com and the second one does the same for mailaddr.7, switches
> the example name to John Doe, and cleans up the page a bit.

Thanks. Applied.

> Michael, I see mailaddr.7 references to forward.5 which is not
> available, perhaps you can consider could that be imported from FreeBSD
> as well as these pages have been imported in the past?

It turns out that there is a forward(5) page provided by the 
opensmtpd package.

Cheers,

Michael


> ---
>  man7/hostname.7 | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/man7/hostname.7 b/man7/hostname.7
> index 5c9916c..42981d9 100644
> --- a/man7/hostname.7
> +++ b/man7/hostname.7
> @@ -41,8 +41,8 @@
>  hostname \- hostname resolution description
>  .SH DESCRIPTION
>  Hostnames are domains, where a domain is a hierarchical, dot-separated
> -list of subdomains; for example, the machine "monet", in the "berkeley"
> -subdomain of the "edu" domain would be represented as "monet.berkeley.edu".
> +list of subdomains; for example, the machine "monet", in the "example"
> +subdomain of the "com" domain would be represented as "monet.example.com".
>  
>  Each element of the hostname must be from 1 to 63 characters long and the
>  entire hostname, including the dots, can be at most 253 characters long.
> @@ -90,9 +90,9 @@ by searching through a list of domains until a match is found.
>  The default search list includes first the local domain,
>  then its parent domains with at least 2 name components (longest first).
>  For example,
> -in the domain cs.berkeley.edu, the name lithium.cchem will be checked first
> -as lithium.cchem.cs.berkeley.edu and then as lithium.cchem.berkeley.edu.
> -lithium.cchem.edu will not be tried, as there is only one component
> +in the domain cs.example.com, the name lithium.cchem will be checked first
> +as lithium.cchem.cs.example and then as lithium.cchem.example.com.
> +lithium.cchem.com will not be tried, as there is only one component
>  remaining from the local domain.
>  The search path can be changed from the default
>  by a system-wide configuration file (see
> 
> 
> 
> ---
>  man7/mailaddr.7 | 58 +++++++++++++++++++++++++++------------------------------
>  1 file changed, 27 insertions(+), 31 deletions(-)
> 
> diff --git a/man7/mailaddr.7 b/man7/mailaddr.7
> index b8d6221..efee900 100644
> --- a/man7/mailaddr.7
> +++ b/man7/mailaddr.7
> @@ -30,8 +30,8 @@
>  mailaddr \- mail addressing description
>  .SH DESCRIPTION
>  .nh
> -This manual page gives a brief introduction to SMTP mail addresses, as
> -used on the Internet.
> +This manual page gives a brief introduction to SMTP mail addresses,
> +as used on the Internet.
>  These addresses are in the general format
>  .PP
>  	user@domain
> @@ -39,22 +39,22 @@ These addresses are in the general format
>  where a domain is a hierarchical dot-separated list of subdomains.
>  These examples are valid forms of the same address:
>  .PP
> -	eric-KsCkCVd8X07GMufIjQWhmTe48wsgrGvP@public.gmane.org
> +	john.doe-+jUuUzO5CxSkmABc3PwzPQC/G2K4zDHf@public.gmane.org
>  .br
> -	Eric Allman <eric-KsCkCVd8X07GMufIjQWhmTe48wsgrGvP@public.gmane.org>
> +	John Doe <john.doe-+jUuUzO5CxSkmABc3PwzPQC/G2K4zDHf@public.gmane.org>
>  .br
> -        eric-KsCkCVd8X07GMufIjQWhmTe48wsgrGvP@public.gmane.org (Eric Allman)
> +	john.doe-+jUuUzO5CxSkmABc3PwzPQC/G2K4zDHf@public.gmane.org (John Doe)
>  .PP
> -The domain part ("monet.berkeley.edu") is a mail-accepting domain.
> +The domain part ("monet.example.com") is a mail-accepting domain.
>  It can be a host and in the past it usually was, but it doesn't have to be.
>  The domain part is not case sensitive.
>  .PP
> -The local part ("eric") is often a username, but its meaning is
> -defined by the local software.
> +The local part ("john.doe") is often a username,
> +but its meaning is defined by the local software.
>  Sometimes it is case sensitive,
>  although that is unusual.
> -If you see a local-part that looks like
> -garbage, it is usually because of a gateway between an internal e-mail
> +If you see a local-part that looks like garbage,
> +it is usually because of a gateway between an internal e-mail
>  system and the net, here are some examples:
>  .PP
>  	"surname/admd=telemail/c=us/o=hp/prmd=hp"@some.where
> @@ -69,42 +69,39 @@ system and the net, here are some examples:
>  internal mail system that lacks proper internet support, an UUCP
>  gateway, and the last one is just boring username policy.)
>  .PP
> -The real-name part ("Eric Allman") can either be placed before
> +The real-name part ("John Doe") can either be placed before
>  <>, or in () at the end.
>  (Strictly speaking the two aren't the same,
>  but the difference is beyond the scope of this page.)
>  The name may have to be quoted using "", for example, if it contains ".":
>  .PP
> -	"Eric P. Allman" <eric-KsCkCVd8X07GMufIjQWhmTe48wsgrGvP@public.gmane.org>
> -.SS Abbreviation.
> +	"John Q. Doe" <john.doe-+jUuUzO5CxSkmABc3PwzPQC/G2K4zDHf@public.gmane.org>
> +.SS Abbreviation
>  .PP
> -Many mail systems let users abbreviate the domain name.
> +Some mail systems let users abbreviate the domain name.
>  For instance,
> -users at berkeley.edu may get away with "eric@monet" to send mail to
> -Eric Allman.
> +users at example.com may get away with "john.doe@monet" to
> +send mail to John Doe.
>  .I "This behavior is deprecated."
>  Sometimes it works, but you should not depend on it.
> -.SS Route-addrs.
> +.SS Route-addrs
>  .PP
>  In the past, sometimes one had to route a message through
>  several hosts to get it to its final destination.
> -Addresses which
> -show these relays are termed "route-addrs".
> +Addresses which show these relays are termed "route-addrs".
>  These use the syntax:
>  .PP
>  	<@hosta,@hostb:user@hostc>
>  .PP
> -This specifies that the message should be sent to hosta, from there
> -to hostb, and finally to hostc.
> -Many hosts disregard route-addrs
> -and send directly to hostc.
> +This specifies that the message should be sent to hosta,
> +from there to hostb, and finally to hostc.
> +Many hosts disregard route-addrs and send directly to hostc.
>  .PP
>  Route-addrs are very unusual now.
> -They occur sometimes in old mail
> -archives.
> +They occur sometimes in old mail archives.
>  It is generally possible to ignore all but the "user@hostc"
>  part of the address to determine the actual address.
> -.SS Postmaster.
> +.SS Postmaster
>  .PP
>  Every site is required to have a user or user alias designated
>  "postmaster" to which problems with the mail system may be
> @@ -115,12 +112,11 @@ The "postmaster" address is not case sensitive.
>  .br
>  .I ~/.forward
>  .SH SEE ALSO
> -.BR binmail (1),
>  .BR mail (1),
> -.BR mconnect (1),
>  .BR aliases (5),
>  .BR forward (5),
> -.BR sendmail (8),
> -.BR vrfy (8)
> +.BR sendmail (8)
>  
> -RFC\ 2822 (Internet Message Format)
> +.UR http://www.ietf.org\:/rfc\:/rfc5322.txt
> +IETF RFC\ 5322
> +.UE
> 
> Thanks,
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
