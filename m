From: Elie De Brauwer <eliedebrauwer-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 0/2] proc.5 modification
Date: Thu, 22 Jan 2015 20:21:01 +0100
Message-ID: <1421954463-2853-1-git-send-email-eliedebrauwer@gmail.com>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Elie De Brauwer <eliedebrauwer-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hello Michael,

Two patches related to proc.5:
 - the first patch adds an explanation of /proc/sys/vm/compact_memory
 - the second patch fixes two typo's (of which I'm guilty myself) in the 
   buddyinfo section of proc.5

my 2 cents
E.

Elie De Brauwer (2):
  proc.5: Explain /proc/sys/vm/compact_memory
  proc.5: tfix

 man5/proc.5 | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
