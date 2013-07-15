From: Cyrill Gorcunov <gorcunov-GEFAQzZX7r8dnm+yROfE0A@public.gmane.org>
Subject: [RFC 0/2] proc.5: Add fresh VmFlags and fdinfo output
Date: Tue, 16 Jul 2013 01:00:27 +0400
Message-ID: <1373922029-1923-1-git-send-email-gorcunov@openvz.org>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Cyrill Gorcunov <gorcunov-GEFAQzZX7r8dnm+yROfE0A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

fdinfo output is not yet covered well since it's a way more tricker
than anything else, so I desided to start with small steps.

Please review and comment.

Cyrill Gorcunov (2):
  proc.5: Add description of VmFlags field
  proc.5: Start describing /proc/fdinfo format

 man5/proc.5 | 82 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 82 insertions(+)

-- 
1.8.1.4

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
