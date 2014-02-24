From: bugzilla-daemon-590EEB7GvNiWaY/ihj7yzEB+6BGkLq7r@public.gmane.org
Subject: [Bug 71061] msgctl(2) manpage : put back a condition of EPERM error
 code forgotten
Date: Mon, 24 Feb 2014 08:52:00 +0000
Message-ID: <bug-71061-11311-WikqUgpQoA@https.bugzilla.kernel.org/>
References: <bug-71061-11311@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <bug-71061-11311-3bo0kxnWaOQUvHkbgXJLS5sdmw4N0Rt+2LY78lusg7I@public.gmane.org/>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D71061

Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> changed:

           What    |Removed                     |Added
-----------------------------------------------------------------------=
-----
             Status|NEW                         |RESOLVED
                 CC|                            |mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
         Resolution|---                         |CODE_FIX

--- Comment #1 from Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
(In reply to Fr=C3=A9d=C3=A9ric Boiteux from comment #0)
> Hello,
>=20
>   I've noticed in the msgctl(2) manpage that a condition to get an EP=
ERM
> error code was dropped in the past :=C2=A0it's about trying to modify=
 the size of
> a message queue (msg_qbytes) larger than the max size set in kernel (=
look at
> /proc/sys/kernel/msgmnb).
>=20
> In a (very old) manpage of a Debian Woody 3.0 (!), we could read :
>=20
>        EPERM      The argument cmd has value IPC_SET or IPC_RMID but =
the
> calling process effective user-ID has insufficient privileges to
>                   execute  the  command.   Note this is also the case=
 of a
> non super-user process trying to increase the msg_qbytes value
>                   beyond the value specified by the system parameter =
MSGMNB.
>=20
>=20
> thereas on later pages (on my Debian Wheezy 7.4, but also in current =
version
> of kernel manpages), we only have :
>=20
>        EPERM  The argument cmd has the value IPC_SET or IPC_RMID, but=
 the
> effective user ID of the calling process is not the creator  (as  fou=
nd  in
>               msg_perm.cuid) or the owner (as found in msg_perm.uid) =
of the
> message queue, and the process is not privileged (Linux: it does not =
have
>               the CAP_SYS_ADMIN capability).
>=20
>=20
> Could you put back in the man page a sentence like : 'Note this is al=
so the
> case of a non super-user process trying to increase the msg_qbytes va=
lue
>                   beyond the value specified by the system parameter =
MSGMNB.'
>=20

Yes, it is puzzling that that text was dropped. It was done back in 1.5=
1,
before the days of version control or mailing lists for man-pages, so I=
 can't
divine the reason. Nevertheless, elsewhere in the page, it notes that a
capability is required to raise this value above MSGMNB. (And there was=
 a typo
in that text, where it mentioned CAP_IPC_RESOURCE; should be CAP_SYS_RE=
SOURCE;
fixed now). So, obviously, a fix is required. I applied the patch below=
=2E Thanks
for your report.

diff --git a/man2/msgctl.2 b/man2/msgctl.2
index e092fcb..ea39e10 100644
--- a/man2/msgctl.2
+++ b/man2/msgctl.2
@@ -311,6 +311,17 @@ of the message queue,
 and the process is not privileged (Linux: it does not have the
 .B CAP_SYS_ADMIN
 capability).
+.TP
+.B EPERM
+An attempt
+.RB ( IPC_SET )
+was made to increase
+.I msg_qbytes
+beyond the system parameter
+.BR MSGMNB ,
+but the caller is not privileged (Linux: does not have the
+.B CAP_SYS_RESOURCE
+capability).
 .SH CONFORMING TO
 SVr4, POSIX.1-2001.
 .\" SVID does not document the EIDRM error condition.

--=20
You are receiving this mail because:
You are watching the assignee of the bug.--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
