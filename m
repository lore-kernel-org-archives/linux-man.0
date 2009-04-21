From: Michael Kerrisk <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: [PATCH] Note in fmemopen() that no file descriptor is allocated
Date: Tue, 21 Apr 2009 16:19:23 +1200
Message-ID: <cfd18e0f0904202119v6d507b72j555aaef97f1394f9@mail.gmail.com>
References: <9c3275a90904151642n7a13cf06w6e1834b849d37f1a@mail.gmail.com>
	 <20090416082503.GH21271@machine.or.cz>
	 <9c3275a90904160726i68a4c1f6u8173f72365042e65@mail.gmail.com>
	 <20090416145804.GZ8940@machine.or.cz>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20090416145804.GZ8940-DDGJ70k9y3lX+M3pkMnKjw@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Petr Baudis <pasky-AlSwsSmVLrQ@public.gmane.org>
Cc: Alexander Lamaison <awl03-CezfXpuMXD6Fxr2TtlUqVg@public.gmane.org>, libc-help-9JcytcrH/bA+uJoB2kUjGw@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi Petr

On Fri, Apr 17, 2009 at 2:58 AM, Petr Baudis <pasky-AlSwsSmVLrQ@public.gmane.org> wrote:
> Alexander Lamaison <awl03-CezfXpuMXD6Fxr2TtlUqVg@public.gmane.org> pointed out that this is
> not obvious from the documentation, citing an example with passing
> the FILE * handle to a function that tries to fstat() its fileno()
> in order to determine the buffer size.
>
> This also moves BUGS before EXAMPLE according to the recommended
> section order.

Thanks -- I applied that as a separate change.

> Signed-off-by: Petr Baudis <pasky-AlSwsSmVLrQ@public.gmane.org>
>
> diff --git a/man3/fmemopen.3 b/man3/fmemopen.3
> index 608e16f..3ed6930 100644
> --- a/man3/fmemopen.3
> +++ b/man3/fmemopen.3
> @@ -173,6 +173,22 @@ POSIX.1-2008.
> =A0These functions are not specified in POSIX.1-2001,
> =A0and are not widely available on other systems.
> =A0These functions are GNU extensions.
> +.SH NOTES
> +There is no valid file descriptor associated with
> +the returned handle, therefore
> +.BR fileno (3)
> +will return a negative value.
> +Thus, you e.g. cannot determine the buffer size using
> +.I fstat(fileno(f), &stat)
> +and looking at
> +.IR stat.st_size .

I shortened and reworded your text somewhat, since I don't think we
need to mention details about fstat():

[[
=2ESH NOTES
There is no file descriptor associated with the file stream
returned by these functions
(i.e.,
=2EBR fileno (3)
will return an error if called on the returned stream).
]]

The changes will be in man-pages-3.22.

Thanks,

Michael

--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
git://git.kernel.org/pub/scm/docs/man-pages/man-pages.git
man-pages online: http://www.kernel.org/doc/man-pages/online_pages.html
=46ound a bug? http://www.kernel.org/doc/man-pages/reporting_bugs.html
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
