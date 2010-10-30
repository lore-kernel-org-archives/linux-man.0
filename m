From: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: small improvement for mlock.2
Date: Sat, 30 Oct 2010 07:29:58 +0200
Message-ID: <AANLkTi=ScjFHuQ-DkMvkPXtush1s0ohrnzXjMWU7hfBT@mail.gmail.com>
References: <20101026111406.456fec6d@keeper.home.local>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=KOI8-R
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20101026111406.456fec6d-CpVCSV+zb/Ftei/ch0jEm2ZHpeb/A1Y/@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Yuri Kozlov <yuray-YPGtXv8QU+00kPtPmH8OGQ@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Yuri,

On Tue, Oct 26, 2010 at 9:14 AM, Yuri Kozlov <yuray-YPGtXv8QU+00kPtPmH8OGQ@public.gmane.org> wrote:
> Hello.
> """
> The VmLck field of the Linux-specific /proc/PID/status file shows how many
> kilobytes of memory the calling process has locked using mlock(),
> mlockall(), shmctl(2) SHM_LOCK, and mmap(2) MAP_LOCKED.
> """"
>
> Not for "calling process", but for process with PID?

Thanks. I applied:

@@ -288,7 +288,9 @@ The
 .I VmLck
 field of the Linux-specific
 .I /proc/PID/status
-file shows how many kilobytes of memory the calling process has locked using
+file shows how many kilobytes of memory the process with ID
+.I PID
+has locked using
 .BR mlock (),
 .BR mlockall (),
 .BR shmctl (2)

Cheers,

Michael


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
