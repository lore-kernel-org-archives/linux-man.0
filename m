From: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/2] unshare.2: Document CLONE_NEWNET
Date: Sat, 30 Oct 2010 07:53:44 +0200
Message-ID: <AANLkTimng+SjJjWNCEqik6rM1bnKgBnEj8U8Dj8HiTO5@mail.gmail.com>
References: <1287105955-32499-1-git-send-email-lucian.grijincu@gmail.com>
 <AANLkTimJrGJywCSNQKuP0p_hx9icbnXGcqRr600e5SY-@mail.gmail.com> <AANLkTi=bfGP-6tadn5GHGuz3YVyUnTLGU2A=DMp-DRYG@mail.gmail.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <AANLkTi=bfGP-6tadn5GHGuz3YVyUnTLGU2A=DMp-DRYG-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lucian Adrian Grijincu <lucian.grijincu-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Lucian,

On Sun, Oct 24, 2010 at 6:06 PM, Lucian Adrian Grijincu
<lucian.grijincu-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> Hi Michael,
>
> On Sun, Oct 24, 2010 at 5:35 PM, Michael Kerrisk <mtk.manpages@gmail.=
com> wrote:
>> +Unshare the network namespace,
>> +so that the calling process has a private copy of the
>> +network namespace
>
> That's not exactly right. This is not a private copy of the network
> namespace, as that would mean I'd have all devices available in the
> new network namespace, but changes done in my private copy will not b=
e
> visible to others. This creates a new network namespace from scratch.
> You don't have anything from the old network namespace in the new one=
=2E
> Even the loopback device is new.

Thanks for checking this!

>> which is not shared with any other process.
>
> It's not shared with previously existing processes. Child processes
> will, by default, inherit the network namespace.
>
>
> How does this one look?

Much better.

> diff --git a/man2/unshare.2 b/man2/unshare.2
> index 051ebf5..49377c5 100644
> --- a/man2/unshare.2
> +++ b/man2/unshare.2
> @@ -76,6 +76,22 @@ or umask attributes with any other process.
> =A0or
> =A0.BR umask (2)
> =A0.TP
> +.BR CLONE_NEWNET " (since Linux 2.6.24)
> +This flag has the
> +.I same
> +effect as the
> +.BR clone (2)
> +.B CLONE_NEWNET
> +flag.
> +Unshare the network namespace,
> +so that the calling process is moved into a
> +new network namespace which is not shared
> +with any previous process.
> +.BR CLONE_NEWNET
> +requires the
> +.BR CAP_SYS_ADMIN
> +capability.
> +.TP
> =A0.B CLONE_NEWNS
> =A0.\" These flag name are inconsistent:
> =A0.\" CLONE_NEWNS does the same thing in clone(), but CLONE_VM,

Applied for man-pages-3.30 (but, I changed "previous" to "previously ex=
isting").

Thanks,

Michael


--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
