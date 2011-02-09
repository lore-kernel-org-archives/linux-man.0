From: Stephan Mueller <stephan.mueller-fwYZOkdEjagAvxtiuMwx3w@public.gmane.org>
Subject: rt_tgsigqueueinfo man page
Date: Wed, 9 Feb 2011 14:52:47 +0100
Message-ID: <201102091452.48161.stephan.mueller@atsec.com>
Mime-Version: 1.0
Content-Type: Multipart/Mixed;
  boundary="Boundary-00=_wwpUN1PU4R/rCqn"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

--Boundary-00=_wwpUN1PU4R/rCqn
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi,

please see attached file for the rt_tgsigqueueinfo man page.

This man page was derived from the discussion in 
http://help.lockergnome.com/linux/patch-add-rt_tgsigqueueinfo-syscall-V2--
ftopict495666.html

Ciao
Stephan

--Boundary-00=_wwpUN1PU4R/rCqn
Content-Type: text/plain;
  charset="UTF-8";
  name="rt_tgsigqueueinfo.2"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename="rt_tgsigqueueinfo.2"

.TH RECVMMSG 2 2011-02-09 "Linux" "Linux Programmer's Manual"
.SH NAME
rt_tgsigqueueinfo \- Send signal information to a signal to a thread
.SH SYNOPSIS
.nf
.BI "long sys_rt_tgsigqueueinfo (int " tgid ", int " tid ", int " sig ,
.BI "                            siginfo_t *" uinfo );
.fi
.SH DESCRIPTION
.BR rt_tgsigqueueinfo ()
sends the signal
.I sig
with the information
.I uinfo
to the thread with the thread ID
.I tid
in the thread group
.IR tgid.
By contrast,
.BR rt_sigqueueinfo(2)
can only be used to send a signal info to a process (i.e., thread group)
s a whole, and the signal will be delivered to an arbitrary thread within that
process.
.SH RETURN VALUE
.BR rt_tgsigqueueinfo ()
returns 0 on success.
On error, \-1 is returned, and \fIerrno\fP is set appropriately.
.SH ERRORS
.B EFAULT
An invalid value for
.I uinfo
was specified.
.TP
.B EINVAL
An invalid
.IR tid,
.I TGID
or
.I sig
was specified.
.TP
.B EPERM
Permission denied. For the required permissions,
see
.BR rt_sigqueueinfo(2) .
.B ESRCH
No process with the specified
.I tid
and
.I tgid
exists. 
.SH SEE ALSO
.B rt_sigqueueinfo(2)

--Boundary-00=_wwpUN1PU4R/rCqn--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
