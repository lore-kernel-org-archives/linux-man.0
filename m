From: Michael Witten <mfwitten-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 8/9] Consistently define the Epoch
Date: Sat,  9 Jan 2010 17:45:36 -0600
Message-ID: <1263080737-2868-9-git-send-email-mfwitten@gmail.com>
References: <1263080737-2868-1-git-send-email-mfwitten@gmail.com>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1263080737-2868-1-git-send-email-mfwitten-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

All definitions of the Epoch have been refactored to the following:

  1970-01-01 00:00:00 +0000 (UTC)

That form is more consistent, logical, precise, and internationally
recognizable than the other variants.

Also, some wording has been altered as well.

Signed-off-by: Michael Witten <mfwitten-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 man2/stime.2      |    4 ++--
 man2/time.2       |    4 ++--
 man2/utimensat.2  |    6 +++---
 man3/ctime.3      |    3 +--
 man3/difftime.3   |    6 +++---
 man3/ftime.3      |    4 ++--
 man3/getspnam.3   |    4 ++--
 man3/mq_receive.3 |    2 +-
 man3/mq_send.3    |    2 +-
 man3/rtime.3      |    4 ++--
 man3/sem_wait.3   |    2 +-
 man3/strftime.3   |    3 +--
 man3/strptime.3   |    3 +--
 man3/timeradd.3   |    3 +--
 man4/rtc.4        |    2 +-
 man5/core.5       |    2 +-
 man5/proc.5       |    2 +-
 man7/icmp.7       |    2 +-
 man7/time.7       |    2 +-
 19 files changed, 28 insertions(+), 32 deletions(-)

diff --git a/man2/stime.2 b/man2/stime.2
index 530d223..534e297 100644
--- a/man2/stime.2
+++ b/man2/stime.2
@@ -45,8 +45,8 @@ _SVID_SOURCE
 .SH DESCRIPTION
 .BR stime ()
 sets the system's idea of the time and date.
-Time, pointed
-to by \fIt\fP, is measured in seconds from 00:00:00 UTC January 1, 1970.
+The time, pointed
+to by \fIt\fP, is measured in seconds since the Epoch, 1970-01-01 00:00:00 +0000 (UTC).
 .BR stime ()
 may only be executed by the superuser.
 .SH "RETURN VALUE"
diff --git a/man2/time.2 b/man2/time.2
index 5fae9d9..c4b7679 100644
--- a/man2/time.2
+++ b/man2/time.2
@@ -35,8 +35,8 @@ time \- get time in seconds
 .BI "time_t time(time_t *" t );
 .SH DESCRIPTION
 .BR time ()
-returns the time since the Epoch
-(00:00:00 UTC, January 1, 1970), measured in seconds.
+returns the time as the number of seconds since the Epoch,
+1970-01-01 00:00:00 +0000 (UTC).
 
 If
 .I t
diff --git a/man2/utimensat.2 b/man2/utimensat.2
index a87e66e..76725b2 100644
--- a/man2/utimensat.2
+++ b/man2/utimensat.2
@@ -78,9 +78,9 @@ specifies the new "last access time" (\fIatime\fP);
 specifies the new "last modification time" (\fImtime\fP).
 Each of the elements of
 .I times
-specifies a time in seconds and nanoseconds
-since the Epoch (00:00:00, 1 Jan 1970, UTC),
-in a structure of the following form:
+specifies a time as the the number of seconds and nanoseconds
+since the Epoch, 1970-01-01 00:00:00 +0000 (UTC).
+This information is conveyed in a structure of the following form:
 .in +4n
 .nf
 
diff --git a/man3/ctime.3 b/man3/ctime.3
index 75e2f76..132c364 100644
--- a/man3/ctime.3
+++ b/man3/ctime.3
@@ -78,8 +78,7 @@ and
 functions all take
 an argument of data type \fItime_t\fP which represents calendar time.
 When interpreted as an absolute time value, it represents the number of
-seconds elapsed since 00:00:00 on January 1, 1970, Coordinated Universal
-Time (UTC).
+seconds elapsed since the Epoch, 1970-01-01 00:00:00 +0000 (UTC).
 .PP
 The
 .BR asctime ()
diff --git a/man3/difftime.3 b/man3/difftime.3
index 5567751..79887b1 100644
--- a/man3/difftime.3
+++ b/man3/difftime.3
@@ -40,9 +40,9 @@ The
 function returns the number of seconds elapsed
 between time \fItime1\fP and time \fItime0\fP, represented as a
 .IR double .
-The two times are specified in calendar time, which represents the time
-elapsed since the Epoch
-(00:00:00 on January 1, 1970, Coordinated Universal Time (UTC)).
+Each of the times is specified in calendar time, which means its
+value is a measurement (in seconds) relative to the Epoch,
+1970-01-01 00:00:00 +0000 (UTC).
 .SH "CONFORMING TO"
 SVr4, 4.3BSD, C89, C99.
 .SH NOTES
diff --git a/man3/ftime.3 b/man3/ftime.3
index ce01574..2304b9a 100644
--- a/man3/ftime.3
+++ b/man3/ftime.3
@@ -36,8 +36,8 @@ ftime \- return date and time
 .sp
 .BI "int ftime(struct timeb *" tp );
 .SH DESCRIPTION
-This function returns the current time, in seconds and milliseconds
-since the Epoch (00:00:00 UTC, 1 January 1970).
+This function returns the current time as seconds and milliseconds
+since the Epoch, 1970-01-01 00:00:00 +0000 (UTC).
 The time is returned in
 .IR tp ,
 which is declared as follows:
diff --git a/man3/getspnam.3 b/man3/getspnam.3
index fdfc1fb..d4ca057 100644
--- a/man3/getspnam.3
+++ b/man3/getspnam.3
@@ -194,7 +194,7 @@ struct spwd {
     char *sp_namp;     /* Login name */
     char *sp_pwdp;     /* Encrypted password */
     long  sp_lstchg;   /* Date of last change (measured
-                          in days since 1 Jan 1970) */
+                          in days since 1970-01-01 00:00:00 +0000 (UTC)) */
     long  sp_min;      /* Min # of days between changes */
     long  sp_max;      /* Max # of days between changes */
     long  sp_warn;     /* # of days before password expires
@@ -202,7 +202,7 @@ struct spwd {
     long  sp_inact;    /* # of days after password expires
                           until account is disabled */
     long  sp_expire;   /* Date when account expires (measured
-                          in days since 1 Jan 1970) */
+                          in days since 1970-01-01 00:00:00 +0000 (UTC)) */
     unsigned long sp_flag;  /* Reserved */
 };
 .fi
diff --git a/man3/mq_receive.3 b/man3/mq_receive.3
index 32343a0..9a55812 100644
--- a/man3/mq_receive.3
+++ b/man3/mq_receive.3
@@ -83,7 +83,7 @@ flag is not enabled for the message queue description, then
 points to a structure which specifies a ceiling on the time for which
 the call will block.
 This ceiling is an absolute timeout in seconds and nanoseconds
-since the Epoch (midnight on the morning of 1 January 1970),
+since the Epoch, 1970-01-01 00:00:00 +0000 (UTC), and it is
 specified in the following structure:
 .sp
 .in +4n
diff --git a/man3/mq_send.3 b/man3/mq_send.3
index 3271d88..52eda2a 100644
--- a/man3/mq_send.3
+++ b/man3/mq_send.3
@@ -89,7 +89,7 @@ flag is not enabled for the message queue description, then
 points to a structure which specifies a ceiling on the time for which
 the call will block.
 This ceiling is an absolute timeout in seconds and nanoseconds
-since the Epoch (midnight on the morning of 1 January 1970),
+since the Epoch, 1970-01-01 00:00:00 +0000 (UTC), and it is
 specified in the following structure:
 .sp
 .in +4n
diff --git a/man3/rtime.3 b/man3/rtime.3
index 24be759..cd84f44 100644
--- a/man3/rtime.3
+++ b/man3/rtime.3
@@ -22,8 +22,8 @@ RFC\ 868 to obtain the time from a remote machine.
 The Time Server Protocol gives the time in seconds since
 00:00:00 UTC, 1 Jan 1900,
 and this function subtracts the appropriate constant in order to
-convert the result to seconds since
-00:00:00 UTC, 1 Jan 1970, the Unix Epoch.
+convert the result to seconds since the Epoch,
+1970-01-01 00:00:00 +0000 (UTC).
 .LP
 When
 .I timeout
diff --git a/man3/sem_wait.3 b/man3/sem_wait.3
index 526f57d..062e436 100644
--- a/man3/sem_wait.3
+++ b/man3/sem_wait.3
@@ -77,7 +77,7 @@ should block if the decrement cannot be immediately performed.
 The
 .I abs_timeout
 argument points to a structure that specifies an absolute timeout
-in seconds and nanoseconds since the Epoch (00:00:00, 1 January 1970).
+in seconds and nanoseconds since the Epoch, 1970-01-01 00:00:00 +0000 (UTC).
 This structure is defined as follows:
 
 .nf
diff --git a/man3/strftime.3 b/man3/strftime.3
index ee7b097..89b3a32 100644
--- a/man3/strftime.3
+++ b/man3/strftime.3
@@ -187,8 +187,7 @@ For a version including the seconds, see
 below.
 .TP
 .B %s
-The number of seconds since the Epoch, that is, since 1970-01-01
-00:00:00 UTC. (TZ)
+The number of seconds since the Epoch, 1970-01-01 00:00:00 +0000 (UTC). (TZ)
 .TP
 .B %S
 The second as a decimal number (range 00 to 60).
diff --git a/man3/strptime.3 b/man3/strptime.3
index aaba1d1..37b5fcb 100644
--- a/man3/strptime.3
+++ b/man3/strptime.3
@@ -374,8 +374,7 @@ is accepted as a synonym for
 Finally
 .TP
 .B %s
-The number of seconds since the Epoch,
-that is, since 1970-01-01 00:00:00 UTC.
+The number of seconds since the Epoch, 1970-01-01 00:00:00 +0000 (UTC).
 Leap seconds are not counted unless leap second support is available.
 .LP
 The glibc implementation does not require whitespace between
diff --git a/man3/timeradd.3 b/man3/timeradd.3
index 869b9e7..67a7fb5 100644
--- a/man3/timeradd.3
+++ b/man3/timeradd.3
@@ -96,8 +96,7 @@ zeros out the
 .I timeval
 structure pointed to by
 .IR tvp ,
-so that it represents the time at midnight
-on the morning of 1 January 1970 (the Epoch).
+so that it represents the Epoch: 1970-01-01 00:00:00 +0000 (UTC).
 
 .BR timerisset ()
 returns true (non-zero) if either field of the
diff --git a/man4/rtc.4 b/man4/rtc.4
index c4578b3..77ba983 100644
--- a/man4/rtc.4
+++ b/man4/rtc.4
@@ -59,7 +59,7 @@ and
 .BR time (2),
 as well as setting timestamps on files, etc.
 The system clock reports seconds and microseconds since a start point,
-defined to be the POSIX Epoch: Jan 1, 1970, 0:00 UTC.
+defined to be the POSIX Epoch: 1970-01-01 00:00:00 +0000 (UTC).
 (One common implementation counts timer interrupts, once
 per "jiffy", at a frequency of 100, 250, or 1000 Hz.)
 That is, it is supposed to report wall clock time, which RTCs also do.
diff --git a/man5/core.5 b/man5/core.5
index 886e88a..2d417f0 100644
--- a/man5/core.5
+++ b/man5/core.5
@@ -125,7 +125,7 @@ PID of dumped process
 number of signal causing dump
 .TP
 %t
-time of dump, expressed as seconds since the Epoch (00:00h, 1\ Jan 1970, UTC)
+time of dump, expressed as seconds since the Epoch, 1970-01-01 00:00:00 +0000 (UTC)
 .TP
 %h
 hostname (same as \fInodename\fP returned by \fBuname\fP(2))
diff --git a/man5/proc.5 b/man5/proc.5
index 3da30af..a9b24ff 100644
--- a/man5/proc.5
+++ b/man5/proc.5
@@ -1683,7 +1683,7 @@ each subsequent column is the total for a particular interrupt.
 The number of context switches that the system underwent.
 .TP
 \fIbtime 769041601\fP
-boot time, in seconds since the Epoch (January 1, 1970).
+boot time, in seconds since the Epoch, 1970-01-01 00:00:00 +0000 (UTC).
 .TP
 \fIprocesses 86031\fP
 Number of forks since boot.
diff --git a/man7/icmp.7 b/man7/icmp.7
index c5b676a..e777023 100644
--- a/man7/icmp.7
+++ b/man7/icmp.7
@@ -176,7 +176,7 @@ routing table and the redirect routes are expired after some time.
 .PP
 The 64-bit timestamp returned by
 .B ICMP_TIMESTAMP
-is in milliseconds since January 1, 1970.
+is in milliseconds since the Epoch, 1970-01-01 00:00:00 +0000 (UTC).
 .PP
 Linux ICMP internally uses a raw socket to send ICMPs.
 This raw socket may appear in
diff --git a/man7/time.7 b/man7/time.7
index 69c08cd..7c22da0 100644
--- a/man7/time.7
+++ b/man7/time.7
@@ -124,7 +124,7 @@ HRTs are not supported on all hardware architectures.
 .SS "The Epoch"
 Unix systems represent time in seconds since the
 .IR Epoch ,
-which is defined as 0:00:00 UTC on the morning of 1 January 1970.
+1970-01-01 00:00:00 +0000 (UTC).
 
 A program can determine the
 .I "calendar time"
-- 
1.6.6.102.gd6f8f

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
