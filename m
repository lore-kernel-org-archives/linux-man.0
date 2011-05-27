From: Ivana Hutarova Varekova <varekova-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: proc.5 /proc/[pid]/cgroup patch
Date: Fri, 27 May 2011 10:37:39 +0200
Message-ID: <4DDF62D3.6080700@redhat.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------000203080604010303070907"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

This is a multi-part message in MIME format.
--------------000203080604010303070907
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hello,
I'm sending the patch for proc.5 which adds the information about 
/proc/[pid]/cgroup.
Ivana Hutarova Varekova

--------------000203080604010303070907
Content-Type: text/x-patch;
 name="man-pages-3.23-proc_cgroups.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="man-pages-3.23-proc_cgroups.patch"

diff -up man-pages-3.32/man5/proc.5.pom man-pages-3.32/man5/proc.5
--- man-pages-3.32/man5/proc.5.pom	2011-05-27 10:11:52.000000000 +0200
+++ man-pages-3.32/man5/proc.5	2011-05-27 09:17:37.000000000 +0200
@@ -94,12 +94,35 @@ to the process at exec time.
 The format is one \fIunsigned long\fP ID
 plus one \fIunsigned long\fP value for each entry.
 The last entry contains two zeros.
-.\" FIXME Describe /proc/[pid]/cgroup and
-.\"       /proc/[pid]/task/[tid]/cgroup
-.\" 	  Info in Documentation/cgroups.txt
-.\"       Added in 2.6.24
-.\"	  CONFIG_CGROUPS
-.\"
+.TP
+.I /proc/[pid]/cgroup " (since Linux 2.6.24)"
+This file describes control groups to which the process/task
+belongs. For each cgroup hierarchy there is one entry of the form
+.nf
+.ft CW
+
+  5:cpuacct,cpu,cpuset:/daemons
+(1)         (2)          (3)
+.ft
+.fi
+.IP
+The numbers in parentheses are labels for the descriptions below:
+.RS 7
+.TP 5
+(1)
+hierarchy id number
+.TP
+(2)
+set of subsystems bound to the hierarchy
+.TP
+(3)
+control group in the hierarchy to which the process belongs
+.RE
+.IP
+
+This file is only present if the
+.B CONFIG_CGROUPS
+kernel configuration option is enabled.
 .\" FIXME Describe /proc/[pid]/clear_refs
 .\"       Added in 2.6.22
 .\"       "Clears page referenced bits shown in smaps output"

--------------000203080604010303070907--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
