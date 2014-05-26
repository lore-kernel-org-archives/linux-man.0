From: Carsten Andrich <carsten.andrich-hs6bpBdVsEZfm0AUMx9V0g@public.gmane.org>
Subject: Re: Improving =?UTF-8?Q?PACKET=5F=7BRX=2CTX=7D=5FRING=20documenta?=
 =?UTF-8?Q?tion?=
Date: Mon, 26 May 2014 12:49:30 +0200
Message-ID: <f892062de194e1414fec56672a423eea@localhost>
References: <1400332406.2395.35.camel@actium.fritz.box>
 <53798E97.1000505@gmail.com> <5379D9A2.1070008@redhat.com>
 <CA+FuTSeWh_iQGqc-4usL7vr28OrkHTnBvHvXvVO=LcGsNRgtMA@mail.gmail.com>
 <d1afaaacb05c031517bb96211c098edf@localhost>
 <CA+FuTSfpORKtm_kdG+CycoPiq+Gxf58=nXqKApFEmR+xZs69_g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain;
 charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CA+FuTSfpORKtm_kdG+CycoPiq+Gxf58=nXqKApFEmR+xZs69_g-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Willem de Bruijn <willemb-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Cc: Daniel Borkmann <dborkman-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Neil Horman <nhorman-2XuSBdqkA4R54TAoqtyWWQ@public.gmane.org>, jbrouer-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Willem de Bruijn schrieb:
>>> I would describe such points in a positive manner (optimization) as
>>> opposed to a negative (inferior performance).
>>
>> Using positive wording is always a good idea, but packet_mmap.txt
>> already tricked me into believing that PACKET_TX_RING should be faster
>> than plain sendto(). The user should be allowed to make an informed
>> decision,
> 
> Indeed. The document should not contain any simple statements about
> one option being faster than another, because this invariably depends on
> workload details (packet size, rate, threading, ...).
> 
> Instead, it should just explain the technical details and their implications:
> an mmapped ring reduces the number of system calls, as does
> recvmmsg/sendmmsg. It does not necessarily reduce the number of
> data copies (a common misconception). Etcetera.
> 
>> which requires the manpage to tell the (ugly) truth that
>> sendto() currently outperforms TX_RING.
> 
> I would not make such statements either way, then.

You're right. I'll just a note regarding the necessity of careful
performance considerations/evaluations :)
Maybe, eventually, some of Jesper's findings regarding *_RING
performance should end up in packet_mmap.txt.

>>>> Absolutely, perhaps explaining differences from TPACKET_V1 -> V3 API and the
>>>> like.
>>>
>>> That would be very interesting. The packet -> block batching mechanism
>>> likely was tested with small packet performance, but may have little
>>> benefit for larger packets. A discussion of the trade offs from a user
>>> point of view would be very interesting.
>>
>> Actually I intended to deal only with TPACKET_V2 for now, since it is
>> simpler than TPACKET_V3 and can be use for RX and TX. TPACKET_V3 can be
>> added later on or could remain in packet_mmap.txt.
> 
> Sure, let's leave that.
> 
> Your plan sounds good to me, Carsten.

Okay, it might take me a few weeks to come up with a first draft.

Cheers,
Carsten
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
