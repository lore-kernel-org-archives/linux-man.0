From: Pavel Emelyanov <xemul-bzQdu9zFT3WakBO8gow8eQ@public.gmane.org>
Subject: [PATCH] proc.5: Add info about /proc/[pid]/map_files directory
Date: Mon, 18 Feb 2013 20:50:59 +0400
Message-ID: <51225BF3.7080602@parallels.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

It was added into Linux v3.3 and provides info about files being mmap-ed in
a way _very_ similar to how /proc/[pid]/fd works. Thus I thought that the
best place for the map_files' doc is where where the fd's doc is.

Signed-off-by: Pavel Emelyanov <xemul-bzQdu9zFT3WakBO8gow8eQ@public.gmane.org>

---

diff --git a/man5/proc.5 b/man5/proc.5
index 30ca3a9..1226747 100644
--- a/man5/proc.5
+++ b/man5/proc.5
@@ -285,6 +285,23 @@ Thus the example command above could be written as:
 .RB "$" " foobar \-i /dev/stdin \-o /dev/stdout ..."
 .fi
 .in
+.TP
+.IR /proc/[pid]/map_files/ " (since kernel 3.3)
+This subdirectory contains entries corresponding to memory mapped
+files (see
+.BR mmap (2)).
+Entries are named by memory region start and end pair,
+and are symbolic links to the corresponding files.
+
+Although these entries are present for memory regions that were
+mapped with 
+.BR MAP_FILE
+flag, the way anonymous shared memory (regions created with
+.B MAP_ANON | MAP_SHARED
+flags)
+is implemented in Linux
+makes such regions also appear on this directory. In that case
+the target file would be the /dev/zero one.
 .\" FIXME Describe /proc/[pid]/loginuid
 .\"       Added in 2.6.11; updating requires CAP_AUDIT_CONTROL
 .\"       CONFIG_AUDITSYSCALL
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
