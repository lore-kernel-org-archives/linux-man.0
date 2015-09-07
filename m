From: mhocko-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Subject: [PATCH] signal.7: add missing async-signal-safe functions
Date: Mon,  7 Sep 2015 17:07:49 +0200
Message-ID: <1441638469-22062-1-git-send-email-mhocko@kernel.org>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Takashi Iwai <tiwai-l3A5Bk7waGM@public.gmane.org>, Michal Hocko <mhocko-IBi9RG/b67k@public.gmane.org>
List-Id: linux-man@vger.kernel.org

From: Michal Hocko <mhocko-IBi9RG/b67k@public.gmane.org>

It seems that few async-signal-safe functions listed by POSIX.1-2008
http://pubs.opengroup.org/onlinepubs/9699919799/functions/V2_chap02.html#tag_15_04_03
are not mentioned in the man page. I am not exactly sure in which
version of the standard they have declared as signal safe. So they
were added to the section according to which standard they conform to:

POSIX.1-2001
- fchdir
- pthread_self
- pthread_sigmask

POSIX.1-2008
- pthread_kill

Signed-off-by: Michal Hocko <mhocko-IBi9RG/b67k@public.gmane.org>
---
 man7/signal.7 | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/man7/signal.7 b/man7/signal.7
index 4710945a2ab8..18871420cb16 100644
--- a/man7/signal.7
+++ b/man7/signal.7
@@ -510,6 +510,7 @@ execve()
 fchmod()
 fchown()
 fcntl()
+fchdir()
 fdatasync()
 fork()
 fpathconf()
@@ -541,6 +542,8 @@ pipe()
 poll()
 posix_trace_event()
 pselect()
+pthread_self()
+pthread_sigmask()
 raise()
 read()
 readlink()
@@ -622,6 +625,7 @@ mkfifoat()
 mknod()
 mknodat()
 openat()
+pthread_kill()
 readlinkat()
 renameat()
 symlinkat()
-- 
2.5.0

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
