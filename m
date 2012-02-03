From: Siddhesh Poyarekar <siddhesh.poyarekar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RESEND][PATCH] Mark thread stack correctly in proc/<pid>/maps
Date: Sat, 4 Feb 2012 00:04:11 +0530
Message-ID: <CAAHN_R0+ExGcdpLM7KwC_KsPOemVOiRrmyWcowiu5_cWW3BPLQ@mail.gmail.com>
References: <20120116163106.GC7180@jl-vm1.vm.bytemark.co.uk>
	<1326776095-2629-1-git-send-email-siddhesh.poyarekar@gmail.com>
	<CAAHN_R2g9zaujw30+zLf91AGDHNqE6HDc8Z4yJbrzgJcJYFkXg@mail.gmail.com>
	<4F2B02BC.8010308@gmail.com>
	<CAAHN_R0O7a+RX7BDfas3+vC+mnQpp0h3y4bBa1u4T-Jt=S9J_w@mail.gmail.com>
	<CAHGf_=qA6EFue2-mNUg9udWV4xSx86XQsnyGV07hfZOUx6_egw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAHGf_=qA6EFue2-mNUg9udWV4xSx86XQsnyGV07hfZOUx6_egw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: KOSAKI Motohiro <kosaki.motohiro-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Jamie Lokier <jamie-yetKDKU6eevNLxjTenLetw@public.gmane.org>, linux-mm-Bw31MaZKKs3YtjvyW6yDsg@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Alexander Viro <viro-RmSDqhL/yNMiFSDQTTA3OLVCufUGDwFn@public.gmane.org>, linux-fsdevel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Fri, Feb 3, 2012 at 1:31 PM, KOSAKI Motohiro
<kosaki.motohiro-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> The fact is, now process stack and pthread stack clearly behave
> different dance. libc don't expect pthread stack grow automatically.
> So, your patch will break userland. Just only change display thing.

The change should not make thread stacks (as implemented by glibc)
grow automatically in the general case since it has to implement guard
page(s) at the beginning of the mapped memory for stack using
mprotect(top, size, PROT_NONE). Due to this, the program will crash
before it ever has a chance to cause a page fault to make the stack
grow. This is of course assuming that the program doesn't purposely
jump over the guard page(s) by setting %sp beyond them and then
causing a page fault. So the only case in which a thread stack will
grow automatically is if the stackguard is set to 0:

http://pubs.opengroup.org/onlinepubs/007904975/functions/pthread_attr_setguardsize.html

I have also dropped an email on the libc-alpha list here to solicit
comments from libc maintainers on this:

http://sourceware.org/ml/libc-alpha/2012-02/msg00036.html


-- 
Siddhesh Poyarekar
http://siddhesh.in
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
