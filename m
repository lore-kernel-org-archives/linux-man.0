From: Rich Felker <dalias-8zAoT0mYgF4@public.gmane.org>
Subject: Misleading info in statfs(2) man page
Date: Tue, 12 Aug 2014 11:47:21 -0400
Message-ID: <20140812154721.GA12620@brightrain.aerifal.cx>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: "linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

The man page for statfs(2) is using macros which are glibc
implementation internals (not part of the public interface) for
defining struct statfs. This leads programmers to believe they should
use these macros in applications (a cast to __SWORD_TYPE has recently
appeared in util-linux; see link [1] below) and __SWORD_TYPE isn't
even the correct type on glibc/x32.

Note that glibc also has the signedness of these members wrong; in the
kernel, they're rightfully unsigned for 32-bit and only signed on
64-bit (where it doesn't matter). musl does not have this mismatch; we
use unsigned types where they make sense (e.g. storing unsigned
filesystem magic numbers that don't fit in signed 32-bit).

Since the types of these fields are such a mess, I think the man page
should refrain from documenting specific types, and should include
advice on safe usage, including how to safely compare f_type -- on
glibc, the value will wrongly be negative for many filesystems, and
although default integer promotions will fix this for direct
comparison with the fs magic constants, the safe way to use f_type
seems to be explicitly casting it to uint32_t.

Rich



[1] https://git.kernel.org/cgit/utils/util-linux/util-linux.git/tree/sys-utils/switch_root.c#n179
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
