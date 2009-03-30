From: Michael Kerrisk <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: ptrace(PTRACE_SYSCALL) and data field
Date: Mon, 30 Mar 2009 13:31:34 +1300
Message-ID: <cfd18e0f0903291731t2e10e89bx78c86b22607d7544@mail.gmail.com>
References: <200903172346.32372.vapier@gentoo.org>
	 <cfd18e0f0903291500s42eb323nd0d9ab8c1f7c4dbc@mail.gmail.com>
	 <20090329223508.4521DFC2A8@magilla.sf.frob.com>
	 <cfd18e0f0903291547s75749b01icbf99b6eab335cce@mail.gmail.com>
	 <20090329233402.9C695FC2A8@magilla.sf.frob.com>
	 <cfd18e0f0903291654uea58687x5fb16d0b794e69cf@mail.gmail.com>
	 <20090330000712.C0B54FC2A8@magilla.sf.frob.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20090330000712.C0B54FC2A8-nL1rrgvulkc2UH6IwYuUx0EOCMrvLtNR@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Roland McGrath <roland-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Mon, Mar 30, 2009 at 1:07 PM, Roland McGrath <roland-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> wro=
te:
>> Hmmm. =A0The existing man page includes this text:
>>
>> =A0 =A0 =A0 =A0PTRACE_SYSEMU, PTRACE_SYSEMU_SINGLESTEP (since Linux =
2.6.14)
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 ...
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 (addr and data are ignored; ...
>>
>> which according to what you've said (and also according to my readin=
g
>> of the source), is wrong. =A0Correct?
>
> Yes, those also treat the signal argument like PTRACE_CONT et al.

Thanks!


--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
git://git.kernel.org/pub/scm/docs/man-pages/man-pages.git
man-pages online: http://www.kernel.org/doc/man-pages/online_pages.html
=46ound a bug? http://www.kernel.org/doc/man-pages/reporting_bugs.html
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
