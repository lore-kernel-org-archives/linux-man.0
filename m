From: Roland McGrath <roland-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: ptrace(PTRACE_SYSCALL) and data field
Date: Sun, 29 Mar 2009 17:07:12 -0700 (PDT)
Message-ID: <20090330000712.C0B54FC2A8@magilla.sf.frob.com>
References: <200903172346.32372.vapier@gentoo.org>
	<cfd18e0f0903291500s42eb323nd0d9ab8c1f7c4dbc@mail.gmail.com>
	<20090329223508.4521DFC2A8@magilla.sf.frob.com>
	<cfd18e0f0903291547s75749b01icbf99b6eab335cce@mail.gmail.com>
	<20090329233402.9C695FC2A8@magilla.sf.frob.com>
	<cfd18e0f0903291654uea58687x5fb16d0b794e69cf@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: Michael Kerrisk's message of  Monday, 30 March 2009 12:54:44 +1300 <cfd18e0f0903291654uea58687x5fb16d0b794e69cf-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

> Hmmm.  The existing man page includes this text:
> 
>        PTRACE_SYSEMU, PTRACE_SYSEMU_SINGLESTEP (since Linux 2.6.14)
>               ...
>               (addr and data are ignored; ...
> 
> which according to what you've said (and also according to my reading
> of the source), is wrong.  Correct?

Yes, those also treat the signal argument like PTRACE_CONT et al.


Thanks,
Roland
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
