From: Pedro Alves <palves-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: ptrace.2: PTRACE_KILL needs a stopped process too
Date: Wed, 09 May 2012 23:16:05 +0100
Message-ID: <4FAAECA5.8050606@redhat.com>
References: <20091216004533.22261.qmail@kosh.dhis.org> <4FAAC706.6000808@redhat.com> <20120509201219.GA32051@redhat.com> <201205091241.59060.vapier@gentoo.org> <20120509211429.GA2455@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20120509211429.GA2455-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Oleg Nesterov <oleg-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>, "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, pacman-ptgZXYu0fikgsBAKwltoeQ@public.gmane.org, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, lkml <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Denys Vlasenko <dvlasenk-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Tejun Heo <tj-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Jan Kratochvil <jan.kratochvil-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On 05/09/2012 10:14 PM, Oleg Nesterov wrote:

>> i like to assume that my code isn't going to be bug free, so the more
>> mechanisms i have in place to protect innocent bystanders the better :)
>> -mike
> 
> From this pov PTRACE_KILL is safer, I agree ;)


Yeah, until you trip on that case where it resumes the process
instead of killing it...  At that point, it's useless.

Since I know Mike likes hacking on GDB so much ;-), FYI, this is
exercised by the gdb.base/kill-after-signal.exp test.

-- 
Pedro Alves
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
