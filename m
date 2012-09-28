From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] quotactl.2: tfix
Date: Fri, 28 Sep 2012 08:04:22 +0200
Message-ID: <CAKgNAkjDmdARthdWwCeHmW_wNmBz35F=HzVJne7YQJFjSS5sjw@mail.gmail.com>
References: <1348686212-26265-1-git-send-email-taffit@debian.org>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1348686212-26265-1-git-send-email-taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?ISO-8859-1?Q?David_Pr=E9vot?= <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Applied. Thanks!

On Wed, Sep 26, 2012 at 9:03 PM, David Pr=E9vot <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org> wro=
te:
> ---
>  man2/quotactl.2 |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/man2/quotactl.2 b/man2/quotactl.2
> index c5fae5d..9b7430e 100644
> --- a/man2/quotactl.2
> +++ b/man2/quotactl.2
> @@ -141,7 +141,7 @@ as follows:
>  .nf
>
>  /* uint64_t is an unsigned 64\-bit integer;
> -   uint32_t is an unsigned 32-\bit integer */
> +   uint32_t is an unsigned 32\-bit integer */
>
>  struct dqblk {          /* Definition since Linux 2.4.22 */
>      uint64_t dqb_bhardlimit;   /* absolute limit on disk
> --
> 1.7.10.4
>



--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
