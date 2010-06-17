From: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] getaddrinfo.3: fix ai_flags ai_family mixup
Date: Thu, 17 Jun 2010 06:12:15 +0200
Message-ID: <AANLkTikJX5qmDkxCTKxUj9mQdjW1ItMittGqPDRiXEcB@mail.gmail.com>
References: <20100616132659.GA16973@ts2server.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20100616132659.GA16973-FCpQSzCsxjR54TAoqtyWWQ@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: nobody-e83xkrq8dvbLvtPRa3sz4w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Christian,

On Wed, Jun 16, 2010 at 3:26 PM, Christian Franke <nobody-e83xkrq8dvbLvtPRa3sz4w@public.gmane.org> w=
rote:
> Please CC me in list replies as I am not subscribed to this list.

Thanks. Applied for 3.25.

Cheers,

Michael


> Signed-off-by: Christian Franke <nobody-e83xkrq8dvbLvtPRa3sz4w@public.gmane.org>
> ---
> =A0man3/getaddrinfo.3 | =A0 =A04 +++-
> =A01 files changed, 3 insertions(+), 1 deletions(-)
>
> diff --git a/man3/getaddrinfo.3 b/man3/getaddrinfo.3
> index d33b8ab..82ffa73 100644
> --- a/man3/getaddrinfo.3
> +++ b/man3/getaddrinfo.3
> @@ -35,6 +35,8 @@
> =A0.\" 2008-06-18, mtk: many parts rewritten
> =A0.\" 2008-12-04, Petr Baudis <pasky-AlSwsSmVLrQ@public.gmane.org>
> =A0.\" =A0 =A0Describe results ordering and reference /etc/gai.conf.
> +.\" 2010-06-16, Christian Franke <nobody-e83xkrq8dvbLvtPRa3sz4w@public.gmane.org>
> +.\" =A0 =A0Fixed a bug where ai_flags and ai_family got mixed up.
> =A0.\" FIXME . glibc's 2.9 NEWS file documents DCCP and UDP-lite supp=
ort
> =A0.\" =A0 =A0 =A0 =A0 =A0 and is SCTP support now also there?
> =A0.\"
> @@ -393,7 +395,7 @@ If both
> =A0and
> =A0.B AI_ALL
> =A0are specified in
> -.IR hints.ai_family ,
> +.IR hints.ai_flags ,
> =A0then return both IPv6 and IPv4-mapped IPv6 addresses
> =A0in the list pointed to by
> =A0.IR res .
> --
> 1.5.6.5
>
>



--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface" http://blog.man7.org/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
