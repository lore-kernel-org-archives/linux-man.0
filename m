From: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] Typo fix
Date: Thu, 30 May 2013 12:57:24 +0200
Message-ID: <51A73094.6010202@gmail.com>
References: <1369776506-13902-1-git-send-email-benoit.bourbie@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1369776506-13902-1-git-send-email-benoit.bourbie-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?ISO-8859-1?Q?Beno=EEt_Bourbi=E9?= <benoit.bourbie-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 05/28/13 23:28, Beno=EEt Bourbi=E9 wrote:
> "of" is duplicated

Hello Beno=EEt,

Thanks, but this has already been fixed with another patch.

Cheers,

Michael


> ---
>  man2/io_setup.2 | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/man2/io_setup.2 b/man2/io_setup.2
> index 81b9a8b..549495a 100644
> --- a/man2/io_setup.2
> +++ b/man2/io_setup.2
> @@ -21,7 +21,7 @@ There is no glibc wrapper for this system call; see=
 NOTES.
>  The
>  .BR io_setup ()
>  system call
> -creates an asynchronous I/O context capable of of concurrently proce=
ssing
> +creates an asynchronous I/O context capable of concurrently processi=
ng
>  at least \fInr_events\fP.
>  The
>  .I ctx_idp
>=20

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
