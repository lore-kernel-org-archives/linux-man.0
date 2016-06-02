From: Nikos Mavrogiannopoulos <nmav-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH] assert.3: improved description
Date: Thu, 02 Jun 2016 11:07:31 +0200
Message-ID: <1464858451.5804.3.camel@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Removed text referring to text not being helpful to users. Provide
the error text instead to allow the reader to determine whether it is h=
elpful.
Recommend against using NDEBUG for programs to excibit deterministic be=
havior.
Moved description ahead of recommendations.

Signed-off-by: Nikos Mavrogiannopoulos <nmav-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
---
=C2=A0man3/assert.3 | 29 +++++++++++++++--------------
=C2=A01 file changed, 15 insertions(+), 14 deletions(-)

diff --git a/man3/assert.3 b/man3/assert.3
index 7cf7328..1b85a68 100644
--- a/man3/assert.3
+++ b/man3/assert.3
@@ -24,6 +24,7 @@
=C2=A0.\"
=C2=A0.\" Modified Sat Jul 24 21:42:42 1993 by Rik Faith <faith-tsp8moGkja0@public.gmane.org=
edu>
=C2=A0.\" Modified Tue Oct 22 23:44:11 1996 by Eric S. Raymond <esr@thy=
rsus.com>
+.\" Modified Thu Jun=C2=A0=C2=A02 23:44:11 2016 by Nikos Mavrogiannopo=
ulos <nmav-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
=C2=A0.TH ASSERT 3=C2=A0=C2=A02015-08-08 "GNU" "Linux Programmer's Manu=
al"
=C2=A0.SH NAME
=C2=A0assert \- abort the program if assertion is false
@@ -34,26 +35,26 @@ assert \- abort the program if assertion is false
=C2=A0.BI "void assert(scalar " expression );
=C2=A0.fi
=C2=A0.SH DESCRIPTION
+This macro can help programmers find bugs in their programs, or handle=
 exceptional cases
+via a crash that will produce limited debugging output. The function w=
ill print an
+error message to standard error, e.g., "assertion failed in file foo.c=
, function do_bar(), line 1287"
+and terminate the program by calling
+.BR abort (3)
+if
+.I expression
+is false (i.e., compares equal to zero).
+.LP
=C2=A0If the macro
=C2=A0.B NDEBUG
-was defined at the moment
+is defined at the moment
=C2=A0.I <assert.h>
=C2=A0was last included, the macro
=C2=A0.BR assert ()
-generates no code, and hence does nothing at all.
-Otherwise, the macro
+generates no code, and hence does nothing at all. It is not recommende=
d to define=C2=A0
+.B NDEBUG
+if using
=C2=A0.BR assert ()
-prints an error message to standard error and terminates the program
-by calling
-.BR abort (3)
-if
-.I expression
-is false (i.e., compares equal to zero).
-.LP
-The purpose of this macro is to help programmers find bugs in
-their programs.
-The message "assertion failed in file foo.c, function
-do_bar(), line 1287" is of no help at all to a user.
+to detect error conditions since the software may behave non-determini=
stically.
=C2=A0.SH RETURN VALUE
=C2=A0No value is returned.
=C2=A0.SH ATTRIBUTES
--=C2=A0
2.5.5

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
