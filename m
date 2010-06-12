From: Michael Kerrisk <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: [PATCH] Fix ppoll example
Date: Sat, 12 Jun 2010 17:19:01 +0200
Message-ID: <AANLkTimHnSfMtcsuG8lJ-MTLeMCA3f9XQkL26bEdth1F@mail.gmail.com>
References: <20091227004007.GA8638@basil.fritz.box> <20091227004422.GA8673@basil.fritz.box>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20091227004422.GA8673-u0/ZJuX+froe6aEkudXLsA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andi Kleen <andi-Vw/NltI1exuRpAAqCnN02g@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi Andi,

On Sun, Dec 27, 2009 at 2:44 AM, Andi Kleen <andi-Vw/NltI1exuRpAAqCnN02g@public.gmane.org> wrote=
:
> On Sun, Dec 27, 2009 at 01:40:07AM +0100, Andi Kleen wrote:
>>
>> The ppoll replacement example gets the timeout argument
>> wrong. Fix that.
>
> Sorry, the first version was still wrong. This one
> should be correct.
>
> --- man-pages-3.23/man2/poll.2 =A02009-09-30 03:36:44.000000000 +0200
> +++ man-pages-3.23-hacked/man2/poll.2 =A0 2009-12-27 01:43:31.0000000=
00 +0100
> @@ -27,6 +27,7 @@
> =A0.\" 2006-03-13, mtk, Added ppoll() + various other rewordings
> =A0.\" 2006-07-01, mtk, Added POLLRDHUP + various other wording and
> =A0.\" =A0 =A0formatting changes.
> +.\" 2009-12, ak, Fix ppoll example.
> =A0.\"
> =A0.TH POLL 2 2009-09-15 "Linux" "Linux Programmer's Manual"
> =A0.SH NAME
> @@ -193,7 +194,7 @@
> =A0call:
> =A0.nf
>
> - =A0 =A0ready =3D ppoll(&fds, nfds, timeout, &sigmask);
> + =A0 =A0ready =3D ppoll(&fds, nfds, ts, &sigmask);
>
> =A0.fi
> =A0is equivalent to
> @@ -204,7 +205,7 @@
> =A0 =A0 sigset_t origmask;
>
> =A0 =A0 sigprocmask(SIG_SETMASK, &sigmask, &origmask);
> - =A0 =A0ready =3D poll(&fds, nfds, timeout);
> + =A0 =A0ready =3D poll(&fds, nfds, ts ? ts.tv_sec : -1);
> =A0 =A0 sigprocmask(SIG_SETMASK, &origmask, NULL);
> =A0.fi
> =A0.PP

Thanks for spotting the problem, but this version isn't correct
either. poll() use an int with milliseconds, ppoll() uses a struct
with seconds + nanoseconds.

Does the following look okay to you? (It also includes a name change
for the timeout argument of ppoll() to make the distinction clearer in
the text.

Change for man-pages-3.25.

Cheers,

Michael

--- a/man2/poll.2
+++ b/man2/poll.2
@@ -28,7 +28,7 @@
 .\" 2006-07-01, mtk, Added POLLRDHUP + various other wording and
 .\"    formatting changes.
 .\"
-.TH POLL 2 2009-09-15 "Linux" "Linux Programmer's Manual"
+.TH POLL 2 2010-06-12 "Linux" "Linux Programmer's Manual"
 .SH NAME
 poll, ppoll \- wait for some event on a file descriptor
 .SH SYNOPSIS
@@ -41,7 +41,7 @@ poll, ppoll \- wait for some event on a file descript=
or
 .B #include <poll.h>
 .sp
 .BI "int ppoll(struct pollfd *" fds ", nfds_t " nfds ", "
-.BI "        const struct timespec *" timeout ", const sigset_t *" sig=
mask );
+.BI "        const struct timespec *" timeout_ts ", const sigset_t *"
sigmask );
 .fi
 .SH DESCRIPTION
 .BR poll ()
@@ -186,14 +186,13 @@ like
 allows an application to safely wait until either a file descriptor
 becomes ready or until a signal is caught.
 .PP
-Other than the difference in the
-.I timeout
-argument, the following
+Other than the difference in the precision of the
+timeout argument, the following
 .BR ppoll ()
 call:
 .nf

-    ready =3D ppoll(&fds, nfds, timeout, &sigmask);
+    ready =3D ppoll(&fds, nfds, timeout_ts, &sigmask);

 .fi
 is equivalent to
@@ -202,7 +201,10 @@ executing the following calls:
 .nf

     sigset_t origmask;
+    int timeout;

+    timeout =3D (timeout_ts =3D=3D NULL) ? -1 :
+              (timeout_ts.tv_sec * 1000 + timeout_ts.tv_nsec / 1000000=
);
     sigprocmask(SIG_SETMASK, &sigmask, &origmask);
     ready =3D poll(&fds, nfds, timeout);
     sigprocmask(SIG_SETMASK, &origmask, NULL);
@@ -222,12 +224,10 @@ no signal mask manipulation is performed
 .BR ppoll ()
 differs from
 .BR poll ()
-only in the precision of the
-.I timeout
-argument).
+only in the precision of the timeout argument).

 The
-.I timeout
+.I timeout_ts
 argument specifies an upper limit on the amount of time that
 .BR ppoll ()
 will block.
@@ -243,7 +243,7 @@ struct timespec {
 .in

 If
-.I timeout
+.I timeout_ts
 is specified as NULL, then
 .BR ppoll ()
 can block indefinitely.
@@ -304,13 +304,15 @@ is Linux-specific.
 Some implementations define the nonstandard constant
 .B INFTIM
 with the value \-1 for use as a
-.IR timeout .
+.IR timeout
+for
+.BR poll ()..
 This constant is not provided in glibc.
 .SS "Linux Notes"
 The Linux
 .BR ppoll ()
 system call modifies its
-.I timeout
+.I timeout_ts
 argument.
 However, the glibc wrapper function hides this behavior
 by using a local variable for the timeout argument that
@@ -318,7 +320,7 @@ is passed to the system call.
 Thus, the glibc
 .BR ppoll ()
 function does not modify its
-.I timeout
+.I timeout_ts
 argument.
 .SH BUGS
 See the discussion of spurious readiness notifications under the
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
