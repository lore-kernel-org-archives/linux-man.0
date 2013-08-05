From: Simon Paillard <spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] host.conf(5): order option deprecated, replaced by
 nsswitch.conf(5)
Date: Mon, 5 Aug 2013 23:06:13 +0200
Message-ID: <20130805210613.GH20063@mraw.org>
References: <1355073222-13020-1-git-send-email-spaillard@debian.org>
 <20130102214313.GB32025@glenfiddich.mraw.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20130102214313.GB32025-8MNqHwMchPhGJ/Ie3qa20WD2FQJk+8+b@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: 270368-61a8vm9lEZVf4u+23C9RwQ@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Michael,

What is your feedback regarding this bug ?

On Wed, Jan 02, 2013 at 10:43:13PM +0100, Simon Paillard wrote:
> Do you think this patch can be applied ?
> 
> The "order" keyword in /etc/host.conf is not supported anymore for quite
> some time.
> 
> I cannot find which glibc versions uses order line in host.conf before
> nsswitch.conf is used.
> 
> Together with the fact this change happened ~7 years ago, here is a patch
> *removing* the 'order line', and adding nsswitch.conf(5) in references.
> 
> On Sun, Dec 09, 2012 at 06:13:42PM +0100, Simon Paillard wrote:
> > http://www.sourceware.org/bugzilla/show_bug.cgi?id=2389
> > http://repo.or.cz/w/glibc.git/commit/b9c65d0902e5890c4f025b574725154032f8120a
> > 
> > Reported at http://bugs.debian.org/270368 http://bugs.debian.org/396633
> > ---
> >  man3/resolver.3    |    2 +-
> >  man5/host.conf.5   |   14 ++------------
> >  man5/resolv.conf.5 |    4 +++-
> >  3 files changed, 6 insertions(+), 14 deletions(-)
> > 
> > diff --git a/man3/resolver.3 b/man3/resolver.3
> > index 991b263..2cd4ec7 100644
> > --- a/man3/resolver.3
> > +++ b/man3/resolver.3
> > @@ -87,7 +87,7 @@ domain name servers.
> >  The
> >  .BR res_init ()
> >  function reads the configuration files (see
> > -resolv.conf(5)) to get the default domain name, search order and name
> > +resolv.conf(5)) to get the default domain name and name
> >  server address(es).
> >  If no server is given, the local host is tried.
> >  If no domain is given, that associated with the local host is used.
> > diff --git a/man5/host.conf.5 b/man5/host.conf.5
> > index 189e2e9..ed1403d 100644
> > --- a/man5/host.conf.5
> > +++ b/man5/host.conf.5
> > @@ -33,15 +33,9 @@ contains configuration information specific to the resolver library.
> >  It should contain one configuration keyword per line, followed by
> >  appropriate configuration information.
> >  The keywords recognized are
> > -.IR order ", " trim ", " multi ", " nospoof ", " spoof ", and " reorder .
> > +.IR trim ", " multi ", " nospoof ", " spoof ", and " reorder .
> >  These keywords are described below.
> >  .TP
> > -.I order
> > -This keyword specifies how host lookups are to be performed.
> > -It should be followed by one or more lookup methods, separated by commas.
> > -Valid methods are
> > -.IR bind ", " hosts ", and " nis .
> > -.TP
> >  .I trim
> >  This keyword may be listed more than once.
> >  Each time it should be
> > @@ -141,11 +135,6 @@ override the behavior which is configured in
> >  If set this variable points to a file that should be read instead of
> >  .IR /etc/host.conf .
> >  .TP
> > -.B RESOLV_SERV_ORDER
> > -Overrides the
> > -.I order
> > -command.
> > -.TP
> >  .B RESOLV_SPOOF_CHECK
> >  Overrides the
> >  .IR nospoof ", " spoofalert " and " spoof
> > @@ -200,4 +189,5 @@ Line comments can appear anywhere and not only at the beginning of a line.
> >  .BR gethostbyname (3),
> >  .BR hostname (7),
> >  .BR named (8),
> > +.BR nsswitch.conf (5),
> >  .BR resolv+ (8)
> > diff --git a/man5/resolv.conf.5 b/man5/resolv.conf.5
> > index 9a3ca54..282f748 100644
> > --- a/man5/resolv.conf.5
> > +++ b/man5/resolv.conf.5
> > @@ -134,6 +134,7 @@ sets
> >  .BR RES_DEBUG
> >  in
> >  .IR _res.options .
> > +This option needs glibc to be build with debugging enabled.
> >  .TP
> >  .BI ndots: n
> >  .\" Since glibc 2.2
> > @@ -275,6 +276,7 @@ in the first column are treated as comments.
> >  .BR gethostbyname (3),
> >  .BR resolver (3),
> >  .BR hostname (7),
> > -.BR named (8)
> > +.BR named (8),
> > +.BR nsswitch.conf (5)
> >  .br
> >  Name Server Operations Guide for BIND
> > -- 
> > 1.7.10.4

-- 
Simon Paillard
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
