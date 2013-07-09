From: Eliezer Tamir <eliezer.tamir-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Subject: Documenting Low Latency (busy poll) sockets.
Date: Tue, 09 Jul 2013 11:36:56 +0300
Message-ID: <51DBCBA8.1060808@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hello,

I'm working on adding busy poll support to the networking stack.
We added two sysctl variables and a socket option.
My patches added information about the sysctl values in
Documentation/sysctl/net.txt

Andrew Morton pointed out that the man pages also need to be updated.
Please provide directions on what needs to be done.

Thank you,
Eliezer
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
