From: Peter Schiffer <pschiffe-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH] proc.5: Document /proc/[pid]/io file
Date: Tue, 30 Jul 2013 17:24:35 +0200
Message-ID: <51F7DAB3.30008@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Attempt to document fields in the /proc/[pid]/io file, based on the
Documentation/filesystems/proc.txt. The text will probably need some 
grammar corrections.

Signed-off-by: Peter Schiffer <pschiffe-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
---
  man5/proc.5 | 95 
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++---
  1 file changed, 91 insertions(+), 4 deletions(-)

diff --git a/man5/proc.5 b/man5/proc.5
index 375a131..6fd4543 100644
--- a/man5/proc.5
+++ b/man5/proc.5
@@ -59,7 +59,7 @@
  .\" to see what information could be imported from that file
  .\" into this file.
  .\"
-.TH PROC 5 2013-06-27 "Linux" "Linux Programmer's Manual"
+.TH PROC 5 2013-07-30 "Linux" "Linux Programmer's Manual"
  .SH NAME
  proc \- process information pseudo-file system
  .SH DESCRIPTION
@@ -350,9 +350,96 @@ file access mode and file status flags (see
  .BR open (2)).

  The files in this directory are readable only by the owner of the process.
-.\" FIXME document /proc/[pid]/io
-.\" .TP
-.\" .IR /proc/[pid]/io " (since kernel 2.6.20)"
+.TP
+.IR /proc/[pid]/io " (since kernel 2.6.20)"
+This file contains IO statistics for each running process, for example:
+.in +4n
+.nf
+
+.RB "#" " cat /proc/3828/io"
+rchar: 323934931
+wchar: 323929600
+syscr: 632687
+syscw: 632675
+read_bytes: 0
+write_bytes: 323932160
+cancelled_write_bytes: 0
+.fi
+.in
+
+The fields are as follows:
+.RS
+.IP * 2
+.IR rchar :
+chars read
+
+The number of bytes which this task has caused to be read from storage.
+This is simply the sum of bytes which this process passed to
+.BR read (2)
+and
+.BR pread (2).
+It includes things like tty IO and it is unaffected by whether or not 
actual
+physical disk IO was required (the read might have been satisfied from
+pagecache).
+.IP *
+.IR wchar :
+chars written
+
+The number of bytes which this task has caused, or shall cause to be 
written
+to disk.
+Similar caveats apply here as with
+.IR rchar .
+.IP *
+.IR syscr :
+read syscalls
+
+Attempt to count the number of read I/O operations, i.e. syscalls like
+.BR read (2)
+and
+.BR pread (2).
+.IP *
+.IR syscw :
+write syscalls
+
+Attempt to count the number of write I/O operations, i.e. syscalls like
+.BR write (2)
+and
+.BR pwrite (2).
+.IP *
+.IR read_bytes :
+bytes read
+
+Attempt to count the number of bytes which this process really did cause to
+be fetched from the storage layer.
+This is accurate for block-backed filesystems.
+.IP *
+.IR write_bytes :
+bytes written
+
+Attempt to count the number of bytes which this process caused to be 
sent to
+the storage layer.
+.IP *
+.IR cancelled_write_bytes :
+
+The big inaccuracy here is truncate.
+If a process writes 1MB to a file and then deletes the file,
+it will in fact perform no writeout.
+But it will have been accounted as having caused 1MB of write.
+In other words: this field represents number of bytes which this process
+caused to not happen, by truncating pagecache.
+A task can cause "negative" IO too.
+If this task truncates some dirty pagecache,
+some IO which another task has been accounted for
+(in its write_bytes) will not be happening.
+.IP
+.IR Note :
+
+At its current implementation state, this is a bit racy on 32-bit systems:
+if process A reads process B's
+.I /proc/[pid]/io
+while process B is updating one of those 64-bit counters,
+process A could see an intermediate result.
+.RE
  .TP
  .IR /proc/[pid]/limits " (since kernel 2.6.24)"
  This file displays the soft limit, hard limit, and units of measurement
-- 
1.8.3.1
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
