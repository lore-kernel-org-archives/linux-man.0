From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Lack of sshfs(1) man page
Date: Wed, 24 Dec 2014 09:21:41 +0100
Message-ID: <549A7795.7070005@gmail.com>
References: <CAA6tFMtt4WO2SkSuMp=Yg9orSOGmD3ihnPH4LLDD30gTGzJK4Q@mail.gmail.com> <54998C81.5090408@gmail.com> <CAA6tFMvS_+wjJ11T6CAgVGS4+nyGr6KiO-LVUWb-4Abf1nLU+Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAA6tFMvS_+wjJ11T6CAgVGS4+nyGr6KiO-LVUWb-4Abf1nLU+Q-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Piotr Dobrogost <p@lists-2014.dobrogost.net>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Piotr,

>>> Also should I prefer man7.org/linux/man-pages/ man pages to
>>> http://linux.die.net/man/ ones?
>>
>> It depends, and obviously I am biased. The pages rendered
>> at man7.org tend to be (*much*) more up to date, and the
>> COLOPHON tells you exactly where the page came from, and
>> when. That info is not available on most other sites that
>> provide HTML renderings, and the pages on some of those
>> sites are years out of date. As outlined in the blog post,
>> I am open to add projects to the rendered set, which currently
>> comprises around 100 projects.
> 
> Thanks for info. Reading http://blog.man7.org/ I see you're maintainer
> of man-pages project and at https://www.kernel.org/doc/man-pages/ page
> there's a link ("Online man pages") to man7.org. Is there any
> "official" relation between these two projects (man-pages and
> man7.org)?

No, the link is only personal. man7.org is my personal site.

> Am I right to think that providing up to date man pages online for all
> "popular" projects seems to be very valuable service to the GNU/Linux
> community? 

It is certainly very useful, in my opinion at least.

> If so does man7.org receive support from major
> institutions, projects and communities in the GNU/Linux world?  

Not as such, but I've not asked for such either. Some people help
by pointing out errors or projects that might usefully be
included in the set.

> Is
> there any chance man7 and linux.die.net/man/ would cooperate so that
> it would be easier to find up to date online man pages?

Well, the man7.org pages are easy to find already ;-).
But, aside from that, I suspect that the man pages at
die.net are created by just dumping all of the pages off
a particular distribution install. Thus, it's not always
clear where the pages come from, or how old they are. Indeed
they seem to go to some effort to obscure that information, 
removing the page timestamps, and even, looking at
http://linux.die.net/man/2/prctl for example, stripping out
the COLOPHON that I place in the pages of the man-pages
project. That COLOPHON notes which release of man-pages the
page belongs to and has a pointer to a URL for information
on the project and how to report bugs. I'm not impressed
that they remove it. Mainly, I think those renderings are 
about driving a few ad clicks... (I'm not really sure there's
much to be gained from any sort of cooperation.)

> Also curious
> to know where does the name of "man7" come from?

I took over man-pages maintenance in 2004. Since that time,
I've expanded the remit of that section to include pages that
give overviews/big pictures of how APIs are related, so that
now we have pages such as:

aio(7)
credentials(7)
fanotify(7)
feature_test_macros(7)
inotify(7)
libc(7)
mq_overview(7)
namespaces(7)
numa(7)
pid_namespaces(7)
pipe(7)
pthreads(7)
pty(7)
rtld-audit(7)
sched(7)
sem_overview(7)
shm_overview(7)
sigevent(7)
standards(7)
user_namespaces(7)
 
So, man7 for me is about giving the big picture about Linux APIs,
and was the inspiration for the domain name.

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
