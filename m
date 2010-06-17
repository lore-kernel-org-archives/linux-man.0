From: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [patch] minor formatting error in quotactl.2
Date: Thu, 17 Jun 2010 06:11:42 +0200
Message-ID: <AANLkTikjkS4bZ-hjaWhP7aBSroW9DBCyPULX3_mvaaj4@mail.gmail.com>
References: <AANLkTinJChI74JCJ5D3RahBo2mDGRbon9weyPUJPaOtn@mail.gmail.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <AANLkTinJChI74JCJ5D3RahBo2mDGRbon9weyPUJPaOtn-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Denis Barbier <bouzim-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi Denis,

On Wed, Jun 16, 2010 at 10:01 PM, Denis Barbier <bouzim-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrot=
e:
> Hi,
>
> =A0today's changes in man2/quotactl.2 introduced a minor formatting e=
rror:

Applied. Thanks.

Cheers,

Michael

> --- a/man2/quotactl.2
> +++ b/man2/quotactl.2
> @@ -87,7 +87,7 @@ The
> =A0.I subcmd
> =A0value is one of the following:
> =A0.TP 8
> -.SB Q_QUOTAON
> +.B Q_QUOTAON
> =A0Turn on quotas for a file system.
> =A0The
> =A0.I id
>
>
> Denis
>



--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface" http://blog.man7.org/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
