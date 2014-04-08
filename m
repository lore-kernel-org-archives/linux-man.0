From: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] getsubopt.3: ATTRIBUTES: Note function that is thread-safe
Date: Tue, 8 Apr 2014 10:29:11 +0800
Message-ID: <1396924151-16033-1-git-send-email-penght@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org, aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

The function getsubopt() is thread safe.

Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/getsubopt.3 | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/man3/getsubopt.3 b/man3/getsubopt.3
index a4ba755..e0b2a45 100644
--- a/man3/getsubopt.3
+++ b/man3/getsubopt.3
@@ -22,7 +22,7 @@
 .\" SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 .\" %%%LICENSE_END
 .\"
-.TH GETSUBOPT 3 2010-09-26 "GNU" "Linux Programmer's Manual"
+.TH GETSUBOPT 3 2014-04-08 "GNU" "Linux Programmer's Manual"
 .SH NAME
 getsubopt \- parse suboption arguments from a string
 .SH SYNOPSIS
@@ -126,6 +126,11 @@ is changed, the first suboption before the call to
 .BR getsubopt ()
 is not (necessarily) the same as the first suboption after
 .BR getsubopt ().
+.SH ATTRIBUTES
+.SS Multithreading (see pthreads(7))
+The
+.BR getsubopt ()
+function is thread-safe.
 .SH CONFORMING TO
 POSIX.1-2001.
 .SH NOTES
-- 
1.9.0

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
