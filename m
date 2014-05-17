From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] host.conf(5): order option deprecated, replaced by nsswitch.conf(5)
Date: Sat, 17 May 2014 17:15:22 +0200
Message-ID: <53777D0A.3010601@gmail.com>
References: <1355073222-13020-1-git-send-email-spaillard@debian.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1355073222-13020-1-git-send-email-spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Simon Paillard <spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 12/09/2012 06:13 PM, Simon Paillard wrote:
> http://www.sourceware.org/bugzilla/show_bug.cgi?id=2389
> http://repo.or.cz/w/glibc.git/commit/b9c65d0902e5890c4f025b574725154032f8120a
> 
> Reported at http://bugs.debian.org/270368 http://bugs.debian.org/396633
> ---
>  man3/resolver.3    |    2 +-
>  man5/host.conf.5   |   14 ++------------
>  man5/resolv.conf.5 |    4 +++-
>  3 files changed, 6 insertions(+), 14 deletions(-)
> 
> diff --git a/man3/resolver.3 b/man3/resolver.3
> index 991b263..2cd4ec7 100644
> --- a/man3/resolver.3
> +++ b/man3/resolver.3
> @@ -87,7 +87,7 @@ domain name servers.
>  The
>  .BR res_init ()
>  function reads the configuration files (see
> -resolv.conf(5)) to get the default domain name, search order and name
> +resolv.conf(5)) to get the default domain name and name
>  server address(es).
>  If no server is given, the local host is tried.
>  If no domain is given, that associated with the local host is used.
> diff --git a/man5/host.conf.5 b/man5/host.conf.5
> index 189e2e9..ed1403d 100644
> --- a/man5/host.conf.5
> +++ b/man5/host.conf.5
> @@ -33,15 +33,9 @@ contains configuration information specific to the resolver library.
>  It should contain one configuration keyword per line, followed by
>  appropriate configuration information.
>  The keywords recognized are
> -.IR order ", " trim ", " multi ", " nospoof ", " spoof ", and " reorder .
> +.IR trim ", " multi ", " nospoof ", " spoof ", and " reorder .
>  These keywords are described below.
>  .TP
> -.I order
> -This keyword specifies how host lookups are to be performed.
> -It should be followed by one or more lookup methods, separated by commas.
> -Valid methods are
> -.IR bind ", " hosts ", and " nis .
> -.TP
>  .I trim
>  This keyword may be listed more than once.
>  Each time it should be
> @@ -141,11 +135,6 @@ override the behavior which is configured in
>  If set this variable points to a file that should be read instead of
>  .IR /etc/host.conf .
>  .TP
> -.B RESOLV_SERV_ORDER
> -Overrides the
> -.I order
> -command.
> -.TP
>  .B RESOLV_SPOOF_CHECK
>  Overrides the
>  .IR nospoof ", " spoofalert " and " spoof
> @@ -200,4 +189,5 @@ Line comments can appear anywhere and not only at the beginning of a line.
>  .BR gethostbyname (3),
>  .BR hostname (7),
>  .BR named (8),
> +.BR nsswitch.conf (5),
>  .BR resolv+ (8)
> diff --git a/man5/resolv.conf.5 b/man5/resolv.conf.5
> index 9a3ca54..282f748 100644
> --- a/man5/resolv.conf.5
> +++ b/man5/resolv.conf.5
> @@ -134,6 +134,7 @@ sets
>  .BR RES_DEBUG
>  in
>  .IR _res.options .
> +This option needs glibc to be build with debugging enabled.
>  .TP
>  .BI ndots: n
>  .\" Since glibc 2.2
> @@ -275,6 +276,7 @@ in the first column are treated as comments.
>  .BR gethostbyname (3),
>  .BR resolver (3),
>  .BR hostname (7),
> -.BR named (8)
> +.BR named (8),
> +.BR nsswitch.conf (5)
>  .br
>  Name Server Operations Guide for BIND

Simon,

I propose the patch below. Look okay to you?

Cheers,

Michael

diff --git a/man3/resolver.3 b/man3/resolver.3
index a3fd2e8..7dc2002 100644
--- a/man3/resolver.3
+++ b/man3/resolver.3
@@ -29,7 +29,7 @@
 .\" Modified 1993-07-25 by Rik Faith (faith-+5Oa3zvhR2o3uPMLIKxrzw@public.gmane.org)
 .\" Modified 2004-10-31 by aeb
 .\"
-.TH RESOLVER 3 2013-03-05 "GNU" "Linux Programmer's Manual"
+.TH RESOLVER 3 2014-05-17 "GNU" "Linux Programmer's Manual"
 .SH NAME
 res_init, res_query, res_search, res_querydomain, res_mkquery, res_send,
 dn_comp, dn_expand \- resolver routines
@@ -90,7 +90,7 @@ The
 .BR res_init ()
 function reads the configuration files (see
 .BR resolv.conf (5))
-to get the default domain name, search order and name
+to get the default domain name and name
 server address(es).
 If no server is given, the local host is tried.
 If no domain is given, that associated with the local host is used.
diff --git a/man5/host.conf.5 b/man5/host.conf.5
index a289cb4..e3d9073 100644
--- a/man5/host.conf.5
+++ b/man5/host.conf.5
@@ -23,7 +23,7 @@
 .\" %%%LICENSE_END
 .\"
 .\" 2003-08-23 Martin Schulze <joey-1lCxjdRlhQ9g9hUCZPvPmw@public.gmane.org> Updated according to glibc 2.3.2
-.TH HOST.CONF 5 2003-08-23 "Linux" "Linux System Administration"
+.TH HOST.CONF 5 2014-05-17 "Linux" "Linux System Administration"
 .SH NAME
 host.conf \- resolver configuration file
 .SH DESCRIPTION
@@ -32,15 +32,7 @@ The file
 contains configuration information specific to the resolver library.
 It should contain one configuration keyword per line, followed by
 appropriate configuration information.
-The keywords recognized are
-.IR order ", " trim ", " multi ", " nospoof ", " spoof ", and " reorder .
-These keywords are described below.
-.TP
-.I order
-This keyword specifies how host lookups are to be performed.
-It should be followed by one or more lookup methods, separated by commas.
-Valid methods are
-.IR bind ", " hosts ", and " nis .
+The following keywords are recognized:
 .TP
 .I trim
 This keyword may be listed more than once.
@@ -133,19 +125,14 @@ Reordering is done for all lookup methods.
 The default value is
 .IR off .
 .SH ENVIRONMENT
-There are six environment variables that can be used to allow users to
+The following environment variables can be used to allow users to
 override the behavior which is configured in
-.IR /etc/host.conf .
+.IR /etc/host.conf :
 .TP
 .B RESOLV_HOST_CONF
 If set, this variable points to a file that should be read instead of
 .IR /etc/host.conf .
 .TP
-.B RESOLV_SERV_ORDER
-Overrides the
-.I order
-command.
-.TP
 .B RESOLV_SPOOF_CHECK
 Overrides the
 .IR nospoof ", " spoofalert " and " spoof
@@ -196,8 +183,25 @@ and a new environment variable
 can take arguments like
 .IR off ", " nowarn " and " warn .
 Line comments can appear anywhere and not only at the beginning of a line.
+.SS Historical
+In glibc 2.4 and earlier, the following keyword is recognized:
+.TP
+.I order
+This keyword specifies how host lookups are to be performed.
+It should be followed by one or more lookup methods, separated by commas.
+Valid methods are
+.IR bind ", " hosts ", and " nis .
+The
+.B RESOLV_SERV_ORDER
+environment variable could be used to override the
+.I order
+command.
+.PP
+The
+.BR nsswitch.conf (5)
+file is the modern way of controlling the order of host lookups.
 .SH SEE ALSO
 .BR gethostbyname (3),
+.BR nsswitch.conf (5)
 .BR hostname (7),
-.BR named (8),
-.BR resolv+ (8)
+.BR named (8)
diff --git a/man5/resolv.conf.5 b/man5/resolv.conf.5
index 3680a82..f9a0ba1 100644
--- a/man5/resolv.conf.5
+++ b/man5/resolv.conf.5
@@ -20,7 +20,7 @@
 .\"
 .\" Added ndots remark by Bernhard R. Link - debian bug #182886
 .\"
-.TH RESOLV.CONF 5 2014-02-22 "" "Linux Programmer's Manual"
+.TH RESOLV.CONF 5 2014-05-17 "" "Linux Programmer's Manual"
 .UC 4
 .SH NAME
 resolv.conf \- resolver configuration file
@@ -290,6 +290,7 @@ in the first column are treated as comments.
 .SH SEE ALSO
 .BR gethostbyname (3),
 .BR resolver (3),
+.BR nsswitch.conf (5)
 .BR hostname (7),
 .BR named (8)
 .br



-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
