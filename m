From: "Michael Kerrisk" <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: [PATCH] sys_waitid: return -EFAULT for NULL
Date: Wed, 14 Jan 2009 12:36:44 +1300
Message-ID: <cfd18e0f0901131536v30d01881uec31e08000be883c@mail.gmail.com>
References: <cfd18e0f0901131436ud2cf61bkf0e6b00f4b765bb5@mail.gmail.com>
	 <cfd18e0f0901131438n232ba114n27ea2d7964d071de@mail.gmail.com>
	 <20090113224759.7DFB7FC3DD@magilla.sf.frob.com>
	 <20090113224941.36F19FC3DD@magilla.sf.frob.com>
	 <cfd18e0f0901131514i2f7be7f1t2c6275c26dbb6874@mail.gmail.com>
	 <20090113152457.0d7685ad.akpm@linux-foundation.org>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20090113152457.0d7685ad.akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>
Cc: roland-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, torvalds-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, drepper-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, vegard.nossum-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, stable-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Wed, Jan 14, 2009 at 12:24 PM, Andrew Morton
<akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org> wrote:
> On Wed, 14 Jan 2009 12:14:20 +1300
> "Michael Kerrisk" <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org> wrote:
>
>> On Wed, Jan 14, 2009 at 11:49 AM, Roland McGrath <roland-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> wrote:
>> > It's always been invalid to call waitid() with a NULL pointer.  It was an
>> > oversight that it was allowed (and acts like a wait4() call instead).
>> >
>> > Signed-off-by: Roland McGrath <roland-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
>>
>> Modulo the observation that this change will break any Linux-specific
>> application that violate POSIX.1's requirement that infop not be NULL
>> (*), and rely on the existing Linux behavior for
>> waitd(idtype,id,NULL,options):
>>
>
> Well yes.  waitid() has been in there since 2.6.9.  I assume that it
> has had this wait4-emulation mode for that amount of time as well?

AFIACS, yes.

>> (*) It seems unlikely that such applications exist, and we really
>> should make this change for POSIX.1 conformance.
>
> Well, we might get away with it.  But formally speaking, we should live
> with our Linux-specific screwup.

Yes, tricky.  On the one hand, we shouldn't break the ABI.  On the
other hand, POSIX.1 is explicit in disallowing the case that would
lead the ABI change made by this patch.  (For what it is worth, the
man page was released at pretty much the same time as the syscall, and
has always documented that the return value on success was 0, and
Vegard was the first person to report this case that deviated from the
doc.)

> If we _are_ going to make this change then we should merge it as far
> back in -stable as we can, to reduce the risk that people will develop
> applications on kernel version A only to have then behave differently
> on version B.

Ack.

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
