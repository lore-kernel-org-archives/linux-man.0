From: Simon Paillard <spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Subject: Re: POSIX.1-2013 man pages for review
Date: Fri, 20 Sep 2013 19:50:47 +0200
Message-ID: <20130920175047.GJ19794@mraw.org>
References: <523AAEEE.5090602@gmail.com>
 <523AB978.2080607@barfooze.de>
 <CAKgNAki+jTS9rkORvcPNxWcStNjnNTnt_jqBYcfoaYm7d4GxqQ@mail.gmail.com>
 <523C48EF.5080309@barfooze.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <523C48EF.5080309-Am5OCHYCrcUb1SvskN2V4Q@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: John Spencer <maillist-musl-Am5OCHYCrcUb1SvskN2V4Q@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, "linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Andrew Josey <ajosey-7882/jkIBncuagvECLh61g@public.gmane.org>, Felix Janda <felix.janda-1KBjaw7Xf1+zQB+pC5nmwQ@public.gmane.org>, Rich Felker <dalias-/miJ2pyFWUyWIDz0JBNUog@public.gmane.org>, Rob Landley <rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org>, Matthew Dempsky <matthew-bfSpyvURsAhAfugRpC6u6w@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hello,

On Fri, Sep 20, 2013 at 03:09:03PM +0200, John Spencer wrote:
[..]
> musl itself does not use the man-pages project currently, as the
> majority of manpages are very glibc specific. so the posix manpages
> project is _imo_ currently a much better documentation for the
> interfaces provided by musl.

Note that posix manpages are not released under a free license.

That is a problem when you want manpages in a free software distribution (like
debian, where we can ship manpages{,-dev} by default, but
not manpages-posix{,dev}).

-- 
Simon Paillard
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
