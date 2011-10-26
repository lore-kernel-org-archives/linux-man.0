From: Eric Paris <eparis-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: fanotify_init(2) and fanotify_mark(2) man pages
Date: Wed, 26 Oct 2011 10:46:52 -0400
Message-ID: <1319640412.3280.33.camel@localhost>
References: <4E9BFAA4.3010907@atsec.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4E9BFAA4.3010907-fwYZOkdEjagAvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephan Mueller <stephan.mueller-fwYZOkdEjagAvxtiuMwx3w@public.gmane.org>
Cc: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On Mon, 2011-10-17 at 11:51 +0200, Stephan Mueller wrote:
> Hi,
> 
> please find attached the man pages for the system calls of fanotify_init
> and fanotify_mark.
> 
> The creator of fanotify, Eric, has generally blessed the man pages.
> 
> Though, there is one area which should warrant another review: the
> struct fanotify_response discussion, in particular I am not sure about
> the explanation of the fd member variable.

File Descriptor Usage:
"returns all events the kernel collected which will fit in the given
buffer"

The O_NONBLOCK flag will still return multiple events if they exist, but
it will return EAGAIN if no events exist.

writing to the fd only makes sense in FAN_CLASS_CONTENT or
FAN_CLASS_PRE_CONTENT.  In one of those classes one can add a mark which
requires permissions handling.  If upon reading the fanotify fd an event
for FAN_*_PERM is returned userspace should write back to the fanotify
fd using the struck you show.  The fd should be the fd supplied in the
original event, the response should be allow/deny.

FAN_UNLIMITED_MARKS requires CAP_SYS_ADMIN

"Note  that  only  one  of the FAN_CLASS_* priority levels shall be
selected for all groups"   That not quite right.  Only one of the
FAN_CLASS_* priority levels may be selected per group.  2 calls to
fanotify_init() would result in 2 groups and each could have a different
priority.

If I were to write an example program (or more likely trim my example
program, would that be appreciated here?)

-Eric

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
