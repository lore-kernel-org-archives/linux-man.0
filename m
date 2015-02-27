From: Ma Shimiao <mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] getlogin.3: Modify thread-safety information
Date: Fri, 27 Feb 2015 14:19:23 +0800
Message-ID: <1425017963-10359-1-git-send-email-mashimiao.fnst@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Ma Shimiao <mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

As annotation in glibc manual is more detailed, change the 
thread-safety information to be the same as glibc manual.

Signed-off-by: Ma Shimiao <mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/getlogin.3 | 29 +++++++++++++++++++++++++++--
 1 file changed, 27 insertions(+), 2 deletions(-)

diff --git a/man3/getlogin.3 b/man3/getlogin.3
index 828df2b..241f81c 100644
--- a/man3/getlogin.3
+++ b/man3/getlogin.3
@@ -147,14 +147,39 @@ l l l.
 Interface	Attribute	Value
 T{
 .BR getlogin ()
-T}	Thread safety	MT-Unsafe locale
+T}	Thread safety	T{
+MT-Unsafe race:getlogin race:utent
+.br
+sig:ALRM timer locale
+T}
 T{
 .BR getlogin_r ()
-T}	Thread safety	MT-Safe locale
+T}	Thread safety	T{
+MT-Unsafe race:utent sig:ALRM timer
+.br
+locale
+T}
 T{
 .BR cuserid ()
 T}	Thread safety	MT-Unsafe race:cuserid/!string locale
 .TE
+
+[[
+In the above table,
+.I utent
+in
+.I race:utent
+signifies that if any of the functions
+.BR setutent (), 
+.BR getutent (), 
+or
+.BR endutent ()
+are used in parallel in different threads of a program, then data races could occur.
+.BR getlogin ()
+and
+.BR getlogin_r ()
+call them, so we use race:utent to remind users.
+]]
 .SH CONFORMING TO
 .BR getlogin ()
 and
-- 
1.9.3

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
