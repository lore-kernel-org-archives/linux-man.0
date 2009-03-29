From: Roland McGrath <roland-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: ptrace(PTRACE_SYSCALL) and data field
Date: Sun, 29 Mar 2009 16:34:02 -0700 (PDT)
Message-ID: <20090329233402.9C695FC2A8@magilla.sf.frob.com>
References: <200903172346.32372.vapier@gentoo.org>
	<cfd18e0f0903291500s42eb323nd0d9ab8c1f7c4dbc@mail.gmail.com>
	<20090329223508.4521DFC2A8@magilla.sf.frob.com>
	<cfd18e0f0903291547s75749b01icbf99b6eab335cce@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: Michael Kerrisk's message of  Monday, 30 March 2009 11:47:18 +1300 <cfd18e0f0903291547s75749b01icbf99b6eab335cce-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

> On Mon, Mar 30, 2009 at 11:35 AM, Roland McGrath <roland-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> wrote:
> > All of the "resuming" ptracer requests treat the data argument the same.
> > Those are PTRACE_CONT, PTRACE_SYSCALL, PTRACE_*STEP, PTRACE_SYSEMU*.
> > The data argument is either 0 or a signal number.
> > The addr argument is ignored by all these.
> 
> Thanks for jumping in Roland.
> 
> So, for PTRACE_SYSCALL, the sameantics are like PTRACE_CONT, that is,
> it is interpreted as a signal to be sent to the child.  Right?

For all those requests, yes.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
