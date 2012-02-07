From: starlight-Utvwg/EOxnhfq8cQ1yknNg@public.gmane.org
Subject: Re: suggestion for improvement to vfork() man page
Date: Tue, 07 Feb 2012 16:50:11 -0500
Message-ID: <6.2.5.6.2.20120207164707.03c1f410@binnacle.cx>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Cc: starlight-Utvwg/EOxnhfq8cQ1yknNg@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

+(However, on such systems,
+the preferred standard way of accomplishing the same result is to use
+.BR posix_spawn (3).)

I'm not sure I agree on this.  Linux posix_spawn()
calls fork() which for us is undesirable on MMU systems
due to the cost of copying large page tables.

To the extent that we would add support for non-MMU
platforms, we would stick with direct invocation of
vfork() even if the posix_spawn() on those targets
used vfork() instead of fork().  One less #ifdef,
of which we have far too many as it is.

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
