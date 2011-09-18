From: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: rt_tgsigqueueinfo man page
Date: Sun, 18 Sep 2011 17:02:44 +0200
Message-ID: <CAKgNAkid7DgswLZC_8griQ5cufz62KyrCT50v4YA5kwT0ATLMw@mail.gmail.com>
References: <201102091452.48161.stephan.mueller@atsec.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <201102091452.48161.stephan.mueller-fwYZOkdEjagAvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephan Mueller <stephan.mueller-fwYZOkdEjagAvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi Stephan,

On Wed, Feb 9, 2011 at 2:52 PM, Stephan Mueller
<stephan.mueller-fwYZOkdEjagAvxtiuMwx3w@public.gmane.org> wrote:
> Hi,
>
> please see attached file for the rt_tgsigqueueinfo man page.
>
> This man page was derived from the discussion in
> http://help.lockergnome.com/linux/patch-add-rt_tgsigqueueinfo-syscall-V2--
> ftopict495666.html

Thanks for that. It was long on my TODO list to write some proper
documentation for this system call. But what is really needed is a
page that combines rt_sigqueueinfo() (which was incompletely
documented in the "sigqueue.2" page) and rt_tgsigqueueinfo(). I've
done that now. See my other mail on the topic.

Best regards,

Michael


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
