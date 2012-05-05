From: "Andries E. Brouwer" <Andries.Brouwer-rh8NL+sEX9E@public.gmane.org>
Subject: Re: realpath(3) bugs
Date: Sun, 6 May 2012 00:14:41 +0200
Message-ID: <20120505221441.GA13219@iq>
References: <201205041122.q44BMDEO002270@ucsinet22.oracle.com>
 <CAKgNAkgjjKXx_Aw5iF_Phe7c7ixpqtfLSiV6fkTttN5ge4CGww@mail.gmail.com>
 <20120505000619.GA8038@iq>
 <201205050734.q457Y2AC002399@ucsinet22.oracle.com>
 <20120505155054.GA11316@iq>
 <201205051810.q45IAU9K000837@ucsinet21.oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <201205051810.q45IAU9K000837-Og0DlWfCjE/86v54HqmmKFaTQe2KTcn/@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Casper.Dik-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org
Cc: "Andries E. Brouwer" <Andries.Brouwer-rh8NL+sEX9E@public.gmane.org>, "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Sat, May 05, 2012 at 08:34:50PM +0200, Casper.Dik-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org wrote:

> I've looked through earlier SunOS versions and I didn't find
> it n SunOS 3.5 but I did find it in SunOS 4.1.1.
> So if i ever happened in SunOS it may happened in SunOS 4.0.

Guy Harris wrote (1992-01-17):

: Unfortunately, "realpath()" is *not* present in BSD, as of 4.3-reno;
: I think it first showed up in SunOS 4.0, and was then picked up by other
: systems, such as System V Release 4.

That seems to define the history. SunOS 4.0 -> SVr4 -> Solaris 2.0.

Concerning man pages: old man pages (for a derived version, cf.
http://osr600doc.sco.com/en/man/html.S-osr5/realpath.S-osr5.html
) document realpath as sometimes returning a relative path.
Later man pages leave the old text but prefix it by a new
paragraph stating that an absolute path is returned.
This yields confusing versions like the SunOS 5.9 one given in
http://www.s-gms.ms.edus.si/cgi-bin/man-cgi?realpath+3C .
Still later man pages remove all mention of relative paths
(or comment it out, as Apple did).

Andries
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
