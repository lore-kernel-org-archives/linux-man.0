From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [patch] packet.7: PACKET_LOSS has inverse meaning
Date: Wed, 23 Apr 2014 12:12:52 +0200
Message-ID: <53579224.3060006@gmail.com>
References: <1398182519.2926.26.camel@x201> <5356B3BA.7050401@gmail.com> <CA+FuTSc=4fwH=+jX58teeQHrRse718qLBOLzAcrZJSYug2TfSw@mail.gmail.com> <5356BB3F.4030502@gmail.com> <CA+FuTScUexjc6bETYMVgPUgmN5CSR40=UrELT9N363Tvk1+waA@mail.gmail.com> <1398200019.5031.24.camel@actium.fritz.box> <53575872.6080403@gmail.com> <e1a7b65cad75dd1a52721826c226c352@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <e1a7b65cad75dd1a52721826c226c352@localhost>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Carsten Andrich <carsten.andrich-hs6bpBdVsEZfm0AUMx9V0g@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Willem de Bruijn <willemb-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Daniel Borkmann <dborkman-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 04/23/2014 10:51 AM, Carsten Andrich wrote:
> "Michael Kerrisk (man-pages)" schrieb:
>> How would adding just a little more precision be:
>>
>> [[
>> However, if
>> .BR PACKET_LOSS
>> is set, any malformed packet will be skipped, its status 
>> .RI ( tp_status
>> in the
>> .I tpacket_hdr
>> structure) reset to
>> .BR TP_STATUS_AVAILABLE ,
>> and the transmission process continued.
>> ]]
>>
>> ?
> 
> I sense a disturb ... ehm ... general discussion regarding PACKET_MMAP
> documenation arising.

;-).

> I agree with Willem's commit message, adding PACKET_MMAP to packet.7:
> https://git.kernel.org/cgit/docs/man-pages/man-pages.git/commit/?id=dbb4f7516b
>> It tries to balance being informative with exposing kernel detail
>> that is unlikely to be used by most readers or that may change
>> frequently. For implementation details, the manpage points to the
>> documentation in kernel Documentation/networking. Let me know if
>> options should be added or removed.
> 
> The entire packet.7 manpage does not mention struct tpacket_hdr a
> single time,
> so mentioning it only when describing the PACKET_LOSS socket option may
> confuse
> the reader. 

Yes, that was a concern to me.

> Particulary since different versions of this struct exist.
> 
> In my opinion packet.7 should be complete (and correct), yet brief in
> describing anything PACKET_MMAP related, so anyone with a basic
> unterstanding
> of PACKET_MMAP internals will comprehend the descriptions in packet.7.
> packet.7 already refers to Documentation/networking/packet_mmap.txt for
> additional information. Reading only packet.7 will not enable anyone
> unfamiliar
> with PACKET_MMAP to actually use it.


Okay -- I'll remove the piece "tp_status in the tpacket_hdr structure"

> This brings me to packet_mmap.txt, which -- I am sorry to say --
> definitely
> needs to be improved. It lacks some information (e.g. PACKET_LOSS is
> not
> mentioned at all), should give some basic usage examples, clarify some
> details, etc. It does not mention the excellent example code in
> /tools/testing/selftests/net/psock_tpacket.c at all, which I only
> stumled upon
> yesterday. 

I've added that reference into the SEE ALSO section of the man page.

> It would have been very helpful to me, when I was getting
> started
> with PACKET_MMAP, since packet_mmap.txt was quite puzzling in the
> beginning.
> Both packet.7 and packet_mmap.txt should be synchronized to some
> extent, so
> the former gives basic information and the latter contains
> implementation
> details. But that would be a lot of work ...
> 
> Cheers,
> Carsten
> 
> PS: This is not me volunteering to help in that effort. At least not
> yet ;)

Any way that I could convince you? :-} Some of the API corners in
man pages are so dark, dusty, and deep that I just don't have time
to get up to speed on the topic in order to fix the pages, and 
it's really helpful to have someone pick up the reigns on a 
particular topic. In that sense, Vince Weaver (perf_event_open.2) 
and Denys Vlasenko (ptrace.2) have been lifesavers. 

packet.7 is another one of those dusty corners. I can't see 
myself ever getting the time to make it better, since there's  a 
lot of base knowledge that I lack, and there are so many other
tasks in need of attention. Andi Kleen made a good effort in
putting the page together 15 years ago, but since then it has
mostly languished, short of real love, except for a couple of 
patches in the last 18 months (from Daniel/Willem, and Neil Horman). 
How would you like to become the  maintainer of a man page :-). 
That would leave me in good conscience to look after the other 
900+ ;-).

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
