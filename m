From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Linux find(1) man page error
Date: Sat, 15 Mar 2014 06:48:22 +0100
Message-ID: <CAKgNAkiUYvgwgKG5E+9HmmsEceG9ZGm2NN1JyxP4Mzu1usZcew@mail.gmail.com>
References: <CAByKChfmu5oJTdV_QJYYNCrFs3t3z_-E8xvsQPLAmtfH2G0FKw@mail.gmail.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAByKChfmu5oJTdV_QJYYNCrFs3t3z_-E8xvsQPLAmtfH2G0FKw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alan Karp <alan.karp-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Alan,

On Sat, Mar 15, 2014 at 2:03 AM, Alan Karp <alan.karp-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> The latest version of the man page indicates that the -prune option returns
> false when the -depth option is present; this was true in find in version
> 4.2, but in version 4.4.2 this behavior has changed. I see in the change log
> for 4.4.2 that this changed in response to fixing Savannah bug #20803.
>
> The paragraph in the man page describing -prune should indicate that it
> returns true always.

Thanks for thinking to make the report, but this list is the wrong
location for bug reports about this man page. Please see
http://man7.org/linux/man-pages/man1/find.1.html#COLOPHON

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
