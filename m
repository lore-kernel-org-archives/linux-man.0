From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Typo in flock(2) manpage
Date: Mon, 8 May 2017 10:56:43 +0200
Message-ID: <99ec937c-4271-e2d0-8e0e-a49a5f5b5a9b@gmail.com>
References: <CABasXZX8M6-Ha8GuT-0+xt0d9tmgQ1Mtp1dccuEnR=x+OdnW=Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CABasXZX8M6-Ha8GuT-0+xt0d9tmgQ1Mtp1dccuEnR=x+OdnW=Q@mail.gmail.com>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rares Aioanei <schaiba-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Rares,

On 05/06/2017 09:45 PM, Rares Aioanei wrote:
> Hello,
> 
> In the DESCRIPTION section of the flock(2) system call, it says "Locks
> created by flock() are associated with an open file description (see
> open(2))." I'm pretty sure "file description" should be "file
> descriptor". This also appears in the latest version of the manual
> pages. I'm using manpages v. 4.10 (2016-03-15) on a Debian
> stable/testing machine.

Actually, it really is correct. Take a look at the open(2) man page.

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
