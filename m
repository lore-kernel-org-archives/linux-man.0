From: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] psiginfo.3, psignal.3: Document psiginfo()
Date: Sun, 10 Oct 2010 18:24:15 +0200
Message-ID: <AANLkTikPJmqPGGO5teK0BCsvya=7HaS21zAEqbuJkqqx@mail.gmail.com>
References: <20101006065142.GA26673@gaara.hadrons.org> <AANLkTi=WhRscu96fioF0jvfp2a874gtA=niw-DDx8NC-@mail.gmail.com>
 <AANLkTim==RDg8a8eVYT1Dd=RRe2HKVaffW178opoycwe@mail.gmail.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <AANLkTim==RDg8a8eVYT1Dd=RRe2HKVaffW178opoycwe-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Guillem Jover <guillem-+FW4gsLVM0RAfugRpC6u6w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi Guillem,

I also added some details for psiginfo().

thanks,

Michael


--- a/man3/psignal.3
+++ b/man3/psignal.3
@@ -70,6 +70,17 @@ except that it displays information about the
signal described by
 which should point to a valid
 .I siginfo_t
 structure.
+As well as the signal description,
+.BR psiginfo ()
+displays information about the origin of the signal,
+and other information relevant to the signal
+(e.g., the relevant memory address for hardware-generated signals,
+the child process ID for
+.BR SIGCHLD ,
+and the user ID and process ID of the sender, for signals set using
+.BR kill (2)
+or
+.BR sigqueue (2)).

 The array \fIsys_siglist\fP holds the signal description strings
 indexed by signal number.
@@ -79,8 +90,22 @@ The
 and
 .BR psiginfo ()
 functions return no value.
+.SH VERSIONS
+The
+.BR psiginfo()
+function was added to glibc in version 2.10.
 .SH "CONFORMING TO"
 POSIX.1-2008, 4.3BSD.
+.SH BUGS
+As at glibc 2.12,
+.BR psiginfo ()
+has the following bugs:
+.IP * 3
+In some circumstances, a trailing newline is not printed.
+.\" FIXME http://sourceware.org/bugzilla/show_bug.cgi?id=12107
+.IP *
+Additional details for are not displayed for realtime signals.
+.\" FIXME http://sourceware.org/bugzilla/show_bug.cgi?id=12108
 .SH "SEE ALSO"
 .BR sigaction (2),
 .BR perror (3),

-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
