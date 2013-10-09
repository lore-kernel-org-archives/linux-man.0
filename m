From: Andrew Daviel <advax-K9O0zq5Arhf3fQ9qLvQP4Q@public.gmane.org>
Subject: flock(2) and NFS
Date: Tue, 8 Oct 2013 17:56:17 -0700 (PDT)
Message-ID: <alpine.LRH.2.02.1310081747490.23014@andrew.triumf.ca>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; format=flowed; charset=US-ASCII
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org


I'm not sure whether this is me being stupid, or a real issue.
On my CentOS 6 system the manpage for flock()2 states that it does not 
work on NFS. When I check for the latest version online, it is the same.

Experimentally, the flock shell command does work on an NFS3 mounted 
volume in (at least) CentOS 5 with 2.6.18.

In http://nfs.sourceforge.net/ I find
"The NFS client in 2.6.12 provides support for flock()/BSD locks on NFS 
files by emulating the BSD-style locks in terms of POSIX byte range 
locks."

In fs/nfs/file.c I find "We're simulating flock() locks using posix locks 
on the server"

That seems to imply to me that flock() does in fact work on Linux since 
2.6.12, at least as far as a programmer is concerned.



http://man7.org/linux/man-pages/man2/flock.2.html

NOTES
        flock() does not lock files over NFS.  Use fcntl(2) instead: that
        does work over NFS, given a sufficiently recent version of Linux and
        a server which supports locking.

-- 
Andrew Daviel, TRIUMF, Canada
Tel. +1 (604) 222-7376  (Pacific Time)
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
