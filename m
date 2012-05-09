From: Pedro Alves <palves-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: ptrace.2: PTRACE_KILL needs a stopped process too
Date: Wed, 09 May 2012 20:35:34 +0100
Message-ID: <4FAAC706.6000808@redhat.com>
References: <20091216004533.22261.qmail@kosh.dhis.org> <CAKgNAkhtu8d0NKcTwWyCA8qWgz8Lag+GcpEE1=YMVe_Nh8XJ9Q@mail.gmail.com> <20120422200459.GA7519@redhat.com> <201205091109.35637.vapier@gentoo.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <201205091109.35637.vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Cc: Oleg Nesterov <oleg-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, pacman-ptgZXYu0fikgsBAKwltoeQ@public.gmane.org, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, lkml <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Denys Vlasenko <dvlasenk-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Tejun Heo <tj-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Jan Kratochvil <jan.kratochvil-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On 05/09/2012 04:09 PM, Mike Frysinger wrote:

> probably not that big of a deal, but the reason i like using 
> ptrace(PTRACE_KILL) over a raw kill() is that you are less likely to kill the 
> wrong process by accident.  maybe not that big of a deal in practice though.


And you can do tgkill instead.  It was specifically invented to handle the
reuse case.

-- 
Pedro Alves
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
