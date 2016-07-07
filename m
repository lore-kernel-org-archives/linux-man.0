From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] perf_event_open.2: Add a note that dyn_size is omitted if
 size == 0
Date: Thu, 7 Jul 2016 12:08:23 +0200
Message-ID: <aa3f12ad-ef08-76f6-0630-4b90448fcaee@gmail.com>
References: <CABV8kRwrvuPsqwep5xJv+G_vN6cK=xqWRHRp0ducR7pZxwfr6Q@mail.gmail.com>
 <alpine.DEB.2.20.1607041259170.1440@macbook-air>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <alpine.DEB.2.20.1607041259170.1440@macbook-air>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vince Weaver <vincent.weaver-e7X0jjDqjFGHXe+LvDLADg@public.gmane.org>, Keno Fischer <keno-9DCaDmOhoh+8M3too/+dENBPR1lH4CV8@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Vince,

On 07/04/2016 07:11 PM, Vince Weaver wrote:
> On Sun, 3 Jul 2016, Keno Fischer wrote:
>
>> The perf_output_sample_ustack in kernel/events/core.c only writes a
>> single 64 bit word
>> if it can't dump the user registers. From the current version of the
>> man page, I would
>> have expected two 64 bit words (one for size, one for dyn_size). Change the man
>> page to make this behavior explicit.
>>
>> This is my first man-pages patch, please let me know if I should do
>> anything else.
>
> Overall it looks fine, to me at least.

It helps hugely when I get a review by someone! Thanks!
(And Keno, thanks also for thinking to CC Vince!)

> It's sometimes also nice to have the commit where the behavior was first
> introuduced mentioned, but in this case since the behavior hasn't changed
> since introduction that's probably not necessary.
>
> I'm fine with this being taken directly.  (not sure if I should kick in a
> reviewed-by or some such tag (?)).

I added one for you.

> I'm slowly catching up on the backlog of perf_event_open.2 updates,
> hopefully I'll start sending those in soon.

That would of course be wonderful!

Cheers,

Michael


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
