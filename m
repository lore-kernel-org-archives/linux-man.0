From: Manfred Schwarb <manfred99-OI3hZJvNYWs@public.gmane.org>
Subject: posix_fadvise(2): mention sync_file_range(2)
Date: Wed, 03 Mar 2010 15:16:08 +0100
Message-ID: <4B8E6F28.2020109@gmx.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi,

for POSIX_FADV_DONTNEED, syncing with fsync(2) or fdatasync(2) is recommended in
the man page of posix_fadvise(2).
However, for this task sync_file_range(2) is probably best suited, as it 
is fast and has the same granularity as posix_fadvise(2).
akpm also used sync_file_range(2) for his user space helpers:
http://userweb.kernel.org/~akpm/pagecache-management/pagecache-management/pagecache-management.c

So I suggest to add sync_file_range(2) to the list of mentioned sync functions.

Cheers,
Manfred
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
