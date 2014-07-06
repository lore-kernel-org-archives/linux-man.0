From: Elie De Brauwer <eliedebrauwer-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 0/2] pipe.2 and pipe.7 fixes
Date: Sun,  6 Jul 2014 15:44:09 +0200
Message-ID: <1404654251-8293-1-git-send-email-eliedebrauwer@gmail.com>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Elie De Brauwer <eliedebrauwer-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hello Michael,

Attached are two patches related to the pipe man pages.
 - pipe.2 mentions the use of PIPE_BUF but nowhere is mentioned that it 
should be included via limits.h
 - pipe.7 only talks about static pipe capacity, however proc.5 and fcntl.2
already mention F_SETPIPE_SZ, F_GETPIPE_SZ and /proc/sys/fs/pipe-max-size 
hence I added a reference to fcntl.2.

my 2 cents
E.

Elie De Brauwer (2):
  pipe.2: PIPE_BUF is defined in limits.h
  pipe.7: Add reference that the pipe capacity can be changed.

 man2/pipe.2 |  4 ++++
 man7/pipe.7 | 10 ++++++++++
 2 files changed, 14 insertions(+)

-- 
2.0.0

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
