From: Elie De Brauwer <eliedebrauwer-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] proc.5 addition of /proc/buddyinfo
Date: Sat, 27 Sep 2014 19:35:47 +0200
Message-ID: <1411839348-24345-1-git-send-email-eliedebrauwer@gmail.com>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Elie De Brauwer <eliedebrauwer-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hello Michael,

A patch follows which adds some information on using /proc/buddyinfo to
diagnose memory fragmentation issues. The most popular information 
online on this ticket is in the Redhat deployment guide [1] which actually
got part of the formula wrong [2].
Comments welcome but I mainly tried to focus on the contents on the file
and not on the background of the underlying algorithm and kernel functions
like get_free_pages(), dma_alloc_coherent() and friends.

[1] https://access.redhat.com/documentation/en-US/Red_Hat_Enterprise_Linux/6-Beta/html/Deployment_Guide/s1-proc-topfiles.html#s2-proc-buddyinfo
[2]  https://bugzilla.redhat.com/show_bug.cgi?id=1131498

my 2 cents
E.

Elie De Brauwer (1):
  proc.5: Adding /proc/buddyinfo

 man5/proc.5 | 39 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

-- 
2.1.0

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
