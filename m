From: Michael Kerrisk <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: [PATCH] msgsnd(2): msg_bytes -> msg_qbytes
Date: Mon, 24 May 2010 08:32:36 +0200
Message-ID: <AANLkTinNDLWn8cEirlVNCnh-u8EJlvd2269bk0GLnCdn@mail.gmail.com>
References: <838959.52751.qm@web45611.mail.sp1.yahoo.com> <4bce5f4c.0d67f10a.33b0.ffff9e3e@mx.google.com>
	<1272503151-6937-1-git-send-email-mfwitten@gmail.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1272503151-6937-1-git-send-email-mfwitten-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Witten <mfwitten-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Thu, Apr 29, 2010 at 1:59 AM, Michael Witten <mfwitten-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wr=
ote:
> Mihail Paraschivescu <paraschivescu_mihail-/E1597aS9LQAvxtiuMwx3w@public.gmane.org> reported
> here:
>
> =A0 =A0http://marc.info/?l=3Dlinux-man&m=3D127160667709342&w=3D2
> =A0 =A0http://www.spinics.net/lists/linux-man/msg01271.html
>
> the following:
>
> =A0 =A0"The queue capacity is defined by the msg_bytes field in
> =A0 =A0the associated data structure for the message queue."
>
> =A0 =A0If I'm not wrong, the exact name of that field in the
> =A0 =A0msqid_ds structure is msg_qbytes. The same thing appears
> =A0 =A0also on the online [POSIX] manual pages, I checked it
> =A0 =A0already.
>
> I provided a detailed confirmation with quotes from the
> Linux kernel sources:
>
> =A0 =A0http://marc.info/?l=3Dlinux-man&m=3D127181601631737&w=3D2
> =A0 =A0http://www.spinics.net/lists/linux-man/msg01273.html
>
> This patch (requested by Mihail) makes the correction and
> removes unnecessary implementation details.

Michael, thanks for this patch, but see my notes in the thread:

Subject: Re: Man page typo
To: Michael Witten <mfwitten-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Mihai Paraschivescu <paraschivescu_mihail-/E1597aS9LQAvxtiuMwx3w@public.gmane.org>,
linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

I don't think this patch is needed (other than the part that fixes the
file names).

Cheers,

Michael

> ---
> =A0man2/msgop.2 | =A0 16 ++++++++--------
> =A01 files changed, 8 insertions(+), 8 deletions(-)
>
> diff --git a/man2/msgop.2 b/man2/msgop.2
> index 2b29cac..f236c5a 100644
> --- a/man2/msgop.2
> +++ b/man2/msgop.2
> @@ -102,14 +102,14 @@ by
> =A0.PP
> =A0If sufficient space is available in the queue,
> =A0.BR msgsnd ()
> -succeeds immediately.
> +succeeds immediately;
> -(The queue capacity is defined by the
> -.I msg_bytes
> -field in the associated data structure for the message queue.
> -During queue creation this field is initialized to
> -.B MSGMNB
> -bytes, but this limit can be modified using
> -.BR msgctl (2).)
> +the queue capacity can be queried and set via
> +.BR msgctl (2)
> +by using the
> +.I msg_qbytes
> +field of that function's
> +.I msqid_ds
> +pointer parameter.
> =A0If insufficient space is available in the queue, then the default
> =A0behavior of
> =A0.BR msgsnd ()
> --
> 1.7.1
>
>



--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface" http://blog.man7.org/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
