From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 3/3] perf_event_open.2: pfix
Date: Sun, 08 Dec 2013 21:43:33 -0800
Message-ID: <52A55885.80609@gmail.com>
References: <20131117182608.GB20757@aym.net2.nerim.net> <1384717125-6012-1-git-send-email-taffit@debian.org> <1384717125-6012-4-git-send-email-taffit@debian.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1384717125-6012-4-git-send-email-taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?ISO-8859-1?Q?David_Pr=E9vot?= <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Thanks. Applied.

Cheers,

Michael


On 11/17/13 11:38, David Pr=E9vot wrote:
> ---
>  man2/perf_event_open.2 | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/man2/perf_event_open.2 b/man2/perf_event_open.2
> index 9d37b44..d2237e2 100644
> --- a/man2/perf_event_open.2
> +++ b/man2/perf_event_open.2
> @@ -2374,7 +2374,7 @@ ioctl argument was broken and would repeatedly =
operate
>  on the event specified rather than iterating across
>  all sibling events in a group.
> =20
> -From Linux 3.4 to Linux 3.11 the mmap
> +From Linux 3.4 to Linux 3.11, the mmap
>  .I cap_usr_rdpmc
>  and
>  .I cap_usr_time
>=20


--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
