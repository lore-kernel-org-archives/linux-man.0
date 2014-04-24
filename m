From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: status in PACKET_RX_RING is actually a bit mask
Date: Thu, 24 Apr 2014 11:48:23 +0200
Message-ID: <5358DDE7.3020009@gmail.com>
References: <CACKs7VD6a0hzMd_Go6yUAxJ=tbYdJ9Qbq=FXQezVvaUUE9egUw@mail.gmail.com> <CACKs7VAUE89+NyuywOwpZ2GzeVQLtV_A-+4PicErmCzLNNNd6Q@mail.gmail.com> <CAKgNAkhJO2ZMpMf6BiaW7TRUd6jvLFU7yPN7xKH9fDoVPPr=tA@mail.gmail.com> <5358C4FC.80204@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5358C4FC.80204-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Daniel Borkmann <dborkman-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Stefan Puiu <stefan.puiu-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, lnx-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Willem de Bruijn <willemb-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Neil Horman <nhorman-2XuSBdqkA4R54TAoqtyWWQ@public.gmane.org>, Carsten Andrich <carsten.andrich-hs6bpBdVsEZfm0AUMx9V0g@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Stefan, Daniel,

Daniel: Thanks for the Ack.

Stefan: Thanks for the patch. Applied.

Cheers,

Michael


On 04/24/2014 10:02 AM, Daniel Borkmann wrote:
> Hi Michael et al,
> 
> On 04/24/2014 09:42 AM, Michael Kerrisk (man-pages) wrote:
>> Willem, Daniel, Carsten, Neil,
>>
>> All of you have submitted patches in the recent past for packet.7, and
>> are presumably somewhat knowledgeable. Could one or more of your Ack
>> (or, if needed, improve) Stefan's proposed change?
> 
> Sorry for replying so late as I was just way to busy with other stuff.
> Yes, I agree with you and Carsten that the man-page still need more
> improvements, it's not perfect, and I'm glad that since a long time
> Willem chipped in to at least bring the man page a bit more up to date.
> 
> I tried to update ...
> 
>   - http://lingrok.org/xref/linux-net-next/Documentation/networking/packet_mmap.txt
>   - http://lingrok.org/xref/linux-net-next/Documentation/networking/filter.txt
> 
> ... over time, both are somewhat tightly coupled as AF_PACKET users
> heavily deal with BPF filters as well; so that at least it's a bit more
> clear for other [kernel] developers as even the kernel documentation was
> very terse for many years and without examples.
> 
> Now to your question. It can easily be seen from the if_packet.h header
> file http://lingrok.org/xref/linux-net-next/include/uapi/linux/if_packet.h#93
> that TP_STATUS_* are individual bits that are set in tp_status field.
> 
> TP_STATUS_USER simply means a frame was received in the ring and is
> ready for user space to be processed. If the field also indicates
> TP_STATUS_LOSING then this means that there were packet drops in the
> rx ring itself so a user knows it didn't get all traffic. This bit
> is being reset on getsockopt() when querying PACKET_STATISTICS,
> otherwise it stays. Drops occur when the ring buffer was not emptied
> fast enough by user space (so no free slot with TP_STATUS_KERNEL), e.g.
> due to high incoming traffic load. However, the current frame you're
> reading that has TP_STATUS_USER|TP_STATUS_LOSING is fine by itself.
> 
> Hope that clarifies it?
> 
> Thanks,
> 
> Daniel
> 
>> Thanks,
>>
>> Michael
>>
>>
>> On Tue, Feb 25, 2014 at 10:24 PM, Stefan Puiu <stefan.puiu-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>>> [re-sending since the original message was bounced back, something
>>> about HTML subpart]
>>>
>>> Hi,
>>>
>>> I'm playing with the PACKET_RX_RING option to packet sockets and I
>>> noticed that the status field from the tpacket_hdr structures inside
>>> the mmaped buffer is actually a bit mask. I'm testing with 4Gbps
>>> traffic rates and sometimes I get status=5. I'm using Ubuntu 12.04
>>> with a 3.8.0-29 kernel, and at least from the code (I got it using
>>> "sudo apt-get source linux-image-$(uname -r)") it seems the 5 means
>>> TP_STATUS_USER | TP_STATUS_LOSING. The 3.8.0 kernel code has this line
>>> in tpacket_rcv():
>>>
>>>          /*
>>>           * LOSING will be reported till you read the stats,
>>>           * because it's COR - Clear On Read.
>>>           * Anyways, moving it for V1/V2 only as V3 doesn't need this
>>>           * at packet level.
>>>           */
>>>                  if (po->stats.tp_drops)
>>>                          status |= TP_STATUS_LOSING;
>>>
>>> Also, in some source code example I found using google
>>> (http://www.google.ro/url?sa=t&rct=j&q=&esrc=s&source=web&cd=5&cad=rja&ved=0CEIQFjAE&url=http%3A%2F%2Fstuff.mit.edu%2Fafs%2Fsipb%2Fcontrib%2Flinux%2Ftools%2Ftesting%2Fselftests%2Fnet%2Fpsock_fanout.c&ei=lM8MU5yhB-iK7Aan7IGgAQ&usg=AFQjCNFtZBHSWgzHZkV3LNfLOSSTq0pV4Q&sig2=razCT0kUDv2-BIm_8gTE5g&bvm=bv.61725948,d.ZGU),
>>> the status is checked like this:
>>>
>>> while (header->tp_status & TP_STATUS_USER && count < RING_NUM_FRAMES) {
>>> [...]
>>>
>>> I haven't yet figured out how TP_STATUS_LOSING works, but I think it
>>> would be worthwhile to at least document that the status is a bit mask
>>> and not a value - that's what the patch at the end does.
>>>
>>> Michael, maybe you can Cc somebody more knowledgeable on this to
>>> confirm? IIRC there were some message exchanges on this on the list
>>> recently...
>>>
>>>
>>> diff --git a/man7/packet.7 b/man7/packet.7
>>> index 1d3f222..6bac465 100644
>>> --- a/man7/packet.7
>>> +++ b/man7/packet.7
>>> @@ -353,9 +353,9 @@ The packet socket owns all slots with status
>>>   .BR TP_STATUS_KERNEL .
>>>   After filling a slot, it changes the status of the slot to transfer
>>>   ownership to the application.
>>> -During normal operation, the new status is
>>> -.BR TP_STATUS_USER ,
>>> -to signal that a correctly received packet has been stored.
>>> +During normal operation, the new status has the
>>> +.BR TP_STATUS_USER
>>> +bit set to signal that a correctly received packet has been stored.
>>>   When the application has finished processing a packet, it transfers
>>>   ownership of the slot back to the socket by setting the status to
>>> --
>>> To unsubscribe from this list: send the line "unsubscribe linux-man" in
>>> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
>>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>>
>>
>>
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
