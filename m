From: Eric Wong <normalperson-rMlxZR9MS24@public.gmane.org>
Subject: Re: suggestion for improvement to vfork() man page
Date: Tue, 7 Feb 2012 23:29:18 +0000
Message-ID: <20120207232918.GA29052@dcvr.yhbt.net>
References: <6.2.5.6.2.20120207164707.03c1f410@binnacle.cx>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <6.2.5.6.2.20120207164707.03c1f410-Utvwg/EOxnhfq8cQ1yknNg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: starlight-Utvwg/EOxnhfq8cQ1yknNg@public.gmane.org
Cc: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

starlight-Utvwg/EOxnhfq8cQ1yknNg@public.gmane.org wrote:
> +(However, on such systems,
> +the preferred standard way of accomplishing the same result is to use
> +.BR posix_spawn (3).)
> 
> I'm not sure I agree on this.  Linux posix_spawn()
> calls fork() which for us is undesirable on MMU systems
> due to the cost of copying large page tables.

posix_spawn() under glibc will try to automatically use vfork() instead
of fork() in some cases.  There is also a GNU-specific
POSIX_SPAWN_USEVFORK flag to force vfork() usage, too.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
