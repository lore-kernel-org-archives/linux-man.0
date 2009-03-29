From: Roland McGrath <roland-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: ptrace(PTRACE_SYSCALL) and data field
Date: Sun, 29 Mar 2009 15:35:08 -0700 (PDT)
Message-ID: <20090329223508.4521DFC2A8@magilla.sf.frob.com>
References: <200903172346.32372.vapier@gentoo.org>
	<cfd18e0f0903291500s42eb323nd0d9ab8c1f7c4dbc@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: Michael Kerrisk's message of  Monday, 30 March 2009 11:00:23 +1300 <cfd18e0f0903291500s42eb323nd0d9ab8c1f7c4dbc-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

All of the "resuming" ptracer requests treat the data argument the same.
Those are PTRACE_CONT, PTRACE_SYSCALL, PTRACE_*STEP, PTRACE_SYSEMU*.
The data argument is either 0 or a signal number.
The addr argument is ignored by all these.


Roland
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
