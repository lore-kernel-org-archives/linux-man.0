From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] ipc.2: wfix
Date: Wed, 7 Nov 2012 13:47:49 +0100
Message-ID: <CAKgNAkjbh4+Gv2_26d7koP8LLqsQxi3yDBoXiVqVpoPpsuS9aA@mail.gmail.com>
References: <1352133384-10588-1-git-send-email-taffit@debian.org>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1352133384-10588-1-git-send-email-taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?ISO-8859-1?Q?David_Pr=E9vot?= <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Thanks. Applied.

On Mon, Nov 5, 2012 at 5:36 PM, David Pr=E9vot <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org> wrot=
e:
> ---
>  man2/ipc.2 |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/man2/ipc.2 b/man2/ipc.2
> index 30ba658..0f471b7 100644
> --- a/man2/ipc.2
> +++ b/man2/ipc.2
> @@ -48,7 +48,7 @@ Only standard library implementors and kernel hacke=
rs need to know about
>  is Linux-specific, and should not be used in programs
>  intended to be portable.
>  .SH NOTES
> -On a some architectures\(emfor example x86-46 and ARM\(emthere is no
> +On some architectures\(emfor example x86-46 and ARM\(emthere is no
>  .BR ipc ()
>  system call; instead
>  .BR msgctl (2),
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
