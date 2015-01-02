From: Elie De Brauwer <eliedebrauwer-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 2/3] mem.4: correct /dev/port group in example
Date: Fri,  2 Jan 2015 14:11:37 +0100
Message-ID: <1420204298-25625-3-git-send-email-eliedebrauwer@gmail.com>
References: <1420204298-25625-1-git-send-email-eliedebrauwer@gmail.com>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1420204298-25625-1-git-send-email-eliedebrauwer-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Elie De Brauwer <eliedebrauwer-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-man@vger.kernel.org

mem.4 mentions that group for /dev/port should be set to 'mem' however
all other files (/dev/mem and /dev/kmem) use the kmem group in their
examples and on my system /dev/port belongs to kmem. Hence the 'mem'
group was probably a typo:

edb@lapelidb:~$ cat /etc/group | grep -i mem
kmem:x:15:
edb@lapelidb:~$ ls -al /dev/port
crw-r----- 1 root kmem 1, 4 Jan  2 10:00 /dev/port

Signed-off-by: Elie De Brauwer <eliedebrauwer-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 man4/mem.4 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man4/mem.4 b/man4/mem.4
index fef007e..6688345 100644
--- a/man4/mem.4
+++ b/man4/mem.4
@@ -76,7 +76,7 @@ It is typically created by:
 .sp
 mknod \-m 660 /dev/port c 1 4
 .br
-chown root:mem /dev/port
+chown root:kmem /dev/port
 .RE
 .SH FILES
 .I /dev/mem
-- 
2.1.3

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
