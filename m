From: "Michael Kerrisk" <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: Cannot bind an AF_UNIX socket with large filenames
Date: Sat, 29 Nov 2008 11:21:57 -0500
Message-ID: <cfd18e0f0811290821i12790c61v8bdf8de4814522e4@mail.gmail.com>
References: <cone.1227969283.265765.5728.500@commodore.email-scan.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <cone.1227969283.265765.5728.500-lO+bjgoT4TKm14v+eVDVcBDJ/jce7dRH@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sam Varshavchik <mrsam-W1w4QoW4mIDgLSHwZvcCBg@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi Sam,

(Always worth CCing me as well as the list, if you want my attention
on a bug report.)
On Sat, Nov 29, 2008 at 9:34 AM, Sam Varshavchik <mrsam-W1w4QoW4mIDgLSHwZvcCBg@public.gmane.org> wrote:
> It looks like the kernel -- at least 2.6.27.5 -- rejects with EINVAL a
> bind() of an AF_UNIX socket whose given size exceeds sizeof(struct
> sockaddr_un).
>
> Even if I make arrangements for a larger structure to accomodate a path that
> exceeds sockaddr_un's 107 bytes + \0, and I specify the actual size of the
> structure, bind() fails for me.
>
> I don't have the details, but I'm pretty sure other unixes accept domain
> sockets with larger filenames.

Are you sure of that?  Offhand, I don't know of such implementations,
but it's been a while since I tested this.  Which systems have you
seen this on?

> There, the sockaddr_un structure exists for
> historical reasons, and you can pretty much roll your own.
>
> This is perhaps worth mentioning in the description of EINVAL in unix(7).

I'm not (yet) convinced.

Cheers,

Michael


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
git://git.kernel.org/pub/scm/docs/man-pages/man-pages.git
man-pages online: http://www.kernel.org/doc/man-pages/online_pages.html
Found a bug? http://www.kernel.org/doc/man-pages/reporting_bugs.html
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
