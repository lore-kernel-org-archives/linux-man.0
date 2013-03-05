From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] getunwind.2: wfix and tfix
Date: Tue, 5 Mar 2013 17:39:40 +0100
Message-ID: <CAKgNAkhKGBL4FM5eLBTPrtnESvmUq35q4kbq9k+jdcZSat9LJg@mail.gmail.com>
References: <1362265812-27531-1-git-send-email-taffit@debian.org>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1362265812-27531-1-git-send-email-taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?ISO-8859-1?Q?David_Pr=E9vot?= <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Thanks David. Applied.

On Sun, Mar 3, 2013 at 12:10 AM, David Pr=E9vot <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org> wro=
te:
> ---
>  man2/getunwind.2 |    4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/man2/getunwind.2 b/man2/getunwind.2
> index 13ed6e3..6ac8c4d 100644
> --- a/man2/getunwind.2
> +++ b/man2/getunwind.2
> @@ -67,12 +67,12 @@ The unwind table contains entries of the followin=
g form:
>
>  .nf
>         u64 start;      (64-bit address of start of function)
> -       u64 end;        (64-bit address of start of function)
> +       u64 end;        (64-bit address of end of function)
>         u64 info;       (BUF-relative offset to unwind info)
>  .fi
>
>  An entry whose
> -.I sytart
> +.I start
>  value is zero indicates the end of the table.
>  For more information about the format, see the
>  .I IA-64 Software Conventions and Runtime Architecture
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
