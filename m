From: Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
Subject: munmap, msync: synchronization
Date: Sun, 20 Apr 2014 12:28:40 +0200
Message-ID: <5353A158.9050009@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Michael,

when analyzing how the fanotify API interacts with mmap(2) I stumbled 
over the following issues in the manpages:


The manpage of msync(2) says:
"msync() flushes changes made to the in-core copy of a file that was 
mapped into memory using mmap(2) back to disk."

"back to disk" implies that the file system is forced to actually write 
to the hard disk, somewhat equivalent to invoking sync(1). Is that 
guaranteed for all file systems?

Not all file systems are necessarily disk based (e.g. davfs, tmpfs).

So shouldn't we write:
"... back to the file system."

http://pubs.opengroup.org/onlinepubs/007904875/functions/msync.html
says
"... to permanent storage locations, if any,"


The manpage of munmap(2) leaves it unclear, if copying back to the 
filesystem is synchronous or asynchronous.
This bit of information is important, because, if munmap is 
asynchronous, applications might want to call msync(,,MS_SYNC), before 
calling munmap. If munmap is synchronous it might block until the file 
system responds (think of waiting for a tape to be loaded, or a webdav 
server to respond).


What happens to an unfinished prior asynchronous update by 
mmap(,,MS_ASYNC) when munmap is called?


Will munmap "invalidate other mappings of the same file (so that they 
can be updated with the fresh values just written)" like 
msync(,,MS_INVALIDATE) does?


Best regards

Heinrich Schuchardt
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
