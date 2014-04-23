From: Carsten Andrich <carsten.andrich-hs6bpBdVsEZfm0AUMx9V0g@public.gmane.org>
Subject: Re: [patch] packet.7: PACKET_LOSS has inverse meaning
Date: Wed, 23 Apr 2014 21:10:18 +0200
Message-ID: <1398280218.2416.18.camel@actium.fritz.box>
References: <1398182519.2926.26.camel@x201> <5356B3BA.7050401@gmail.com>
	 <CA+FuTSc=4fwH=+jX58teeQHrRse718qLBOLzAcrZJSYug2TfSw@mail.gmail.com>
	 <5356BB3F.4030502@gmail.com>
	 <CA+FuTScUexjc6bETYMVgPUgmN5CSR40=UrELT9N363Tvk1+waA@mail.gmail.com>
	 <1398200019.5031.24.camel@actium.fritz.box> <53575872.6080403@gmail.com>
	 <e1a7b65cad75dd1a52721826c226c352@localhost> <53579224.3060006@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <53579224.3060006-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Willem de Bruijn <willemb-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Daniel Borkmann <dborkman-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Am Mittwoch, den 23.04.2014, 12:12 +0200 schrieb Michael Kerrisk
(man-pages):
> On 04/23/2014 10:51 AM, Carsten Andrich wrote:
> [...]
> > PS: This is not me volunteering to help in that effort. At least not
> > yet ;)
> 
> Any way that I could convince you? :-} Some of the API corners in
> man pages are so dark, dusty, and deep that I just don't have time
> to get up to speed on the topic in order to fix the pages, and 
> it's really helpful to have someone pick up the reigns on a 
> particular topic. In that sense, Vince Weaver (perf_event_open.2) 
> and Denys Vlasenko (ptrace.2) have been lifesavers. 

I consider man-pages an incredibly important effort, since they've been
very helpful for me on numerous occasions, and I'd generally be willing
to support that effort.

> packet.7 is another one of those dusty corners. I can't see 
> myself ever getting the time to make it better, since there's  a 
> lot of base knowledge that I lack, and there are so many other
> tasks in need of attention. Andi Kleen made a good effort in
> putting the page together 15 years ago, but since then it has
> mostly languished, short of real love, except for a couple of 
> patches in the last 18 months (from Daniel/Willem, and Neil Horman). 
> How would you like to become the  maintainer of a man page :-).

You must be in dire need of assistance, if you ask me that, despite
knowing so little about me :)
Unfortunately my experience with Linux packet sockets is very limited. I
messed with them a few times, but only really started using SOCK_RAW
packet sockets (including PACKET_MMAP) a few weeks ago (as a part of my
Bachelor's thesis). I haven't looked at the linux (networking) code
before Monday, when I tried to figure out if either packet.7 or I was
wrong regarding PACKET_LOSS. And I've never even touched SOCK_DGRAM.

All this doesn't exactly qualify me for the job :)

Maybe we should continue this discussion in private, so we don't bore
everyone to death.

Cheers,
Carsten



--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
