From: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [patch] prctl.2: fix reference formatting
Date: Thu, 8 Sep 2011 17:06:26 +0200
Message-ID: <CAKgNAkiXK5hrEOFvDfoQ4Sarwqd8XRniGemdt9-izMCop+hCbQ@mail.gmail.com>
References: <4E5E507E.2050005@gmail.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4E5E507E.2050005-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Seonghun Lim <wariua-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

2011/8/31 Seonghun Lim <wariua-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>:
> man-pages version: latest git repository
> why: Reference should be in bold, not in italic.

Thanks Seonghun. Applied for 3.33.

Cheers,

Michael

> diff --git a/man2/prctl.2 b/man2/prctl.2
> --- a/man2/prctl.2
> +++ b/man2/prctl.2
> @@ -361,7 +361,7 @@ signal as soon as hardware memory corruption is
> detected inside
> its address space.
> In late kill mode, the process is only killed when it accesses a
> corrupted page.
> See
> -.I sigaction(2)
> +.BR sigaction (2)
> for more information on the
> .BR SIGBUS
> signal.
>
>



-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
