From: "Michael Kerrisk" <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: For review: CPU_SET.3
Date: Thu, 13 Nov 2008 22:08:47 -0500
Message-ID: <cfd18e0f0811131908y4b948844m680566bb27404666@mail.gmail.com>
References: <cfd18e0f0811130606k1586607cy7846aee91d37c53b@mail.gmail.com>
	 <36ca99e90811131045o78507ee9wd603a3d64ea79c29@mail.gmail.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <36ca99e90811131045o78507ee9wd603a3d64ea79c29-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Bert Wesarg <bert.wesarg-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Cc: Loic Domaigne <tech-Z4JMKDdsf89Wk0Htik3J/w@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi Bert,

Thanks for looking this over.

On Thu, Nov 13, 2008 at 1:45 PM, Bert Wesarg <bert.wesarg-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org> wrote:
> Hi Michael,
>
> On Thu, Nov 13, 2008 at 15:06, Michael Kerrisk
> <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org> wrote:
>> Hi Bert,
>>
>> I created this page by removing the CPU_*() material from
>> sched_setscheduler.2 and adding documentation of the many other macros
>> that have been added in more recent glibc releases.
>>
>> I remember looking at a mail thread you pointed at a few days back
>> where you said the interface of the CPU_*S() macros is somewhat
>> confusing in its use of bits in some places, and bytes in others.
>> It's hard to disagree with you -- so I included an example in the
>> man-pages which hopefully might reduce the confusion.
>>
>> Of course, since these are macros, my use of types in the prototypes
>> in the SYNOPSIS is in many cases invention; let me know if something
>> looks weird.
>>
>> Also, take a look at
>> http://sourceware.org/bugzilla/show_bug.cgi?id=7029.  Unless I'm
>> confused (which is always possible), this is a real bug.  Do you
>> agree?
> "It's hard to disagree with you." I can confirm this here on my x86-64
> box, a x86-32 exec returns 2048 the x86-64 1024.

Yep.  In fact UD has already fixed it today.

[...]

>> .BI "int  CPU_EQUAL_S(size_t " setsize ", cpu_set_t *" set1 \
>> ", cpu_set_t *" set2 );
> Even I like to see the equivalent C prototypes, I think this should be
> noted earlier that these are actually macros.

Well, I do mention that they are macros a number of times.  What more
do you think I should add?

> Also, I would like to see a note that the cpu_set_t type is opaque (as
> from the glibc manual)

I added something on that.

> but there is no official copy operator. The
> glibc developer suggest using memcpy for this (see the reminder of
> this thread I posted).

Yes, good point.  I Added a NOTES section mentioning memcpy(3).

> And you should not use '=' because of the
> dynamically allocated ones.
>
> Last but not least, because CPU_ALLOC{,_SIZE} rounds the num_cpus
> argument up (i.e. CPU_ALLOC_SIZE(1) == sizeof(unsigned long)) there
> are probably more cpus possible in this set than you requested, so
> these blind bits should be mentioned as undefined.

I added something in NOTES about this.

> Now to the naming confusion, I think the main problem is CPU_SETSIZE
> and the setsize arguement to the CPU_*_S macros. The former is in bits
> the latter in bytes. Either put a note to CPU_SETSIZE that this is in
> bits and you should not pass this as an setsize argument to any
> CPU_*_S macro, because of the similar name. Or, rename the setsize
> argument to something other, and use the setsize name for the
> CPU_ALLOC{,_SIZE}, too.
>
> I think option one should suffice.

Again, I added something to NOTES on this.

[...]

>> This macro provides the value that can be used for
> the
>> .I setsize
> argument

Done.

Thanks Bert.


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
