From: Neil Horman <nhorman-2XuSBdqkA4R54TAoqtyWWQ@public.gmane.org>
Subject: Re: [patch] packet.7: PACKET_LOSS has inverse meaning
Date: Thu, 24 Apr 2014 06:59:51 -0400
Message-ID: <20140424105951.GA12403@hmsreliant.think-freely.org>
References: <5356BB3F.4030502@gmail.com>
 <CA+FuTScUexjc6bETYMVgPUgmN5CSR40=UrELT9N363Tvk1+waA@mail.gmail.com>
 <1398200019.5031.24.camel@actium.fritz.box>
 <53575872.6080403@gmail.com>
 <e1a7b65cad75dd1a52721826c226c352@localhost>
 <53579224.3060006@gmail.com>
 <1398280218.2416.18.camel@actium.fritz.box>
 <5358C957.8080402@gmail.com>
 <1da011719b1828d43232fd8d91b609ff@localhost>
 <5358E59E.2000207@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <5358E59E.2000207-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Carsten Andrich <carsten.andrich-hs6bpBdVsEZfm0AUMx9V0g@public.gmane.org>, Willem de Bruijn <willemb-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Daniel Borkmann <dborkman-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Vince Weaver <vincent.weaver-e7X0jjDqjFGHXe+LvDLADg@public.gmane.org>, Andi Kleen <andi-Vw/NltI1exuRpAAqCnN02g@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On Thu, Apr 24, 2014 at 12:21:18PM +0200, Michael Kerrisk (man-pages) wrote:
> On 04/24/2014 11:39 AM, Carsten Andrich wrote:
> > "Michael Kerrisk (man-pages)" schrieb:
> >> On 04/23/2014 09:10 PM, Carsten Andrich wrote:
> >>> [...]
> >>> Unfortunately my experience with Linux packet sockets is very limited. I
> >>> messed with them a few times, but only really started using SOCK_RAW
> >>> packet sockets (including PACKET_MMAP) a few weeks ago (as a part of my
> >>> Bachelor's thesis). I haven't looked at the linux (networking) code
> >>> before Monday, when I tried to figure out if either packet.7 or I was
> >>> wrong regarding PACKET_LOSS. And I've never even touched SOCK_DGRAM.
> >>>
> >>> All this doesn't exactly qualify me for the job :)
> >>
> >> Maybe, maybe not. On the other hand, I have the idea (may be wrong) 
> >> that Vince Weaver was a beginner with perf_event_open() when he
> >> started sending me patches. He's continued doing so with a vengeance
> >> (thanks again Vince!). That has been a great help, since 
> >> perf_event_open() is a complex, constantly evolving API surface, and
> >> I just don't have the time to track the details. The API described in 
> >> packet.7 has not changed much over time, but the man page has seen
> >> little love over the years. An inquiring mind, willing to test things
> >> and read code are the main prerequisites. ANd it sounds like some 
> >> others might chip with help and Acks.
> > 
> > We could give it a shot. It may be of an advantage to not have a deep
> > understanding of the code driving the interface one is trying to
> > document, as to not leave out aspects which appear to be self-evident.
> 
> (Nod.)
> 
> > It would make sense to limit our efforts to getting the PACKET_MMAP
> > documentation in good shape, at least for now.
> > I'd definitely require a reviewer (who's willing to answer some
> > questions in advance) with a good understanding of at_packet.c and since
> > I've already mentioned the need for synchronizing packet.7 and
> > packet_mmap.txt we'd also need a decent plan how to distribute/share
> > information among both.
> 
> I'd leave that plan largely to you. It sounds like Willem and
> Daniel are willing to help out. 
> 
> > I'll try to come up with some ideas once I've handed in my Bachelor's
> > thesis (deadline ends 3 weeks from now).
> > Is there anyone else from the kernel-side we'd need to involve besides
> > Willem and Daniel?
> 
> Maybe even Neil and Andi (CCed) might chip in from time to time.
> 
of course, I'll be happy to review/consult on documentation changes.  I'm happy
to contribute for that matter, as time allows, but my plate is unfortunately a
bit full at the moment, so I might be limited to answering questions for a bit.

> >>> Maybe we should continue this discussion in private, so we don't bore
> >>> everyone to death.
> >>
> >> Drop me a private mail if you want, but there are also benefits 
> >> to public conversations ;-).
> > I just don't want to annoy anyone, since we kinda force Willem, Daniel
> > and now Vince to read this :)
> 
> So it goes...
> 
> Thanks, Carsten.
> 
> Cheers,
> 
> Michael
> 
> 
> 
> -- 
> Michael Kerrisk
> Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
> Linux/UNIX System Programming Training: http://man7.org/training/
> 
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
