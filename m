From: starlight-Utvwg/EOxnhfq8cQ1yknNg@public.gmane.org
Subject: suggestion for improvement to vfork() man page
Date: Wed, 18 Jan 2012 22:04:08 -0500
Message-ID: <6.2.5.6.2.20120118214935.03aac8c8@flumedata.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello,

Please consider the following two suggestions for
adjusting the vfork() man page.

In the "Linux Description" section it should be
mentioned that vfork() does not suspend all the
threads in the parent process and only suspends
the thread issuing the call to vfork().  The
wording is misleading and I misunderstood the
semantics for a long time, thinking that all
threads would be suspended.  Had to test it to
determine the actual effect for certain.  In our
case suspending all threads for even a few
microseconds is unacceptable.

Also, it is important to note that the
clone(CLONE_VFORK|CLONE_VM) call invoked by
vfork() makes a separate copy of all process
resources except the address space.  While this is
implied by the statement "the vfork() function has
the same effect as fork(2)," this is easily
overlooked by someone who works with various UNIXs
where this is most definitely not the case.

This matters for situations like ours where a
process with a huge address space, real-time
priority and root privileges must occasionally
spawn scripts that should run at user priority
with user privileges.  Using fork() is expensive
due to the cost of replicating very large page
tables and vfork() is an excellent alternative.
But the subtle difference between Solaris/AIX and
Linux caused us to unnecessarily disable the code
that lowers priority and surrenders root
permission before issuing the exec() call to run
scripts.

Regards

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
