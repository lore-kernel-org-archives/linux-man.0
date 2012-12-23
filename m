From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] recvmmsg.2 Updated since fields for recvmmsg and MSG_WAITFORNONE
Date: Sun, 23 Dec 2012 18:50:28 +0100
Message-ID: <CAKgNAkiJ6whWdnKiF6FFLab+=haQCouYs9_DKLO6Qyu4GC7gOg@mail.gmail.com>
References: <CAKgNAkhz1E8c2jpECcYrKJyMv1RB36qC_HjW9s=i=+bYLfii4w@mail.gmail.com>
 <1356263235-4803-1-git-send-email-eliedebrauwer@gmail.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1356263235-4803-1-git-send-email-eliedebrauwer-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Elie De Brauwer <eliedebrauwer-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Elie,

On Sun, Dec 23, 2012 at 12:47 PM, Elie De Brauwer
<eliedebrauwer-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> All,
>
> This patch isolates the since/version related fixes as requested.
> This change introduces the following delta:
>  * The page states it was added in 2.6.32 but it is only added in 2.6.33
>    (ref: http://kernelnewbies.org/Linux_2_6_33)
>  * The MSG_WAITFORONE flag was in turn only added in 2.6.34
>    (ref: http://kernelnewbies.org/Linux_2_6_34)

Thanks. Applied.

Cheers,

Michael


> ---
>  man2/recvmmsg.2 |    4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/man2/recvmmsg.2 b/man2/recvmmsg.2
> index a7b00d4..85e4080 100644
> --- a/man2/recvmmsg.2
> +++ b/man2/recvmmsg.2
> @@ -95,7 +95,7 @@ The flags are the same as documented for
>  .BR recvmsg (2),
>  with the following addition:
>  .TP
> -.B MSG_WAITFORONE
> +.BR MSG_WAITFORONE " (since Linux 2.6.34)"
>  Turns on
>  .B MSG_DONTWAIT
>  after the first message has been received.
> @@ -160,7 +160,7 @@ is invalid.
>  .SH VERSIONS
>  The
>  .BR recvmmsg ()
> -system call was added in Linux 2.6.32.
> +system call was added in Linux 2.6.33.
>  Support in glibc was added in version 2.12.
>  .SH CONFORMING TO
>  .BR recvmmsg ()
> --
> 1.7.10.4
>



-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
