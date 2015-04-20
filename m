From: Vince Weaver <vincent.weaver-e7X0jjDqjFGHXe+LvDLADg@public.gmane.org>
Subject: Re: [patch 10/10] perf_event_open.2: 4.0 update rdpmc
 documentation
Date: Mon, 20 Apr 2015 10:42:56 -0400 (EDT)
Message-ID: <alpine.DEB.2.11.1504201026280.25620@vincent-weaver-1.umelst.maine.edu>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Peter Zijlstra <a.p.zijlstra-/NLkJaSkS4VmR6Xm/wNWPw@public.gmane.org>, Paul Mackerras <paulus-eUNUBHrolfbYtjvyW6yDsg@public.gmane.org>, Ingo Molnar <mingo-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Arnaldo Carvalho de Melo <acme-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Stephane Eranian <eranian-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Andy Lutomirski <luto-kltTT9wpgjJwATOyAt5JVQ@public.gmane.org>, Kees Cook <keescook-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Andrea Arcangeli <aarcange-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, "hillf.zj" <hillf.zj-gPhfCIXyaqCqndwCJWfcng@public.gmane.org>, Valdis Kletnieks <Valdis.Kletnieks-PjAqaU27lzQ@public.gmane.org>, Linus Torvalds <torvalds-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On Fri, 17 Apr 2015, Andy Lutomirski wrote:        
> On 04/16/2015 11:20 AM, Vince Weaver wrote:
> > Probably a better change would have been to add "2" to mean per-process
> > and make that the default setting.  Probably too late to fix that now.
> 
> Good point.  I wish you'd thought of that sooner :(

Well it's been a busy semester and so I've had less time than normal to 
play perf_event ABI police.

I also was surprised this particular patch managed to get into 4.0 so 
quickly; I thought it was going to be a 4.1 change when I added it to my 
"changesets to look at more closely" list.

In any case most people won't notice this change.  It will be a minor 
inconvenience for HPC people doing complicated homebrew self monitoring
(especially if RHEL backports the patch and then suddenly things break and 
a simple "well are you running 4.0 or newer" is meaningless). Using
the value in /sys/devices/cpu/rdpmc to help debug the problem wouldn't
have worked anyway because it looks like non-root can't do that.

Vince
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
