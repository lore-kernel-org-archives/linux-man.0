From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: fcntl-F_GETLEASE-during-lease-break
Date: Sun, 15 Apr 2012 09:52:45 +1200
Message-ID: <CAKgNAkhpQC0xoHiyf03NC6ZgfFez09KDXZFQO_JX-=cNfOFfRg@mail.gmail.com>
References: <e9aaff34-deff-4235-8d35-14bfb45ca26e@zmail12.collab.prod.int.phx2.redhat.com>
 <3fda5e85-da93-4858-8094-7464e0eece65@zmail12.collab.prod.int.phx2.redhat.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <3fda5e85-da93-4858-8094-7464e0eece65-wNb+5y5mYzh+R5eDjrG6zsCp5Q1pQRjfhaY/URYTgi6ny3qCrzbmXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Abhijith Das <adas-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Abhijith,

On Tue, Mar 27, 2012 at 5:22 AM, Abhijith Das <adas-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> wrote:
> Hi,
>
> Here's a patch to the fcntl.2 manpage that explains
> the working of F_GETLEASE in a bit more detail during
> lease breaks. Basically, what happens is this: When a
> lease break is initiated by a lease breaker, subsequent
> F_GETLEASE calls return the target lease type after
> the lease break and not the existing lease type. This
> behavior persists until the lease holder downgrades/unlocks
> the lease or the kernel forcibly does it after the lease
> break timeout expires.
>
> The implicit assumption is that F_GETLEASE should
> return the existing lock type until the downgrade/unlock
> has actually taken place, which is not true. I've verified
> that the kernel indeed returns the target lease type. It
> is also simple enough to verify this behavior in a small
>  program, where you can observe that the lease type
>  returned by F_GETLEASE in the signal handler for a
> lease break is different from the existing lease type.

Thanks. Looks good to me. Applied for man-pages-3.39.

Cheers,

Michael

> Signed-off-by: Abhi Das <adas-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
>
> diff --git a/man2/fcntl.2 b/man2/fcntl.2
> index b2a985a..5256dc6 100644
> --- a/man2/fcntl.2
> +++ b/man2/fcntl.2
> @@ -865,6 +865,16 @@ the number of seconds specified in
> =A0.I /proc/sys/fs/lease-break-time
> =A0then the kernel forcibly removes or downgrades the lease holder's =
lease.
>
> +Once a lease break has been initiated,
> +.B F_GETLEASE
> +returns the target lease type (either
> +.B F_RDLCK
> +or
> +.B F_UNLCK
> +depending on what would be compatible with the lease breaker) until =
the
> +lease holder voluntarily downgrades or removes the lease or the kern=
el
> +forcibly does so after the lease break timer expires.
> +
> =A0Once the lease has been voluntarily or forcibly removed or downgra=
ded,
> =A0and assuming the lease breaker has not unblocked its system call,
> =A0the kernel permits the lease breaker's system call to proceed.



--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
