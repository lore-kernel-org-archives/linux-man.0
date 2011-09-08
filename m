From: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [patch] signal.7: remove out-of-date description
Date: Thu, 8 Sep 2011 17:05:05 +0200
Message-ID: <CAKgNAkjasMfOYEg3-ibaoUzQdbze-8O9TgPLMavLMHSh4Sn9Cw@mail.gmail.com>
References: <4E5E527A.2030606@gmail.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4E5E527A.2030606-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Seonghun Lim <wariua-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

2011/8/31 Seonghun Lim <wariua-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>:
> man-pages version: latest git repository
> why: New description on LinuxThreads and NPTL's reserving of
> real-time signals was added at the previous paragraph, so the
> out-of-date description should be removed.

Thanks Seonghun. Applied for 3.33.

Cheers,

Michael

> diff --git a/man7/signal.7 b/man7/signal.7
> --- a/man7/signal.7
> +++ b/man7/signal.7
> @@ -375,8 +375,6 @@ does not exceed
> Unlike standard signals, real-time signals have no predefined meanings:
> the entire set of real-time signals can be used for application-defined
> purposes.
> -(Note, however, that the LinuxThreads implementation uses the first
> -three real-time signals.)
> .PP
> The default action for an unhandled real-time signal is to terminate the
> receiving process.
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
