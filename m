From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] Explain how to read a single inotify event.
Date: Wed, 25 Apr 2012 11:11:51 +1200
Message-ID: <CAKgNAkgtUq+ZONu6ik3omFQ60n0UP_nrVzKsihRhKGY+AOMV-A@mail.gmail.com>
References: <4EDDE325.2080203@ubuntu.com> <CAKgNAkgB3_SUsnH0-c8X6Lute8amtEkw0VtrsCqFGWn+c4yfQA@mail.gmail.com>
 <20120424181112.GA1458@dcvr.yhbt.net>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20120424181112.GA1458-yBiyF41qdooeIZ0/mPfg9Q@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Eric Wong <normalperson-rMlxZR9MS24@public.gmane.org>
Cc: James Hunt <james.hunt-GeWIH/nMZzLQT0dZR+AlfA@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Eric,

On Wed, Apr 25, 2012 at 6:11 AM, Eric Wong <normalperson-rMlxZR9MS24@public.gmane.org> wrot=
e:
> "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>> My question is, why do you want to propose this technique for readin=
g
>> a *single* event.?
>
> It could be useful in multithreaded/multiprocess apps that rely on an
> inotify descriptor to distribute work to a thread pool. =A0accept() a=
nd
> mq_receive() users do it all the time.

In that case, I'd have thought it more efficient to have a manger
thread read blocks of events and hand them out to members of the pool.
This would be more efficient than performing multiple read() calls.
The difference for accept() and mq_receive() is that they retrieve
single "events" *by definition*.

Cheers,

Michael


--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
