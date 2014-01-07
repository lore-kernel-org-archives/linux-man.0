From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH man-page] packet.7: document PACKET_QDISC_BYPASS
Date: Wed, 8 Jan 2014 12:34:28 +1300
Message-ID: <CAKgNAkiW5hnYZqUYQv_mWeGyVNgN+Edu5uViX2PxVwhrrGnOQg@mail.gmail.com>
References: <1386689485-18833-1-git-send-email-dborkman@redhat.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1386689485-18833-1-git-send-email-dborkman-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Daniel Borkmann <dborkman-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, brouer-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Wed, Dec 11, 2013 at 4:31 AM, Daniel Borkmann <dborkman-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> wrote:
> Add a comment about PACKET_QDISC_BYPASS' socket option to the kernel.

Daniel, could you ping me again when this goes into the mainline kernel?

Cheers,

Michael


> Signed-off-by: Daniel Borkmann <dborkman-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> ---
>  Michael, this patch is on top of Willem's resend for packet.7:
>  http://www.spinics.net/lists/linux-man/msg04576.html
>
>  Kernel part of this man page update:
>  https://git.kernel.org/cgit/linux/kernel/git/davem/net-next.git/commit/?id=d346a3fae3ff1d99f5d0c819bf86edf9094a26a1
>
>  Thanks!
>
>  man7/packet.7 | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/man7/packet.7 b/man7/packet.7
> index e0993d2..100f876 100644
> --- a/man7/packet.7
> +++ b/man7/packet.7
> @@ -426,6 +426,11 @@ creates a packet receive ring of variant
>  .BR TPACKET_V1 .
>  To create another variant, configure the desired variant by setting this
>  integer option before creating the ring.
> +.TP
> +.BR PACKET_QDISC_BYPASS " (since Linux 3.14)"
> +By default, packets sent through packet sockets pass through the kernel's
> +qdisc (traffic control) layer. This can be bypassed by setting this integer
> +option to one for usage scenarios similar to pktgen.
>
>  .SS Ioctls
>  .B SIOCGSTAMP
> --
> 1.8.3.1
>



-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
