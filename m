From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Recommending UB in fmemopen man page
Date: Wed, 10 Aug 2016 11:44:27 +1200
Message-ID: <CAKgNAkhYt5BekO7GicpDrteo5zY1HhB2nfo7deboGH2gisJXMg@mail.gmail.com>
References: <20160809151346.GA18472@brightrain.aerifal.cx>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160809151346.GA18472-C3MtFaGISjmo6RMmaWD+6Sb1p8zYI1N1@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rich Felker <dalias-8zAoT0mYgF4@public.gmane.org>
Cc: "Michael Kerrisk (man-pages)" <mtk.lists-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hello Rich,

On 10 August 2016 at 03:13, Rich Felker <dalias-8zAoT0mYgF4@public.gmane.org> wrote:
> This recent Stack Overflow question turned up a recommendaton to
> invoke undefined behavior in the fmemopen man page:
>
> http://stackoverflow.com/questions/38854163/using-rewind-on-a-file-opened-with-fmemopen
>
> The stdio buffer associated with the fmemopen-obtained FILE, and the
> output memory buffer into which it's writing, are conceptually
> distinct entities, and there is no reason to expect reasonable results
> if you modify the contents of a setvbuf-associated buffer through
> other means while it's associated with a FILE.
>
> The following text should simply be removed:
>
>        Alternatively, the caller can explicitly set buf as the stdio
>        stream buffer, at the same time informing stdio of the buffer's
>        size, using:
>
>            setbuffer(stream, buf, size);

A discussion at the time [1] that that text was added made it seem
reasonable, but you've convinced me otherwise. Text removed. Thanks
for the report.

Cheers,

Michael

[1] http://sourceware.org/bugzilla/show_bug.cgi?id=1995 and
http://sources.redhat.com/ml/libc-alpha/2006-04/msg00064.html

-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
