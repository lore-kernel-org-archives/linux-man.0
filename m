From: bill o gallmeister <bog.kernel-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Subject: [PATCH] sleep.3: sleep suspends the thread, not the process.
 (Re: sleep(3) manpage)
Date: Wed, 20 Jan 2010 22:40:48 -0800
Message-ID: <4B57F6F0.8010904@gmail.com>
References: <9C1C3093-079B-4125-8621-56628C4A963B@cs.upt.ro>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <9C1C3093-079B-4125-8621-56628C4A963B-zTtBy73WAK9hl2p70BpVqQ@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Petre Mierlutiu <peter-zTtBy73WAK9hl2p70BpVqQ@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Petre Mierlutiu wrote:
> Hello,
> 
> the sleep(3) manpage states, under DESCRIPTION, that "sleep()  makes  the  calling  process sleep [...]". I believe this not to be true and the appropriate text would be: "sleep() makes the calling thread sleep [...]".
> 
>  I think in the past Linux did implement it so it would block the process, I am not sure.
> Anyway, sleep is currently implemented using nanosleep() and a simple threaded program can be written to prove sleep only sleeps the calling thread.
> 
> Manpages version: 3.21
> Distribution: ubuntu 9.10
> 
> Kind regards,
> 
> Petre Mierlutiu--
> To unsubscribe from this list: send the line "unsubscribe linux-man" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 

Signed-off-by: Bill O. Gallmeister <bog.kernel-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 man3/sleep.3 |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/man3/sleep.3 b/man3/sleep.3
index 900b7fc..41575b7 100644
--- a/man3/sleep.3
+++ b/man3/sleep.3
@@ -32,7 +32,7 @@ sleep \- Sleep for the specified number of seconds
 .fi
 .SH DESCRIPTION
 .BR sleep ()
-makes the calling process sleep until
+makes the calling thread sleep until
 .I seconds
 seconds have elapsed or a signal arrives which is not ignored.
 .SH "RETURN VALUE"
@@ -58,5 +58,6 @@ from a signal handler or modifying the handling of
 while sleeping will cause undefined results.
 .SH "SEE ALSO"
 .BR alarm (2),
+.BR nanosleep (2),
 .BR signal (2),
 .BR signal (7)
-- 
1.6.0.6
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
