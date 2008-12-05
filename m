From: Petr Baudis <pasky-AlSwsSmVLrQ@public.gmane.org>
Subject: [PATCH] nscd.8: Correct NOTES section on reloading configuration
	files
Date: Sat, 6 Dec 2008 00:17:38 +0100
Message-ID: <20081205231738.GU10491@machine.or.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, drepper-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
List-Id: linux-man@vger.kernel.org

The original notes were obsolete, current nscd watches changes in
config files.

Signed-off-by: Petr Baudis <pasky-AlSwsSmVLrQ@public.gmane.org>

diff --git a/man8/nscd.8 b/man8/nscd.8
index ecbd9ba..987efcb 100644
--- a/man8/nscd.8
+++ b/man8/nscd.8
@@ -17,7 +17,10 @@
 .\" write to the Free Software Foundation, Inc., 59 Temple Place - Suite 330,
 .\" Boston, MA 02111-1307, USA.
 .\"
-.TH NSCD 8 1999-10-01 "GNU" "Linux Programmer's Manual"
+.\" 2008-12-05 Petr Baudis <pasky-AlSwsSmVLrQ@public.gmane.org>
+.\"	Rewrite the NOTES section to reflect modern reality
+.\"
+.TH NSCD 8 2008-12-05 "GNU" "Linux Programmer's Manual"
 .SH NAME
 /usr/sbin/nscd \- name service cache daemon
 .SH DESCRIPTION
@@ -55,16 +58,29 @@ calls remain uncached as a result.
 .B "\-\-help"
 will give you a list with all options and what they do.
 .SH NOTES
-Nscd doesn't know anything about the underlying protocols for a
-service.
-This also means, that if you change
-.I /etc/resolv.conf
-for DNS queries, nscd will continue to use the old one if you have
-configured
-.I /etc/nsswitch.conf
-to use DNS for host lookups.
-In such a case, you need to restart
-nscd.
+The daemon will try to watch for changes in configuration files
+appropriate for each database (e.g.
+.I /etc/passwd
+for the
+.I passwd
+database or
+.IR "/etc/hosts " and " /etc/resolv.conf"
+for the
+.I hosts
+database) and flush the cache when these are changed.
+However, this will happen only after a short delay
+(unless the
+.BR inotify (7)
+mechanism is available and glibc-2.9 or newer is used)
+and this auto-detection does not cover configuration files
+required by non-standard NSS modules, if any are specified in
+.IR /etc/nsswitch.conf .
+In that case, you need to call
+.I nscd -i DATABASE
+after changing the configuration file of the database
+so that
+.B nscd
+invalidates its cache.
 .SH "SEE ALSO"
 .BR nscd.conf (5),
 .BR nsswitch.conf (5)
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
