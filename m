From: Rares Aioanei <schaiba-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Typo in flock(2) manpage
Date: Sat, 6 May 2017 22:45:57 +0300
Message-ID: <CABasXZX8M6-Ha8GuT-0+xt0d9tmgQ1Mtp1dccuEnR=x+OdnW=Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello,

In the DESCRIPTION section of the flock(2) system call, it says "Locks
created by flock() are associated with an open file description (see
open(2))." I'm pretty sure "file description" should be "file
descriptor". This also appears in the latest version of the manual
pages. I'm using manpages v. 4.10 (2016-03-15) on a Debian
stable/testing machine.

-- 
Rares Aioanei
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
