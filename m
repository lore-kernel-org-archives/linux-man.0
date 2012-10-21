From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] proc.5: tfix
Date: Sun, 21 Oct 2012 08:41:42 +0200
Message-ID: <CAKgNAkgKYSfm7utLBbz1fytou=Z1GdPnBuND_Bqg672BZdKPsQ@mail.gmail.com>
References: <1350762298-6184-1-git-send-email-taffit@debian.org>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1350762298-6184-1-git-send-email-taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?ISO-8859-1?Q?David_Pr=E9vot?= <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Thanks David. Applied.

On Sat, Oct 20, 2012 at 9:44 PM, David Pr=E9vot <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org> wro=
te:
> ---
>  man5/proc.5 |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/man5/proc.5 b/man5/proc.5
> index 5337160..5312314 100644
> --- a/man5/proc.5
> +++ b/man5/proc.5
> @@ -2036,7 +2036,7 @@ The minimum value that can be assigned to this =
file is the system page size.
>  .IR /proc/sys/fs/protected_hardlinks " (since Linux 3.6)"
>  .\" commit 800179c9b8a1e796e441674776d11cd4c05d61d7
>  When the value in this file is 0,
> -no restrictions are placed the creation of hard links
> +no restrictions are placed on the creation of hard links
>  (i.e., this is the historical behaviour before Linux 3.6).
>  When the value in this file is 1,
>  a hard link can be created to a target file
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
