From: Glauber Costa <glommer-bzQdu9zFT3WakBO8gow8eQ@public.gmane.org>
Subject: Re: [RFC v3 0/3] vmpressure_fd: Linux VM pressure notifications
Date: Fri, 16 Nov 2012 13:33:39 +0400
Message-ID: <50A60873.3000607@parallels.com>
References: <20121107105348.GA25549@lizard> <20121107112136.GA31715@shutemov.name> <CAOJsxLHY+3ZzGuGX=4o1pLfhRqjkKaEMyhX0ejB5nVrDvOWXNA@mail.gmail.com> <20121107114321.GA32265@shutemov.name> <alpine.DEB.2.00.1211141910050.14414@chino.kir.corp.google.com> <20121115033932.GA15546@lizard.sbx05977.paloaca.wayport.net> <alpine.DEB.2.00.1211141946370.14414@chino.kir.corp.google.com> <20121115073420.GA19036@lizard.sbx05977.paloaca.wayport.net> <alpine.DEB.2.00.1211142351420.4410@chino.kir.corp.google.com> <20121115085224.GA4635@lizard> <alpine.DEB.2.00.1211151303510.27188@chino.kir.corp.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <alpine.DEB.2.00.1211151303510.27188-X6Q0R45D7oAcqpCFd4KODRPsWskHk0ljAL8bYrjMMd8@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Rientjes <rientjes-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Cc: Anton Vorontsov <anton.vorontsov-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "Kirill A. Shutemov" <kirill-oKw7cIdHH8eLwutG50LtGA@public.gmane.org>, Pekka Enberg <penberg-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mel Gorman <mgorman-l3A5Bk7waGM@public.gmane.org>, Leonid Moiseichuk <leonid.moiseichuk-xNZwKgViW5gAvxtiuMwx3w@public.gmane.org>, KOSAKI Motohiro <kosaki.motohiro-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Minchan Kim <minchan-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, John Stultz <john.stultz-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-mm-Bw31MaZKKs3YtjvyW6yDsg@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linaro-kernel-cunTk1MwBs8s++Sfvej+rw@public.gmane.org, patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, kernel-team-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, KAMEZAWA Hiroyuki <kamezawa.hiroyu-+CUm20s59erQFUHtdCDX3A@public.gmane.org>, Michal Hocko <mhocko-AlSwsSmVLrQ@public.gmane.org>, Johannes Weiner <hannes-druUgvl0LCNAfugRpC6u6w@public.gmane.org>, Tejun Heo <tj-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On 11/16/2012 01:25 AM, David Rientjes wrote:
> On Thu, 15 Nov 2012, Anton Vorontsov wrote:
> 
>> Hehe, you're saying that we have to have cgroups=y. :) But some folks were
>> deliberately asking us to make the cgroups optional.
>>
> 
> Enabling just CONFIG_CGROUPS (which is enabled by default) and no other 
> current cgroups increases the size of the kernel text by less than 0.3% 
> with x86_64 defconfig:
> 
>    text	   data	    bss	    dec	    hex	filename
> 10330039	1038912	1118208	12487159	 be89f7	vmlinux.disabled
> 10360993	1041624	1122304	12524921	 bf1d79	vmlinux.enabled
> 
> I understand that users with minimally-enabled configs for an optimized 
> memory footprint will have a higher percentage because their kernel is 
> already smaller (~1.8% increase for allnoconfig), but I think the cost of 
> enabling the cgroups code to be able to mount a vmpressure cgroup (which 
> I'd rename to be "mempressure" to be consistent with "memcg" but it's only 
> an opinion) is relatively small and allows for a much more maintainable 
> and extendable feature to be included: it already provides the 
> cgroup.event_control interface that supports eventfd that makes 
> implementation much easier.  It also makes writing a library on top of the 
> cgroup to be much easier because of the standardization.
> 
> I'm more concerned about what to do with the memcg memory thresholds and 
> whether they can be replaced with this new cgroup.  If so, then we'll have 
> to figure out how to map those triggers to use the new cgroup's interface 
> in a way that doesn't break current users that open and pass the fd of 
> memory.usage_in_bytes to cgroup.event_control for memcg.
> 
>> OK, here is what I can try to do:
>>
>> - Implement memory pressure cgroup as you described, by doing so we'd make
>>   the thing play well with cpusets and memcg;
>>
>> - This will be eventfd()-based;
>>
> 
> Should be based on cgroup.event_control, see how memcg interfaces its 
> memory thresholds with this in Documentation/cgroups/memory.txt.
> 
>> - Once done, we will have a solution for pretty much every major use-case
>>   (i.e. servers, desktops and Android, they all have cgroups enabled);
>>
> 
> Excellent!  I'd be interested in hearing anybody else's opinions, 
> especially those from the memcg world, so we make sure that everybody is 
> happy with the API that you've described.
> 
Just CC'd them all.

My personal take:

Most people hate memcg due to the cost it imposes. I've already
demonstrated that with some effort, it doesn't necessarily have to be
so. (http://lwn.net/Articles/517634/)

The one thing I missed on that work, was precisely notifications. If you
can come up with a good notifications scheme that *lives* in memcg, but
does not *depend* in the memcg infrastructure, I personally think it
could be a big win.

Doing this in memcg has the advantage that the "per-group" vs "global"
is automatically solved, since the root memcg is just another name for
"global".

I honestly like your low/high/oom scheme better than memcg's
"threshold-in-bytes". I would also point out that those thresholds are
*far* from exact, due to the stock charging mechanism, and can be wrong
by as much as O(#cpus). So far, nobody complained. So in theory it
should be possible to convert memcg to low/high/oom, while still
accepting writes in bytes, that would be thrown in the closest bucket.

Another thing from one of your e-mails, that may shift you in the memcg
direction:

"2. The last time I checked, cgroups memory controller did not (and I
guess still does not) not account kernel-owned slabs. I asked several
times why so, but nobody answered."

It should, now, in the latest -mm, although it won't do per-group
reclaim (yet).

I am also failing to see how cpusets would be involved in here. I
understand that you may have free memory in terms of size, but still be
further restricted by cpuset. But I also think that having multiple
entry points for this buy us nothing at all. So the choices I see are:

1) If cpuset + memcg are comounted, take this into account when deciding
low / high / oom. This is yet another advantage over the "threshold in
bytes" interface, in which you can transparently take
other issues into account while keeping the interface.

2) If they are not, just ignore this effect.

The fallback in 2) sounds harsh, but I honestly think this is the price
to pay for the insanity of mounting those things in different
hierarchies, and we do have a plan to have all those things eventually
together anyway. If you have two cgroups dealing with memory, and set
them up in orthogonal ways, I really can't see how we can bring sanity
to that. So just admitting and unleashing the insanity may be better, if
it brings up our urge to fix it. It worked for Batman, why wouldn't it
work for us?







--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
