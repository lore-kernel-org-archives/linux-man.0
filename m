From: Michael Kerrisk <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: ptrace(PTRACE_SYSCALL) and data field
Date: Mon, 30 Mar 2009 11:47:18 +1300
Message-ID: <cfd18e0f0903291547s75749b01icbf99b6eab335cce@mail.gmail.com>
References: <200903172346.32372.vapier@gentoo.org>
	 <cfd18e0f0903291500s42eb323nd0d9ab8c1f7c4dbc@mail.gmail.com>
	 <20090329223508.4521DFC2A8@magilla.sf.frob.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20090329223508.4521DFC2A8-nL1rrgvulkc2UH6IwYuUx0EOCMrvLtNR@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Roland McGrath <roland-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Mon, Mar 30, 2009 at 11:35 AM, Roland McGrath <roland-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> wrote:
> All of the "resuming" ptracer requests treat the data argument the same.
> Those are PTRACE_CONT, PTRACE_SYSCALL, PTRACE_*STEP, PTRACE_SYSEMU*.
> The data argument is either 0 or a signal number.
> The addr argument is ignored by all these.

Thanks for jumping in Roland.

So, for PTRACE_SYSCALL, the sameantics are like PTRACE_CONT, that is,
it is interpreted as a signal to be sent to the child.  Right?

Cheers,

Michael

-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
git://git.kernel.org/pub/scm/docs/man-pages/man-pages.git
man-pages online: http://www.kernel.org/doc/man-pages/online_pages.html
Found a bug? http://www.kernel.org/doc/man-pages/reporting_bugs.html
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
