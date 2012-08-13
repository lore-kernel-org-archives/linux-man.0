From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 4/5] strcpy.3: tfix
Date: Mon, 13 Aug 2012 09:25:46 +0200
Message-ID: <CAKgNAkjsaLRi_NXW9Q-9R7n0B-4y8eHUizFCmRMOP2YbkT0KhA@mail.gmail.com>
References: <1344821668-11324-1-git-send-email-taffit@debian.org> <1344821668-11324-5-git-send-email-taffit@debian.org>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1344821668-11324-5-git-send-email-taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?ISO-8859-1?Q?David_Pr=E9vot?= <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Applied!

On Mon, Aug 13, 2012 at 3:34 AM, David Pr=E9vot <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org> wro=
te:
> ---
>  man3/strcpy.3 |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/man3/strcpy.3 b/man3/strcpy.3
> index 0a222dd..0664335 100644
> --- a/man3/strcpy.3
> +++ b/man3/strcpy.3
> @@ -116,7 +116,7 @@ One valid (and intended) use of
>  is to copy a C string to a fixed-length buffer
>  while ensuring both that the buffer is not overflowed
>  and that unused bytes in the target buffer are zeroed out
> -(perhaps to prevent information leaks if the buffer is to
> +(perhaps to prevent information leaks if the buffer is to be
>  written to media or transmitted to another process via an
>  interprocess communication technique).
>
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
