From: "Michael Kerrisk" <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: PR_SET_SECCOMP and PR_GET_SECCOMP doc (and bug?)
Date: Tue, 17 Jun 2008 19:59:00 +0200
Message-ID: <cfd18e0f0806171059l42783342h9ff68b0761c8a2e@mail.gmail.com>
References: <48565951.40603@gmail.com> <20080616162543.GA9552@duo.random>
	 <cfd18e0f0806170632p27a5ccd2obadaf0dfd4ce64aa@mail.gmail.com>
	 <18697.1213719134@turing-police.cc.vt.edu>
	 <20080617173411.GC28087@duo.random>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20080617173411.GC28087-cCc6IEhtdJnQT0dZR+AlfA@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrea Arcangeli <andrea-atKUWr5tajBWk0Htik3J/w@public.gmane.org>
Cc: Valdis.Kletnieks-PjAqaU27lzQ@public.gmane.org, Ivana Varekova <varekova-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, lkml <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Tue, Jun 17, 2008 at 7:34 PM, Andrea Arcangeli <andrea-atKUWr5tajBWk0Htik3J/w@public.gmane.org> wrote:
> On Tue, Jun 17, 2008 at 12:12:14PM -0400, Valdis.Kletnieks-PjAqaU27lzQ@public.gmane.org wrote:
>> On Tue, 17 Jun 2008 15:32:29 +0200, Michael Kerrisk said:
>> > On Mon, Jun 16, 2008 at 6:25 PM, Andrea Arcangeli <andrea-atKUWr5tajBWk0Htik3J/w@public.gmane.org> wrote:
>> > > On Mon, Jun 16, 2008 at 02:15:13PM +0200, Michael Kerrisk wrote:
>>
>> > >>     PR_GET_SECCOMP (since Linux 2.6.23)
>> > >>         Return the secure computing mode  of  the  calling  thread.
>> > >>         Not  very  useful: if the caller is not in secure computing
>> > >>         mode, this operation returns 0; if the caller is in  secure
>> > >>         computing  mode, then the prctl() call will cause a SIGKILL
>> > >>         signal to be sent to the process.  This operation  is  only
>> > >>         available  if  the kernel is configured with CONFIG_SECCOMP
>> > >>         enabled.
>>
>> Would it make sense to change the text to read "Not very useful for the
>> current implementation of mode=1" and/or add that it may be useful for
>
> Yes, makes sense to me ;).

I've made a change something like you suggest, Valdis.  But I'm still
not really convinced that it will be useful in the future.  The
problem is that as things stand, we would *never* be able to safely
make the prctl(PR_GET_SECCOMP) call, since there is a chance (if mode
is 1) that we would be killed by SIGKILL.



-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
man-pages online: http://www.kernel.org/doc/man-pages/online_pages.html
Found a bug? http://www.kernel.org/doc/man-pages/reporting_bugs.html
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
