From: Glauber Costa <glommer-bzQdu9zFT3WakBO8gow8eQ@public.gmane.org>
Subject: Re: [RFC v3 0/3] vmpressure_fd: Linux VM pressure notifications
Date: Mon, 19 Nov 2012 17:57:19 +0400
Message-ID: <50AA3ABF.4090803@parallels.com>
References: <20121107105348.GA25549@lizard> <20121107112136.GA31715@shutemov.name> <CAOJsxLHY+3ZzGuGX=4o1pLfhRqjkKaEMyhX0ejB5nVrDvOWXNA@mail.gmail.com> <20121107114321.GA32265@shutemov.name> <alpine.DEB.2.00.1211141910050.14414@chino.kir.corp.google.com> <20121115033932.GA15546@lizard.sbx05977.paloaca.wayport.net> <alpine.DEB.2.00.1211141946370.14414@chino.kir.corp.google.com> <20121115073420.GA19036@lizard.sbx05977.paloaca.wayport.net> <alpine.DEB.2.00.1211142351420.4410@chino.kir.corp.google.com> <20121115085224.GA4635@lizard> <alpine.DEB.2.00.1211151303510.27188@chino.kir.corp.google.com> <50A60873.3000607@parallels.com> <alpine.DEB.2.00.1211161157390.2788@chino.kir.corp.google.com> <50A6AC48.6080102@parallels.com> <alpine.DEB.2.00.1211161349420.17853@chino.kir.corp.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <alpine.DEB.2.00.1211161349420.17853-X6Q0R45D7oAcqpCFd4KODRPsWskHk0ljAL8bYrjMMd8@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Rientjes <rientjes-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Cc: Anton Vorontsov <anton.vorontsov-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "Kirill A. Shutemov" <kirill-oKw7cIdHH8eLwutG50LtGA@public.gmane.org>, Pekka Enberg <penberg-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mel Gorman <mgorman-l3A5Bk7waGM@public.gmane.org>, Leonid Moiseichuk <leonid.moiseichuk-xNZwKgViW5gAvxtiuMwx3w@public.gmane.org>, KOSAKI Motohiro <kosaki.motohiro-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Minchan Kim <minchan-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, John Stultz <john.stultz-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-mm-Bw31MaZKKs3YtjvyW6yDsg@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linaro-kernel-cunTk1MwBs8s++Sfvej+rw@public.gmane.org, patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, kernel-team-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, KAMEZAWA Hiroyuki <kamezawa.hiroyu-+CUm20s59erQFUHtdCDX3A@public.gmane.org>, Michal Hocko <mhocko-AlSwsSmVLrQ@public.gmane.org>, Johannes Weiner <hannes-druUgvl0LCNAfugRpC6u6w@public.gmane.org>, Tejun Heo <tj-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On 11/17/2012 01:57 AM, David Rientjes wrote:
> On Sat, 17 Nov 2012, Glauber Costa wrote:
> 
>>> I'm wondering if we should have more than three different levels.
>>>
>>
>> In the case I outlined below, for backwards compatibility. What I
>> actually mean is that memcg *currently* allows arbitrary notifications.
>> One way to merge those, while moving to a saner 3-point notification, is
>> to still allow the old writes and fit them in the closest bucket.
>>
> 
> Yeah, but I'm wondering why three is the right answer.
> 

This is unrelated to what I am talking about.
I am talking about pre-defined values with a specific event meaning (in
his patchset, 3) vs arbitrary numbers valued in bytes.

>>> Umm, why do users of cpusets not want to be able to trigger memory 
>>> pressure notifications?
>>>
>> Because cpusets only deal with memory placement, not memory usage.
> 
> The set of nodes that a thread is allowed to allocate from may face memory 
> pressure up to and including oom while the rest of the system may have a 
> ton of free memory.  Your solution is to compile and mount memcg if you 
> want notifications of memory pressure on those nodes.  Others in this 
> thread have already said they don't want to rely on memcg for any of this 
> and, as Anton showed, this can be tied directly into the VM without any 
> help from memcg as it sits today.  So why implement a simple and clean 
> mempressure cgroup that can be used alone or co-existing with either memcg 
> or cpusets?
> 
>> And it is not that moving a task to cpuset disallows you to do any of
>> this: you could, as long as the same set of tasks are mounted in a
>> corresponding memcg.
>>
> 
> Same thing with a separate mempressure cgroup.  The point is that there 
> will be users of this cgroup that do not want the overhead imposed by 
> memcg (which is why it's disabled in defconfig) and there's no direct 
> dependency that causes it to be a part of memcg.
> 
I think we should shoot the duck where it is going, not where it is. A
good interface is more important than overhead, since this overhead is
by no means fundamental - memcg is fixable, and we would all benefit
from it.

Now, whether or not memcg is the right interface is a different
discussion - let's have it!

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
