From: Lennart Poettering <lennart-mdGvqq1h2p+GdvJs77BJ7Q@public.gmane.org>
Subject: Confusion regarding unit of RLIMIT_RSS
Date: Mon, 9 Nov 2015 17:07:10 +0100
Message-ID: <20151109160710.GA7322@gardel-login>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

heya,

The man page for setrlimit() claims that RLIMIT_RSS is to be specified
in bytes, but glibc's bits/resources.h claims it was in bytes. My
suspicion is that the header is right, and the man page wrong. But of
course, since the limit has no effect on Linux anyway, maybe this is
not the most important thing to fix, but I thought I'd at least report
the discrepancy here...

Thanks,

Lennart
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
