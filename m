From: Casper.Dik-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org
Subject: Re: realpath(3) bugs
Date: Sat, 05 May 2012 20:34:50 +0200
Message-ID: <201205051834.q45IYont018249@ucsinet22.oracle.com>
References: <201205041122.q44BMDEO002270@ucsinet22.oracle.com> <CAKgNAkgjjKXx_Aw5iF_Phe7c7ixpqtfLSiV6fkTttN5ge4CGww@mail.gmail.com> <20120505000619.GA8038@iq> <201205050734.q457Y2AC002399@ucsinet22.oracle.com> <20120505155054.GA11316@iq>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20120505155054.GA11316@iq> 
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Andries E. Brouwer" <Andries.Brouwer-rh8NL+sEX9E@public.gmane.org>
Cc: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org


>I am not sure something needs to be removed. One might write
>"early versions of" when something is no longer true in recent versions.

I've looked through earlier SunOS versions and I didn't find
it n SunOS 3.5 but I did find it in SunOS 4.1.1.  The code
simply starts with:

	if pathname doesn't start with '/' prepend the current
	working directory.

That code looks very much like the earlier SvR4 code; so I think
that if the SunOS manual page says that, it was incorrect as
the code will either fail or it will return an absolute pathname.
(Any error cass the code to return NULL)
Just like the current Solaris realpath(3c) manpage incorrectly
says that realpath() can change your cwd on error; this
cannot happen since Solaris 9 but was not removed)

So if i ever happened in SunOS it may happened in SunOS 4.0,
so I think it is still not correct to claim that "Solaris"
ever didn't return an absolute pathname; the first of
Solaris was SunOS 4.1.2 (Solaris 1.0) and that already
only returned an absolute pathname.

Casper
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
