From: Josh Triplett <josh-iaAMLnmF4UmaiuxdJuQwMA@public.gmane.org>
Subject: poll(2) and select(2) should document spurious EAGAIN for portable
 programs
Date: Sun, 23 Aug 2015 00:32:12 -0700
Message-ID: <20150823073212.GA20753@x>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On some systems (reported by Jeremy Sequoia as occurring on Darwin),
poll(2) and select(2) can spuriously return EAGAIN if they fail to
allocate kernel-internal resources, rather than ENOMEM as Linux does.
The spec allows this for poll(2):
http://pubs.opengroup.org/onlinepubs/9699919799/functions/poll.html says
poll may return EAGAIN if "The allocation of internal data structures
failed but a subsequent request may succeed."  The spec for select(2)
at http://pubs.opengroup.org/onlinepubs/9699919799/functions/select.html
doesn't specify EAGAIN, but apparently Darwin can return it in that case
too.

I'd suggest the following text for poll(2)'s NOTES section:

Some other UNIX systems can return EAGAIN if they fail to allocate
kernel-internal resources, rather than ENOMEM as Linux does.  The Single
Unix Specification allows this behavior for poll(2).  Portable programs
may wish to check for EAGAIN and loop, just as with EINTR.


And the following text for select(2)'s NOTES section:

Some other UNIX systems can return EAGAIN if they fail to allocate
kernel-internal resources, rather than ENOMEM as Linux does.  The Single
Unix Specification allows this behavior for poll(2), but not for
select(2); nonetheless, some systems do return EAGAIN from select(2).
Portable programs may wish to check for EAGAIN and loop, just as with
EINTR.


- Josh Triplett
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
