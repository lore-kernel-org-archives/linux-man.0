From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/2] capabilities.7: pfix
Date: Sun, 17 Mar 2013 08:08:47 +0100
Message-ID: <CAKgNAkg8mfbRyjT4p=zXn=28Kd_kRkFWkgWYKFW6HKvfTL79jA@mail.gmail.com>
References: <1363469864-1679-1-git-send-email-taffit@debian.org>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1363469864-1679-1-git-send-email-taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?ISO-8859-1?Q?David_Pr=E9vot?= <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Thanks David. Applied.

On Sat, Mar 16, 2013 at 10:37 PM, David Pr=E9vot <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org> wr=
ote:
> ---
>  man7/capabilities.7 |   10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/man7/capabilities.7 b/man7/capabilities.7
> index 19a7309..61a340e 100644
> --- a/man7/capabilities.7
> +++ b/man7/capabilities.7
> @@ -190,13 +190,13 @@ Perform various network-related operations:
>  .IP * 2
>  interface configuration;
>  .IP *
> -administration of IP firewall, masquerading, and accounting
> +administration of IP firewall, masquerading, and accounting;
>  .IP *
>  modify routing tables;
>  .IP *
>  bind to any address for transparent proxying;
>  .IP *
> -set type-of-service (TOS)
> +set type-of-service (TOS);
>  .IP *
>  clear driver statistics;
>  .IP *
> @@ -368,7 +368,7 @@ employ the
>  .B TIOCSTI
>  .BR ioctl (2)
>  to insert characters into the input queue of a terminal other than
> -the caller's controlling terminal.
> +the caller's controlling terminal;
>  .IP *
>  employ the obsolete
>  .BR nfsservctl (2)
> @@ -482,7 +482,7 @@ employ the
>  operation;
>  .IP *
>  open devices for accessing x86 model-specific registers (MSRs, see
> -.BR msr (4))
> +.BR msr (4));
>  .IP *
>  update
>  .IR /proc/sys/vm/mmap_min_addr ;
> @@ -549,7 +549,7 @@ override the
>  limit when setting the capacity of a pipe using the
>  .B F_SETPIPE_SZ
>  .BR fcntl (2)
> -command.
> +command;
>  .IP *
>  use
>  .BR F_SETPIPE_SZ
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
