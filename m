From: bugzilla-daemon-590EEB7GvNiWaY/ihj7yzEB+6BGkLq7r@public.gmane.org
Subject: [Bug 71061] New: msgctl(2) manpage : put back a condition of EPERM
 error code forgotten
Date: Mon, 24 Feb 2014 08:02:17 +0000
Message-ID: <bug-71061-11311@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D71061

            Bug ID: 71061
           Summary: msgctl(2) manpage : put back a condition of EPERM
                    error code forgotten
           Product: Documentation
           Version: unspecified
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P1
         Component: man-pages
          Assignee: documentation_man-pages-ztI5WcYan/vQLgFONoPN62D2FQJk+8+b@public.gmane.org
          Reporter: fboiteux-N+jn5RlININWk0Htik3J/w@public.gmane.org
        Regression: No

Hello,

  I've noticed in the msgctl(2) manpage that a condition to get an EPER=
M error
code was dropped in the past :=C2=A0it's about trying to modify the siz=
e of a
message queue (msg_qbytes) larger than the max size set in kernel (look=
 at
/proc/sys/kernel/msgmnb).

In a (very old) manpage of a Debian Woody 3.0 (!), we could read :

       EPERM      The argument cmd has value IPC_SET or IPC_RMID but th=
e
calling process effective user-ID has insufficient privileges to
                  execute  the  command.   Note this is also the case o=
f a non
super-user process trying to increase the msg_qbytes value
                  beyond the value specified by the system parameter MS=
GMNB.


thereas on later pages (on my Debian Wheezy 7.4, but also in current ve=
rsion of
kernel manpages), we only have :

       EPERM  The argument cmd has the value IPC_SET or IPC_RMID, but t=
he
effective user ID of the calling process is not the creator  (as  found=
  in
              msg_perm.cuid) or the owner (as found in msg_perm.uid) of=
 the
message queue, and the process is not privileged (Linux: it does not ha=
ve
              the CAP_SYS_ADMIN capability).


Could you put back in the man page a sentence like : 'Note this is also=
 the
case of a non super-user process trying to increase the msg_qbytes valu=
e
                  beyond the value specified by the system parameter MS=
GMNB.'


      Thanks,
            Fr=C3=A9d=C3=A9ric.

--=20
You are receiving this mail because:
You are watching the assignee of the bug.--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
