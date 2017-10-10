From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: ld.so(8) need clarification
Date: Tue, 10 Oct 2017 18:58:51 +0200
Message-ID: <CAKgNAkgAvX_V59JpjT48Lgtiqco4a8p0myZfjBV7z-jOp5K8tg@mail.gmail.com>
References: <CAJYFCiOX0rt6sRioUqQei2dyz_F9+43DbQub3Ru5GLSS_efqAQ@mail.gmail.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAJYFCiOX0rt6sRioUqQei2dyz_F9+43DbQub3Ru5GLSS_efqAQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Yubin Ruan <ablacktshirt-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hello Yubin,

On 10 October 2017 at 15:48, Yubin Ruan <ablacktshirt-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> Hi,
> In ld.so(8), when explaining whether a process is in the so-called
> "secure execution mode", there are three circumstances:
>
>    *  The process's real and effective user IDs differ, or the real and
>       effective group IDs differ.  This typically occurs as a result of
>       executing a set-user-ID or set-group-ID program.
>
>    *  A process with a non-root user ID executed a binary that conferred
>       permitted or effective capabilities.
>
>    *  A nonzero value may have been set by a Linux Security Module.
>
> I am confused with the second circumstance. What does it mean by
> "confer permitted or effective capabilities"?

Maybe this is a language issue. Doe it make more sense as:

" A process with a non-root user ID executed a binary that conferred
capabilities to the process's permitted or effective capability set."

?

Cheers,

Michael

-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
