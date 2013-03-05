From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] ptrace.2: tfix
Date: Tue, 5 Mar 2013 17:39:49 +0100
Message-ID: <CAKgNAkifscxz1AihYDCMPiM8LezXOuHQWrjULfv21iPw1OtoMA@mail.gmail.com>
References: <1362191753-6287-1-git-send-email-taffit@debian.org>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1362191753-6287-1-git-send-email-taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?ISO-8859-1?Q?David_Pr=E9vot?= <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Thanks David. Applied.

On Sat, Mar 2, 2013 at 3:35 AM, David Pr=E9vot <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org> wrot=
e:
> ---
>  man2/ptrace.2 |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/man2/ptrace.2 b/man2/ptrace.2
> index df1be97..9d1133c 100644
> --- a/man2/ptrace.2
> +++ b/man2/ptrace.2
> @@ -251,7 +251,7 @@ constant.
>  .I data
>  points to a
>  .BR "struct iovec" ,
> -which describes ithe destination buffer's location and length.
> +which describes the destination buffer's location and length.
>  On return, the kernel modifies
>  .B iov.len
>  to indicate the actual number of bytes returned.
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
