From: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/2] proc.5: Document /proc/[pid]/ns/
Date: Fri, 9 Sep 2011 15:47:51 +0200
Message-ID: <CAKgNAkgP1a2zZpHBOdynUWgC_BtprceLQo-bVN2L+_siCEoLcA@mail.gmail.com>
References: <m1r57gj2sh.fsf@fess.ebiederm.org> <m1lixoj2qq.fsf@fess.ebiederm.org>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <m1lixoj2qq.fsf-+imSwln9KH6u2/kzUuoCbdi2O/JbrIOy@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Eric W. Biederman" <ebiederm-aS9lmoZGLiVWk0Htik3J/w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Eric,

On Mon, May 30, 2011 at 5:17 AM, Eric W. Biederman
<ebiederm-aS9lmoZGLiVWk0Htik3J/w@public.gmane.org> wrote:
>
> Signed-off-by: Eric W. Biederman <ebiederm-aS9lmoZGLiVWk0Htik3J/w@public.gmane.org>
> ---
> =A0man5/proc.5 | =A0 44 ++++++++++++++++++++++++++++++++++++++++++++
> =A01 files changed, 44 insertions(+), 0 deletions(-)
>
> diff --git a/man5/proc.5 b/man5/proc.5
> index 7c5ca4e..7ff82c4 100644
> --- a/man5/proc.5
> +++ b/man5/proc.5
> @@ -476,6 +476,50 @@ information via this field.
> =A0.IP
> =A0This file is only readable by the owner of the process.
> =A0.TP
> +.IR /proc/[pid]/ns/ " (since Linux 3.0)"
> +This is a subdirectory containing one entry for each namespace that
> +supports being manipulated by
> +.BR setns(2).
> +.TP
> +.IR /proc/[pid]/ns/ipc " (since Linux 3.0)"
> +Bind mounting this file to somewhere else in the filesystem keeps
> +the ipc namespace of the process specified by
> +.I pid
> +alive even if all of the processes currently in that ipc namespace e=
xit.
> +
> +Opening this file returnes a file handle for the ipc namespace
> +of the process specified by
> +.I pid,
> +that keeps the ipc namespace alive while the file is open and that c=
an
> +be passed to
> +.BR setns(2).
> +.TP
> +.IR /proc/[pid]/ns/net " (since Linux 3.0)"
> +Bind mounting this file to somewhere else in the filesystem keeps
> +the network namespace of the process specified by
> +.I pid
> +alive even if all of the processes currently in that network namespa=
ce exit.
> +
> +Opening this file returnes a file handle for the network namespace
> +of the process specified by
> +.I pid,
> +that keeps the network namespace alive while the file is open and th=
at can
> +be passed to
> +.BR setns(2).
> +.TP
> +.IR /proc/[pid]/ns/uts " (since Linux 3.0)"
> +Bind mounting this file to somewhere else in the filesystem keeps
> +the uts namespace of the process specified by
> +.I pid
> +alive even if all of the processes currently in that uts namespace e=
xit.
> +
> +Opening this file returnes a file handle for the uts namespace
> +of the process specified by
> +.I pid,
> +that keeps the uts namespace alive while the file is open and that c=
an
> +be passed to
> +.BR setns(2).
> +.TP
> =A0.IR /proc/[pid]/numa_maps " (since Linux 2.6.14)"
> =A0See
> =A0.BR numa (7).

Thanks for that. I tweaked the text somewhat. COuld you review the
following text (actual patch shown further down):

       /proc/[pid]/ns/ (since Linux 3.0)
              This is a subdirectory containing  one  entry  for  each
              namespace  that  supports being manipulated by setns(2).
              For information about namespaces, see clone(2).

       /proc/[pid]/ns/ipc (since Linux 3.0)
              Bind mounting this file (see mount(2)) to somewhere else
              in the filesystem keeps the IPC namespace of the process
              specified by pid alive even if all  processes  currently
              in the namespace terminate.

              Opening  this  file  returns  a  file handle for the IPC
              namespace of the process specified by pid.  As  long  as
              this  file  descriptor  remains  open, the IPC namespace
              will remain alive, even if all processes in  the  names-
              pace  terminate.   The  file descriptor can be passed to
              setns(2).

       /proc/[pid]/ns/net (since Linux 3.0)
              Bind mounting this file (see mount(2)) to somewhere else
              in  the  filesystem  keeps  the network namespace of the
              process specified by pid alive even if all processes  in
              the namespace terminate.

              Opening  this file returns a file handle for the network
              namespace of the process specified by pid.  As  long  as
              this file descriptor remains open, the network namespace
              will remain alive, even if all processes in  the  names-
              pace  terminate.   The  file descriptor can be passed to
              setns(2).

       /proc/[pid]/ns/uts (since Linux 3.0)
              Bind mounting this file (see mount(2)) to somewhere else
              in the filesystem keeps the UTS namespace of the process
              specified by pid alive even if all  processes  currently
              in the namespace terminate.

              Opening  this  file  returns  a  file handle for the UTS
              namespace of the process specified by pid.  As  long  as
              this  file  descriptor  remains  open, the UTS namespace
              will remain alive, even if all processes in  the  names-
              pace  terminate.   The  file descriptor can be passed to
              setns(2).


Cheers,

Michael


--- a/man5/proc.5
+++ b/man5/proc.5
@@ -58,7 +58,7 @@
 .\" to see what information could be imported from that file
 .\" into this file.
 .\"
-.TH PROC 5 2010-10-30 "Linux" "Linux Programmer's Manual"
+.TH PROC 5 2011-09-08 "Linux" "Linux Programmer's Manual"
 .SH NAME
 proc \- process information pseudo-file system
 .SH DESCRIPTION
@@ -476,6 +476,64 @@ information via this field.
 .IP
 This file is only readable by the owner of the process.
 .TP
+.IR /proc/[pid]/ns/ " (since Linux 3.0)"
+This is a subdirectory containing one entry for each namespace that
+supports being manipulated by
+.BR setns (2).
+For information about namespaces, see
+.BR clone (2).
+.TP
+.IR /proc/[pid]/ns/ipc " (since Linux 3.0)"
+Bind mounting this file (see
+.BR mount (2))
+to somewhere else in the filesystem keeps
+the IPC namespace of the process specified by
+.I pid
+alive even if all processes currently in the namespace terminate.
+
+Opening this file returns a file handle for the IPC namespace
+of the process specified by
+.IR pid .
+As long as this file descriptor remains open,
+the IPC namespace will remain alive,
+even if all processes in the namespace terminate.
+The file descriptor can be passed to
+.BR setns (2).
+.TP
+.IR /proc/[pid]/ns/net " (since Linux 3.0)"
+Bind mounting this file (see
+.BR mount (2))
+to somewhere else in the filesystem keeps
+the network namespace of the process specified by
+.I pid
+alive even if all processes in the namespace terminate.
+
+Opening this file returns a file handle for the network namespace
+of the process specified by
+.IR pid .
+As long as this file descriptor remains open,
+the network namespace will remain alive,
+even if all processes in the namespace terminate.
+The file descriptor can be passed to
+.BR setns (2).
+.TP
+.IR /proc/[pid]/ns/uts " (since Linux 3.0)"
+Bind mounting this file (see
+.BR mount (2))
+to somewhere else in the filesystem keeps
+the UTS namespace of the process specified by
+.I pid
+alive even if all processes currently in the namespace terminate.
+
+Opening this file returns a file handle for the UTS namespace
+of the process specified by
+.IR pid .
+As long as this file descriptor remains open,
+the UTS namespace will remain alive,
+even if all processes in the namespace terminate.
+The file descriptor can be passed to
+.BR setns (2).
+.TP
 .IR /proc/[pid]/numa_maps " (since Linux 2.6.14)"
 See
 .BR numa (7).



--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
