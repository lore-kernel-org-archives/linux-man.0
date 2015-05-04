From: William Woodruff <william-d4iiUcZhRQBWk0Htik3J/w@public.gmane.org>
Subject: [PATCH] add documentation for get_phys_pages and get_av_phys_pages
Date: Mon, 04 May 2015 16:16:45 -0400
Message-ID: <5547D3AD.3020402@tuffbizz.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Here are the manpage(s) for get_{av_}phys_pages.

Best,
William


Signed-off-by: William Woodruff <william-d4iiUcZhRQBWk0Htik3J/w@public.gmane.org>
---
 man3/get_av_phys_pages.3 |  1 +
 man3/get_phys_pages.3    | 96
++++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 97 insertions(+)
 create mode 100644 man3/get_av_phys_pages.3
 create mode 100644 man3/get_phys_pages.3

diff --git a/man3/get_av_phys_pages.3 b/man3/get_av_phys_pages.3
new file mode 100644
index 0000000..cbd22cc
--- /dev/null
+++ b/man3/get_av_phys_pages.3
@@ -0,0 +1 @@
+.so man3/get_phys_pages.3
diff --git a/man3/get_phys_pages.3 b/man3/get_phys_pages.3
new file mode 100644
index 0000000..c79693e
--- /dev/null
+++ b/man3/get_phys_pages.3
@@ -0,0 +1,96 @@
+.\" Copyright (c) 2015 William Woodruff (william-d4iiUcZhRQBWk0Htik3J/w@public.gmane.org)
+.\"
+.\" %%%LICENSE_START(VERBATIM)
+.\" Permission is granted to make and distribute verbatim copies of this
+.\" manual provided the copyright notice and this permission notice are
+.\" preserved on all copies.
+.\"
+.\" Permission is granted to copy and distribute modified versions of this
+.\" manual under the conditions for verbatim copying, provided that the
+.\" entire resulting derived work is distributed under the terms of a
+.\" permission notice identical to this one.
+.\"
+.\" Since the Linux kernel and libraries are constantly changing, this
+.\" manual page may be incorrect or out-of-date.  The author(s) assume no
+.\" responsibility for errors or omissions, or for damages resulting from
+.\" the use of the information contained herein.  The author(s) may not
+.\" have taken the same level of care in the production of this manual,
+.\" which is licensed free of charge, as they might when working
+.\" professionally.
+.\"
+.\" Formatted or processed versions of this manual, if unaccompanied by
+.\" the source, must acknowledge the copyright and authors of this work.
+.\" %%%LICENSE_END
+.\"
+.TH GET_PHYS_PAGES 3  2015-03-02 "GNU" "Linux Programmer's Manual"
+.SH NAME
+get_phys_pages, get_avphys_pages \- get total and available physical
page counts
+.SH SYNOPSIS
+.nf
+.B "#include <sys/sysinfo.h>"
+.sp
+.B long int get_phys_pages(void);
+.B long int get_av_phys_pages(void);
+.SH DESCRIPTION
+The function
+.BR get_phys_pages ()
+returns the total number of physical pages of memory available on the
system.
+
+The function
+.BR get_avphys_pages ()
+returns the number of currently available physical pages of memory on the
+system.
+.SH RETURN VALUE
+On success, these functions return a nonnegative value as given in
DESCRIPTION.
+On failure, they return \-1 and set
+.I errno
+to indicate the cause of the error.
+.SH ERRORS
+.TP
+.B ENOSYS
+The system could not provide the required information
+(possibly because the
+.I /proc
+filesystem was not mounted).
+.SH CONFORMING TO
+These functions are GNU extensions.
+.SH NOTES
+These functions obtain the required information by scanning the
+.I MemTotal
+and
+.I MemFree
+fields of
+.IR /proc/meminfo .
+
+The following
+.BR sysconf (3)
+calls provide a portable means of obtaining the same information as the
+functions described on this page.
+
+.nf
+    total_pages = sysconf(_SC_PHYS_PAGES);    /* total pages */
+    avl_pages = sysconf(_SC_AVPHYS_PAGES);    /* available pages */
+.fi
+.SH EXAMPLE
+The following example shows how
+.BR get_phys_pages ()
+and
+.BR get_avphys_pages ()
+can be used.
+
+.nf
+#include <stdio.h>
+#include <stdlib.h>
+#include <sys/sysinfo.h>
+
+int
+main(int argc, char *argv[])
+{
+    printf("This system has %ld pages of physical memory and "
+            "%ld pages of physical memory available.\\n",
+            get_phys_pages(), get_avphys_pages());
+    exit(EXIT_SUCCESS);
+}
+.fi
+.SH SEE ALSO
+.BR sysconf (3)
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
