From: Carlos O'Donell <carlos-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [patch] resolv.conf.5: Timeout does not map to resolver API calls.
Date: Mon, 5 Dec 2016 11:09:54 -0500
Message-ID: <42e0e498-3e74-867f-4651-e378bc0d7e34@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Florian Weimer <fweimer-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

I'm posting this patch to clarify the timeout behaviour because there
have been developers who expect this timeout to mean something it is not.

The timeout (and by proxy attempts) does not map to resolver API calls.
For example a single call to getent might involve multiple resolution
requests to the resolvers listed in resolv.conf and each request will
use TIMEOUT and be attempted at least ATTEMPT times. A developer using
the resolver API cannot easily compute any given timeout because the
implementation may change e.g. A and AAAA queries made in parallel.
A system administrator uses this setting to ensure there is a desirable
timeout on any request to any of the nameservers listed in resolv.conf,
but no guarantees exist beyond that.

Patch against master.

Signed-off-by: Carlos O'Donell <carlos-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
---
 man5/resolv.conf.5 | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/man5/resolv.conf.5 b/man5/resolv.conf.5
index 553f093..241565d 100644
--- a/man5/resolv.conf.5
+++ b/man5/resolv.conf.5
@@ -161,7 +161,10 @@ The value for this option is silently capped to 15.
 .\" Since glibc 2.2
 Sets the amount of time the resolver will wait for a
 response from a remote name server before retrying the
-query via a different name server.
+query via a different name server. This may
+.BR not
+be the total time taken by any resolver API call and there is no
+guarantee that a single resolver API call maps to a single timeout.
 Measured in seconds,
 the default is
 .BR RES_TIMEOUT
-- 
Cheers,
Carlos.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
