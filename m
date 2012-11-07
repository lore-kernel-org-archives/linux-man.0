From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] delete_module.2: tfix
Date: Wed, 7 Nov 2012 13:46:52 +0100
Message-ID: <CAKgNAkgR9D-AjBe200ZUQbH5rb5k2nrjyuK+bhZX4-9s710JJA@mail.gmail.com>
References: <1352211337-13580-1-git-send-email-taffit@debian.org>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1352211337-13580-1-git-send-email-taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?ISO-8859-1?Q?David_Pr=E9vot?= <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Thanks. Applied.

On Tue, Nov 6, 2012 at 3:15 PM, David Pr=E9vot <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org> wrot=
e:
> ---
>  man2/delete_module.2 |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/man2/delete_module.2 b/man2/delete_module.2
> index bab3f66..3e16694 100644
> --- a/man2/delete_module.2
> +++ b/man2/delete_module.2
> @@ -176,7 +176,7 @@ is Linux-specific.
>  Glibc does not provide a wrapper for this system call; call it using
>  .BR syscall (2).
>
> -The unininterruptible sleep that may occur if
> +The uninterruptible sleep that may occur if
>  .BR O_NONBLOCK
>  is omitted from
>  .IR flags
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
