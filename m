From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] host.conf(5): order option deprecated, replaced by nsswitch.conf(5)
Date: Mon, 12 May 2014 09:38:27 +0200
Message-ID: <CAKgNAkifXt0Mf7GXR+B9VEkLcGByN1U846gYY9e9ZMVNt0CKuw@mail.gmail.com>
References: <1355073222-13020-1-git-send-email-spaillard@debian.org> <CAKgNAkixQ7=9EQdbM_1EQJsDq=3gWV6eYwuk0DDc3UUL8YmtYw@mail.gmail.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAKgNAkixQ7=9EQdbM_1EQJsDq=3gWV6eYwuk0DDc3UUL8YmtYw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Simon Paillard <spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Cc: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Marko Myllynen <myllynen-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hi Simon,

Marko filed https://bugzilla.kernel.org/show_bug.cgi?id=75991, which
prompts me to ping you about the below.

Cheers,

Michael


On Fri, Aug 9, 2013 at 10:40 AM, Michael Kerrisk (man-pages)
<mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> Simon,
>
> So, from the references you've given, and from a little bit of code
> spelunking, it looks like the change took place in glibc 2.5. I'd much
> prefer a patch that preserved the glibc <= 2.4 info, and noted that
> "order" is ignored in glibc >= 2.5. See some notes below.
>
>
> On Sun, Dec 9, 2012 at 6:13 PM, Simon Paillard <spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org> wrote:
>> http://www.sourceware.org/bugzilla/show_bug.cgi?id=2389
>> http://repo.or.cz/w/glibc.git/commit/b9c65d0902e5890c4f025b574725154032f8120a
>>
>> Reported at http://bugs.debian.org/270368 http://bugs.debian.org/396633
>> ---
>>  man3/resolver.3    |    2 +-
>>  man5/host.conf.5   |   14 ++------------
>>  man5/resolv.conf.5 |    4 +++-
>>  3 files changed, 6 insertions(+), 14 deletions(-)
>>
>> diff --git a/man3/resolver.3 b/man3/resolver.3
>> index 991b263..2cd4ec7 100644
>> --- a/man3/resolver.3
>> +++ b/man3/resolver.3
>> @@ -87,7 +87,7 @@ domain name servers.
>>  The
>>  .BR res_init ()
>>  function reads the configuration files (see
>> -resolv.conf(5)) to get the default domain name, search order and name
>
> Here, s/search order/search order (in glibc 2.4 and earlier)/
> ?
>
>> +resolv.conf(5)) to get the default domain name and name
>>  server address(es).
>>  If no server is given, the local host is tried.
>>  If no domain is given, that associated with the local host is used.
>> diff --git a/man5/host.conf.5 b/man5/host.conf.5
>> index 189e2e9..ed1403d 100644
>> --- a/man5/host.conf.5
>> +++ b/man5/host.conf.5
>> @@ -33,15 +33,9 @@ contains configuration information specific to the resolver library.
>>  It should contain one configuration keyword per line, followed by
>>  appropriate configuration information.
>>  The keywords recognized are
>> -.IR order ", " trim ", " multi ", " nospoof ", " spoof ", and " reorder .
>> +.IR trim ", " multi ", " nospoof ", " spoof ", and " reorder .
>
> Drop the preceding change.
>
>>  These keywords are described below.
>>  .TP
>> -.I order
>> -This keyword specifies how host lookups are to be performed.
>> -It should be followed by one or more lookup methods, separated by commas.
>> -Valid methods are
>> -.IR bind ", " hosts ", and " nis .
>
> Drop the preceding change. Instead add:
>
> Since glibc 2.5, the
> .I order
> keyword is ignored.
>
>
>> -.TP
>>  .I trim
>>  This keyword may be listed more than once.
>>  Each time it should be
>> @@ -141,11 +135,6 @@ override the behavior which is configured in
>>  If set this variable points to a file that should be read instead of
>>  .IR /etc/host.conf .
>>  .TP
>> -.B RESOLV_SERV_ORDER
>> -Overrides the
>> -.I order
>> -command.
>
> Drop the preceding change. Possibly add:
>
> Only useful in glibc 2.4 and earlier.
>
>> -.TP
>>  .B RESOLV_SPOOF_CHECK
>>  Overrides the
>>  .IR nospoof ", " spoofalert " and " spoof
>> @@ -200,4 +189,5 @@ Line comments can appear anywhere and not only at the beginning of a line.
>>  .BR gethostbyname (3),
>>  .BR hostname (7),
>>  .BR named (8),
>> +.BR nsswitch.conf (5),
>>  .BR resolv+ (8)
>> diff --git a/man5/resolv.conf.5 b/man5/resolv.conf.5
>> index 9a3ca54..282f748 100644
>> --- a/man5/resolv.conf.5
>> +++ b/man5/resolv.conf.5
>> @@ -134,6 +134,7 @@ sets
>>  .BR RES_DEBUG
>>  in
>>  .IR _res.options .
>> +This option needs glibc to be build with debugging enabled.
>
> Where did this piece come from? It seems to be unrelated?
>
> Cheers,
>
> Michael
>
>
>>  .TP
>>  .BI ndots: n
>>  .\" Since glibc 2.2
>> @@ -275,6 +276,7 @@ in the first column are treated as comments.
>>  .BR gethostbyname (3),
>>  .BR resolver (3),
>>  .BR hostname (7),
>> -.BR named (8)
>> +.BR named (8),
>> +.BR nsswitch.conf (5)
>>  .br
>>  Name Server Operations Guide for BIND
>> --
>> 1.7.10.4
>>
>> --
>> To unsubscribe from this list: send the line "unsubscribe linux-man" in
>> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
>
>
> --
> Michael Kerrisk
> Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
> Author of "The Linux Programming Interface"; http://man7.org/tlpi/



-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
