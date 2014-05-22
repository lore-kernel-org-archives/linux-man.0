From: Carsten Andrich <carsten.andrich-hs6bpBdVsEZfm0AUMx9V0g@public.gmane.org>
Subject: Re: Improving =?UTF-8?Q?PACKET=5F=7BRX=2CTX=7D=5FRING=20documenta?=
 =?UTF-8?Q?tion?=
Date: Thu, 22 May 2014 14:22:22 +0200
Message-ID: <d1afaaacb05c031517bb96211c098edf@localhost>
References: <1400332406.2395.35.camel@actium.fritz.box>
 <53798E97.1000505@gmail.com> <5379D9A2.1070008@redhat.com>
 <CA+FuTSeWh_iQGqc-4usL7vr28OrkHTnBvHvXvVO=LcGsNRgtMA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain;
 charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CA+FuTSeWh_iQGqc-4usL7vr28OrkHTnBvHvXvVO=LcGsNRgtMA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Willem de Bruijn <willemb-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Cc: Daniel Borkmann <dborkman-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Neil Horman <nhorman-2XuSBdqkA4R54TAoqtyWWQ@public.gmane.org>, jbrouer-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Thanks for the feedback, Daniel and Willem.

Executive summary: We need a good concept for distributing (preferably
mutually exclusive) information among packet(7) and packet_mmap.txt.

Willem de Bruijn schrieb:
>>     0. Perhaps a general writeup on how the RX/TX_RING works in Linux,
>>        it's layout, constraints etc. Btw, not sure if that's also
> 
> This would duplicate the contents of
> Documentation/networking/packet_mmap.txt? I would caution against
> having two sources of documentation that may become inconsistent over
> time. A detailed discussion could also become too long for a manual
> page: packet_mmap.txt is already 1067 lines (albeit about half in
> example code). If that document is confusing, a thorough edit of that
> would be very helpful, though.
> 
>>        included already, but the same mmap-technique exists also for
>>        netlink sockets.
> 
> See also Documentation/networking/netlink_mmap.txt . If the ring is a
> generic netlink feature (i.e., not specific to nfnetlink), then man 7
> netlink is the right place for user documentation (in as far as this
> is a user-oriented feature).

Some deduplication between netlink(7), packet(7), netlink_mmap.txt and
packet_mmap.txt is probably a good idea. However, this is much more than
I initially bargained for :)
I had a superficial look at the netlink documents, and most concepts
appear to be very much alike. The operational aspects make quite a large
exception, though, since the netlink header (usage) is a lot simpler
than tpacket_hdr including its different versions.

IMHO user-space API documentation should reside in the man page and not
Documentation/, but I'd like to heard Michael's opinion on that. Maybe
it's a good idea to have at least a basic description on packet(7) and
reserve packet_mmap.txt for the more advanced topics?

>>>>       1. Increase detail of PACKET_{RX,TX}_RING socket options, including
>>>>          description of struct tpacket_hdr and anything else required to
>>>>          operate the ring.
> 
> If expanding the man page, then moving mmap into a separate section
> sounds good to me. If a man page is more user documentation than
> kernel Documentation/ then perhaps start by discussing the pros and
> cons of mmapped rings over recv and to help users decide whether to
> use the mmapped ring, or for instance batch with recvmmsg().

Actually I wanted to maintain the structure of the man page and
describe everything inside the appropriate "Socket options" sections.
However, adding a reference to recvmmsg() is a good idea as well, which
would justify creating a new sections for "Advanced packet socket
techniques".

>>>>       2. Move some details from other sockopts (e.g. PACKET_LOSS) into
>>>>          *_RING.
> 
> Yes, please move all ring-specific details into the new ring section.
> 
>>>>       3. Add fully functional example source code for simple
>>>>          PACKET_{RX,TX}_RING operation (initialization and operation).
>>>>          This may be as much as 3 different example programs if I
>>>>          incorporate [2] and [3] in an appropriate manner. It might be a
>>>>          good idea to add a non-*_RING example as well.
>>
>>
>> Yes, some examples for mmap RX, mmap TX, fanout, and perhaps TPACKET_V3
>> might be great.
>>
>>
>>>>       4. Add a warning about inferior _TX_RING performance [1] which I
>>>>          suffered from only recently in the measurements I made for my
>>>>          thesis on Linux 3.14.
> 
> I would describe such points in a positive manner (optimization) as
> opposed to a negative (inferior performance).

Using positive wording is always a good idea, but packet_mmap.txt
already tricked me into believing that PACKET_TX_RING should be faster
than plain sendto(). The user should be allowed to make an informed
decision, which requires the manpage to tell the (ugly) truth that
sendto() currently outperforms TX_RING.

> The optimization you refer to is to attach the tx-only packet socket
> to a protocol family that is never observed, so that no packets are
> looped back into the socket on receive. This is a great trick. There
> are probably others. Again, I believe that such details belong more in
> packet_mmap.txt than in the man page. But that is just one opinion, so
> I'll gladly defer to Michael and others on that point.

Since the tx-only optimization socket(*, *, 0) is not TX_RING-specific,
this should be in the manpage (IMHO). As I said above, packet_mmap.txt
may be a decent spot for advanced and {RX,TX}_RING-specific techniques.

>> Can you elaborate? Jesper made recently a nice summary on using trafgen
>> which uses TX_RING internally:
>>
>>   http://netoptimizer.blogspot.ch/2014/04/trafgen-fast-packet-generator.html

For my thesis I implemented a programmable switch in user-space (for
better programmability and guaranteed API compatibility). Testing with
64-byte frames I reached a maximum frame rate of ~0.6 Mpps using
{RX,TX}_RING, but ~0.87 Mpps using plain recvfrom()/sendto(). A hybrid
RX_RING/sendto() approach with seperate RX/TX threads yielded the same
frame rate as tests with pktgen (~0.89 Mpps). Fun fact: Open vSwitch
reached ~1 Mpps and thus surprisingly surpassed pktgen. This might be
worth investigating.

>> Absolutely, perhaps explaining differences from TPACKET_V1 -> V3 API and the
>> like.
> 
> That would be very interesting. The packet -> block batching mechanism
> likely was tested with small packet performance, but may have little
> benefit for larger packets. A discussion of the trade offs from a user
> point of view would be very interesting.

Actually I intended to deal only with TPACKET_V2 for now, since it is
simpler than TPACKET_V3 and can be use for RX and TX. TPACKET_V3 can be
added later on or could remain in packet_mmap.txt.


Cheers,
Carsten

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
