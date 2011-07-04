From: Jonathan Nieder <jrnieder-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH/RFC] resolver_r.3: New page documenting res_ninit() et al
Date: Mon, 4 Jul 2011 00:18:49 -0500
Message-ID: <20110704051737.GA15844@elie>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Mark Kettenis <mark.kettenis-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>, Martin Ferrari <tincho-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>, Robert Edmonds <edmonds-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Readers learning about the glibc resolver implementation might
appreciate some documentation for these basic functions.  They are
reentrant analogues invented by vixie around 1998 (?) for the
traditional BSD res_* functions.

The BIND 8 changelog (item 384) says:

	there is now a nearly-thread-safe resolver API, with
	the old non-thread-safe API being a set of stubs on
	top of this.  it is possible to program without _res.
	note: the documentation has not been updated.  also
	note: IRS is a thread-ready API, get*by*() is not.
	(see ../contrib/manyhosts for an example application.)

Luckily the glibc source tree includes some documentation for these
functions by Mark Kettenis at resolv/README, under the heading "Using
the resolver in multi-threaded code".  Steal that text, and with
minimal changes make it into a manpage.

To avoid requiring yet another license document to be distributed with
man-pages, the new manpage uses GPL-2+ as its license instead of
glibc's LGPL-2.1+.

Signed-off-by: Jonathan Nieder <jrnieder-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
Hi,

While looking over the glibc resolver code, I started to wish some
documentation like this existed.  As mentioned above, the text is
mostly stolen from glibc's resolv/README.  What do you think?
Improvements?  Simplifications?

Maybe the license should be something like "LGPL-2.1+ or (at your
option) GPL-2+" instead.

 man3/res_ninit.3        |    1 +
 man3/res_nmkquery.3     |    1 +
 man3/res_nquery.3       |    1 +
 man3/res_nquerydomain.3 |    1 +
 man3/res_nsearch.3      |    1 +
 man3/res_nsend.3        |    1 +
 man3/resolver.3         |    1 +
 man3/resolver_r.3       |  136 +++++++++++++++++++++++++++++++++++++++++++++++
 8 files changed, 143 insertions(+), 0 deletions(-)
 create mode 100644 man3/res_ninit.3
 create mode 100644 man3/res_nmkquery.3
 create mode 100644 man3/res_nquery.3
 create mode 100644 man3/res_nquerydomain.3
 create mode 100644 man3/res_nsearch.3
 create mode 100644 man3/res_nsend.3
 create mode 100644 man3/resolver_r.3

diff --git a/man3/res_ninit.3 b/man3/res_ninit.3
new file mode 100644
index 00000000..9963b525
--- /dev/null
+++ b/man3/res_ninit.3
@@ -0,0 +1 @@
+.so man3/resolver_r.3
diff --git a/man3/res_nmkquery.3 b/man3/res_nmkquery.3
new file mode 100644
index 00000000..9963b525
--- /dev/null
+++ b/man3/res_nmkquery.3
@@ -0,0 +1 @@
+.so man3/resolver_r.3
diff --git a/man3/res_nquery.3 b/man3/res_nquery.3
new file mode 100644
index 00000000..9963b525
--- /dev/null
+++ b/man3/res_nquery.3
@@ -0,0 +1 @@
+.so man3/resolver_r.3
diff --git a/man3/res_nquerydomain.3 b/man3/res_nquerydomain.3
new file mode 100644
index 00000000..9963b525
--- /dev/null
+++ b/man3/res_nquerydomain.3
@@ -0,0 +1 @@
+.so man3/resolver_r.3
diff --git a/man3/res_nsearch.3 b/man3/res_nsearch.3
new file mode 100644
index 00000000..9963b525
--- /dev/null
+++ b/man3/res_nsearch.3
@@ -0,0 +1 @@
+.so man3/resolver_r.3
diff --git a/man3/res_nsend.3 b/man3/res_nsend.3
new file mode 100644
index 00000000..9963b525
--- /dev/null
+++ b/man3/res_nsend.3
@@ -0,0 +1 @@
+.so man3/resolver_r.3
diff --git a/man3/resolver.3 b/man3/resolver.3
index a72dde7b..44f8f902 100644
--- a/man3/resolver.3
+++ b/man3/resolver.3
@@ -261,6 +261,7 @@ of the compressed name, or \-1 if an error occurs.
 .SH "CONFORMING TO"
 4.3BSD.
 .SH "SEE ALSO"
+.BR resolver_r (3),
 .BR gethostbyname (3),
 .BR resolv.conf (5),
 .BR resolver (5),
diff --git a/man3/resolver_r.3 b/man3/resolver_r.3
new file mode 100644
index 00000000..f2ced438
--- /dev/null
+++ b/man3/resolver_r.3
@@ -0,0 +1,136 @@
+.\" Copyright (C) 2000 Free Software Foundation, Inc.
+.\" Copyright (c) 2011 Jonathan Nieder
+.\" License: GPL-2+
+.\"
+.\" Based on glibc's resolv/README which was written by Mark Kettenis,
+.\" 2000-07-29.
+.\"
+.TH RESOLVER_R 3 2011-07-03 "GNU" "Linux Programmer's Manual"
+.SH NAME
+res_ninit, res_nquery, res_nsearch, res_nquerydomain, res_nmkquery,
+res_nsend \- reentrant resolver routines
+.SH SYNOPSIS
+.nf
+.B #include <resolv.h>
+.sp
+.B typedef struct state *res_state;
+.sp
+.BI "int res_ninit(res_state " statep ");"
+.sp
+.BI "int res_nquery(res_state " statep ", const char *" dname ", int " class ,
+.RS
+.BI "int " type ", unsigned char *" answer ", int " anslen );
+.RE
+.sp
+.BI "int res_nsearch(res_state " statep ", const char *" dname ", int " class ,
+.RS
+.BI "int " type ", unsigned char *" answer ", int " anslen );
+.RE
+.sp
+.BI "int res_nquerydomain(res_state " statep ", const char *" name ,
+.RS
+.BI "const char *" domain ", int " class ", int " type ,
+.BI "unsigned char *" answer ", int " anslen );
+.RE
+.sp
+.BI "int res_nmkquery(res_state " statep ", int " op ", const char *" dname ",
+.RS
+.BI "int " class ", int " type ", char *" data ", int " datalen ,
+.BI "struct rrec *" newrr ", char *" buf ", int " buflen );
+.RE
+.sp
+.BI "int res_nsend(res_state " statep ", const char *" msg ", int " msglen ,
+.RS
+.BI "char *" answer ", int " anslen );
+.RE
+.fi
+.sp
+Link with \fI\-lresolv\fP.
+.SH DESCRIPTION
+These functions are the reentrant equivalents of the functions described in
+.BR resolver (3).
+.PP
+The traditional resolver interfaces such as
+.BR res_init ()
+and
+.BR res_query ()
+use some static (global) state stored in the
+.I _res
+structure.
+Therefore, those interfaces are not thread-safe.
+Therefore, BIND 8.2 introduced a set of new interfaces
+.BR res_ninit (),
+.BR res_query (),
+etc that take a
+.B res_state
+as their first argument, so you can use a per-thread resolver state.
+.SH RETURN VALUE
+See
+.BR resolver (3).
+.SH VERSIONS
+First appeared in BIND 8.2-T1A;
+made their way into glibc in version 2.1.3.
+.SH CONFORMING TO
+BIND 8
+.SH NOTES
+.PP
+In glibc, when you link with \fI-lpthread\fP,
+a per-thread resolver state is already present.
+It can be accessed using
+.IR _res ,
+which has been defined as a macro in a similar way to the
+.I errno
+and
+.I h_errno
+variables.
+This per-thread resolver state is also used for the
+.BR gethostby *
+family of functions, which means that for example
+.B gethostbyname_r
+is fully thread-safe and re-entrant.
+.PP
+The traditional
+.BR res_ *
+interfaces, however, use a single resolver state and are
+still thread-unsafe.
+The resolver state is the same resolver state that is used
+for the initial ("main") thread.
+.PP
+This has the following consequences for existing binaries and source
+code:
+.IP * 3
+Single-threaded programs work as they always did.
+.IP *
+Multi-threaded programs that use the traditional resolver interfaces
+in the "main" thread continue to work, except that they no longer see
+any changes in the global resolver state caused by calls to, for example,
+.BR gethostbyname ()
+in other threads.
+.IP *
+Multi-threaded programs built against glibc versions before 2.1.3 that
+use the traditional resolver interfaces in more than one thread will
+be just as buggy as before (there are no problems as long as they use
+proper locking).
+If you recompile these programs, manipulating the
+.I _res
+structure in threads other than the "main" thread will appear to have
+no effect, though.
+.IP *
+In multi-threaded programs that manipulate the _res structure, calls to
+functions like
+.BR gethostbyname ()
+in threads other than the "main" thread won't be influenced by the those
+changes any more.
+So if you set RES_USE_INET6, a call to
+.BR gethostbyname ()
+won't return any IPv6 hosts any more.
+If you recompile such programs, manipulating the _res structure will
+affect the thread in which you do so instead of the "main" thread.
+.PP
+It is recommended to use the thread-safe interfaces in new code
+unless compatibility with older systems is needed.
+.SH SEE ALSO
+.BR resolver (3),
+.BR errno (3),
+.BR gethostbyname (3),
+.BR getaddrinfo (3)
-- 
1.7.6

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
