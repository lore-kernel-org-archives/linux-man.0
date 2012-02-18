From: =?iso-8859-2?b?QmXyYXM=?= Petr <xbenas00-qjZHU19XGF/maGwbMATS8qVXKuFTiq87@public.gmane.org>
Subject: [patch] Add get_nprocs.3 and get_nprocs_conf.3 manpages
Date: Sat, 18 Feb 2012 15:56:21 +0100
Message-ID: <20120218155621.11151qkmofi8hz4l@email.fit.vutbr.cz>
Mime-Version: 1.0
Content-Type: text/plain;
 charset=ISO-8859-2;
 DelSp="Yes";
 format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kasparek-AzIEtyGJxgYp1Coe8Ar9gA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Greetings,

I have created $subj manpages (both undocumented.3).
Patch against latest git manpages version, information obtained from  
[1], [2] and testing on two x86_64 hosts.

Best regards
Petr Benas

[1] http://www.gnu.org/software/libc/manual/html_node/Processor-Resources.html
[2] http://sourceware.org/ml/libc-hacker/2004-03/msg00088.html

diff --git a/man3/get_nprocs.3 b/man3/get_nprocs.3
new file mode 100644
index 0000000..e718ae5
--- /dev/null
+++ b/man3/get_nprocs.3
@@ -0,0 +1,50 @@
+.\" Copyright (c) 2012, Petr Benas
+.\"
+.\" This is free documentation; you can redistribute it and/or
+.\" modify it under the terms of the GNU General Public License as
+.\" published by the Free Software Foundation; either version 3 of
+.\" the License, or (at your option) any later version.
+.\"
+.\" The GNU General Public License's references to "object code"
+.\" and "executables" are to be interpreted as the output of any
+.\" document formatting or typesetting system, including
+.\" intermediate and printed output.
+.\"
+.\" This manual is distributed in the hope that it will be useful,
+.\" but WITHOUT ANY WARRANTY; without even the implied warranty of
+.\" MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+.\" GNU General Public License for more details.
+.\"
+.\" You should have received a copy of the GNU General Public
+.\" License along with this manual; if not, see
+.\" <http://www.gnu.org/licenses/>.
+.TH GET_NPROCS 3   2012-02-18 "GNU" "Linux Programmer's Manual"
+.SH NAME
+get_nprocs \- get number of processors available
+.SH SYNOPSIS
+.B #include <sys/sysinfo.h>
+.sp
+.BI "int get_nprocs(void);"
+.SH DESCRIPTION
+The function
+.BR get_nprocs ()
+returns the number of processors currently available in the system.
+The number returned can be affected by CPU logical hotplug.
+.SH EXAMPLE
+Following is an example how
+.BR get_nprocs ()
+can be used.
+
+.nf
+#include <stdio.h>
+#include <sys/sysinfo.h>
+
+int main(int argc, char *argv[])
+{
+    printf("This sytem has %d processors available.\\n", get_nprocs());
+    return 0;
+}
+.fi
+.SH "SEE ALSO"
+.BR get_nprocs_conf (3)
+
diff --git a/man3/get_nprocs_conf.3 b/man3/get_nprocs_conf.3
new file mode 100644
index 0000000..990ca51
--- /dev/null
+++ b/man3/get_nprocs_conf.3
@@ -0,0 +1,50 @@
+.\" Copyright (c) 2012, Petr Benas
+.\"
+.\" This is free documentation; you can redistribute it and/or
+.\" modify it under the terms of the GNU General Public License as
+.\" published by the Free Software Foundation; either version 3 of
+.\" the License, or (at your option) any later version.
+.\"
+.\" The GNU General Public License's references to "object code"
+.\" and "executables" are to be interpreted as the output of any
+.\" document formatting or typesetting system, including
+.\" intermediate and printed output.
+.\"
+.\" This manual is distributed in the hope that it will be useful,
+.\" but WITHOUT ANY WARRANTY; without even the implied warranty of
+.\" MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+.\" GNU General Public License for more details.
+.\"
+.\" You should have received a copy of the GNU General Public
+.\" License along with this manual; if not, see
+.\" <http://www.gnu.org/licenses/>.
+.TH GET_NPROCS_CONF 3   2012-02-18 "GNU" "Linux Programmer's Manual"
+.SH NAME
+get_nprocs_conf \- get number of processors configured by the  
operating system
+.SH SYNOPSIS
+.B #include <sys/sysinfo.h>
+.sp
+.BI "int get_nprocs_conf(void);"
+.SH DESCRIPTION
+The function
+.BR get_nprocs_conf ()
+returns the number of processors configured by the operating system.
+The number returned is not affected by CPU logical hotplug.
+.SH EXAMPLE
+Following is an example how
+.BR get_nprocs_conf ()
+can be used.
+
+.nf
+#include <stdio.h>
+#include <sys/sysinfo.h>
+
+int main(int argc, char *argv[])
+{
+    printf("This sytem has %d processors configured.\\n", get_nprocs_conf());
+    return 0;
+}
+.fi
+.SH "SEE ALSO"
+.BR get_nprocs (3)
+


--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
