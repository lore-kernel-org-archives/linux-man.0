From: Peter Schiffer <pschiffe-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [patch] nscd.conf.5: add missing information, clarification
Date: Tue, 29 May 2012 14:16:35 +0200
Message-ID: <4FC4BE23.50200@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello,

the following patch adds description of max-db-size and auto-propagate 
options,
adds most default values for options and other minor modifications.

The changes in general are based on [1].
Default values are taken from [2] and [3].
Ordering and format of options are based on [4].

Patch is against man-pages 3.41.


peter

[1] http://sourceware.org/git/?p=glibc.git;a=tree;f=nscd;hb=HEAD
[2] http://sourceware.org/git/?p=glibc.git;a=blob;f=nscd/nscd.h;hb=HEAD
[3] 
http://sourceware.org/git/?p=glibc.git;a=blob;f=nscd/connections.c;hb=HEAD
[4] http://sourceware.org/git/?p=glibc.git;a=blob;f=nscd/nscd.conf;hb=HEAD



--- nscd.conf.5.org-upstream    2012-05-10 22:13:23.000000000 +0200
+++ nscd.conf.5    2012-05-29 13:46:56.684793432 +0200
@@ -34,48 +34,91 @@
  comment; following characters, up to the end of the line,
  are not interpreted by nscd.

-Valid services are \fIpasswd\fP, \fIgroup\fP, or \fIhosts\fP.
+Valid services are \fIpasswd\fP, \fIgroup\fP, \fIhosts\fP, \fIservices\fP
+or \fInetgroup\fP.

  .B logfile
-.I debug-file-name
+.I <file>
  .RS
  Specifies name of the file to which debug info should be written.
  .RE

  .B debug-level
-.I value
+.I <level>
  .RS
  Sets the desired debug level.
+The default is 0.
  .RE

  .B threads
-.I number
+.I <number>
  .RS
  This is the number of threads that are started to wait for
  requests.
  At least five threads will always be created.
  .RE

+.B max-threads
+.I <number>
+.RS
+Specifies the maximum number of threads. The default is 32.
+.RE
+
  .B server-user
-.I user
+.I <user>
  .RS
  If this option is set, nscd will run as this user and not as root.
  If a separate cache for every user is used (\-S parameter), this
  option is ignored.
  .RE

+.B stat-user
+.I <user>
+.RS
+Specifies the user who is allowed to request statistics.
+.RE
+
+.B reload-count
+unlimited |
+.I <number>
+.RS
+Limit on the number of times a cached entry gets reloaded without being 
used
+before it gets removed.
+The default is 5.
+.RE
+
+.B paranoia
+.I <yes|no>
+.RS
+Enabling paranoia mode causes nscd to restart itself periodically.
+The default is no.
+.RE
+
+.B restart-interval
+.I <time>
+.RS
+Sets the restart interval to
+.I time
+seconds
+if periodic restart is enabled by enabling
+.B paranoia
+mode.
+The default is 3600.
+.RE
+
  .B enable-cache
-.I service
+.I <service>
  .I <yes|no>
  .RS
  Enables or disables the specified
  .I service
  cache.
+The default is no.
  .RE

  .B positive-time-to-live
-.I service
-.I value
+.I <service>
+.I <value>
  .RS
  Sets the TTL (time-to-live) for positive entries (successful queries)
  in the specified cache for
@@ -87,8 +130,8 @@
  .RE

  .B negative-time-to-live
-.I service
-.I value
+.I <service>
+.I <value>
  .RS
  Sets the TTL (time-to-live) for negative entries (unsuccessful queries)
  in the specified cache for
@@ -102,16 +145,17 @@
  .RE

  .B suggested-size
-.I service
-.I value
+.I <service>
+.I <value>
  .RS
  This is the internal hash table size,
  .I value
  should remain a prime number for optimum efficiency.
+The default is 211.
  .RE

  .B check-files
-.I service
+.I <service>
  .I <yes|no>
  .RS
  Enables or disables checking the file belonging to the specified
@@ -120,50 +164,14 @@
  The files are
  .IR /etc/passwd ,
  .IR /etc/group ,
+.IR /etc/hosts
  and
-.IR /etc/hosts .
-.RE
-
-.B max-threads
-.I threads
-.RS
-Specifies the maximum number of threads to be started.
-.RE
-
-.B stat-user
-.I username
-.RS
-Specifies the user who is allowed to request statistics.
-.RE
-
-.B reload-count
-unlimited |
-.I number
-.RS
-Limit on the number of times a cached entry gets reloaded without being 
used
-before it gets removed.
-The default is 5.
-.RE
-
-.B paranoia
-.I <yes|no>
-.RS
-Enabling paranoia mode causes nscd to restart itself periodically.
-.RE
-
-.B restart-interval
-.I time
-.RS
-Sets the restart interval to
-.I time
-seconds
-if periodic restart is enabled by enabling
-.B paranoia
-mode.
+.IR /etc/services .
+The default is yes.
  .RE

  .B persistent
-.I service
+.I <service>
  .I <yes|no>
  .RS
  Keep the content of the cache for
@@ -171,10 +179,11 @@
  over server restarts; useful when
  .B paranoia
  mode is set.
+The default is no.
  .RE

  .B shared
-.I service
+.I <service>
  .I <yes|no>
  .RS
  The memory mapping of the nscd databases for
@@ -182,7 +191,32 @@
  is shared with the clients so
  that they can directly search in them instead of having to ask the
  daemon over the socket each time a lookup is performed.
+The default is no.
+.RE
+
+.B max-db-size
+.I <service>
+.I <bytes>
+.RS
+The maximum allowable size of the database files in bytes for the
+.IR service .
+The default is 33554432.
  .RE
+
+.B auto-propagate
+.I <service>
+.I <yes|no>
+.RS
+When set to
+.IR no " for " passwd " or " group " service, then the " .byname
+requests are not added to
+.IR passwd.byuid " or " group.bygid
+cache.
+This can help with tables containing multiple records for the same id.
+The default is yes. This option is valid only for services
+.IR passwd " and " group ".
+.RE
+
  .SH "SEE ALSO"
  .BR nscd (8)
  .\" .SH AUTHOR
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
