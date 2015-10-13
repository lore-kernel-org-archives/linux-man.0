From: Lennart Poettering <lennart-mdGvqq1h2p+GdvJs77BJ7Q@public.gmane.org>
Subject: cmsg(3) doesn't mention that memory must be zero-initialized when
 using CMSG_NXTHDR() to construct a cmsg
Date: Tue, 13 Oct 2015 12:54:55 +0200
Message-ID: <20151013105455.GA4208@gardel-login>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, daniel-cYrQPVfZoowdnm+yROfE0A@public.gmane.org, dh.herrmann-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-man@vger.kernel.org

Michael,

http://man7.org/linux/man-pages/man3/cmsg.3.html

currently says this:

       To create ancillary data, first initialize the msg_controllen
       member of the msghdr with the length of the control message
       buffer.  Use CMSG_FIRSTHDR() on the msghdr to get the first
       control message and CMSG_NXTHDR() to get all subsequent ones.
       In each control message, initialize cmsg_len (with CMSG_LEN()),
       the other cmsghdr header fields, and the data portion using
       CMSG_DATA().  Finally, the msg_controllen field of the msghdr
       should be set to the sum of the CMSG_SPACE() of the length of
       all control messages in the buffer.  For more information on
       the msghdr, see recvmsg(2).

This does not mention that the memory that CMSG_NXTHDR() is used on
to construct a cmsg data must be zero-initialized, but that's
apparently the case as the macro verifies the cmsg_len field after
increasing the pointers.

The example at the end of the man page (which constructs a cmsg, but
does not actually use CMSG_NXTHDR) does not initialize the memory to
NUL, hence one would normally assume that NUL-initialization is not
necessary when constructing cmsgs when reading the man page.

We ran into this in systemd:

https://github.com/systemd/systemd/pull/1540
https://github.com/systemd/systemd/issues/1505

I figure the man page should mention the requirement to NUL
initialize. Also, the example should explicitly NUL-initialize the
memory it uses. Even better of course would be an example that
actually uses CMSG_NXTHDR().

Also, while we are at it, I figure the last sentence in the paragraph
should probably mention sendmsg() rather than recvmsg(), as you
construct cmsg yourself only for the fromer, not the latter...

Thanks, and keep up the great work on the man pages!

Lennart

-- 
Lennart Poettering, Red Hat
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
