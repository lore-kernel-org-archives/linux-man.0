From: Willem de Bruijn <willemb-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Subject: Re: Improving PACKET_{RX,TX}_RING documentation
Date: Mon, 19 May 2014 11:05:55 -0400
Message-ID: <CA+FuTSeWh_iQGqc-4usL7vr28OrkHTnBvHvXvVO=LcGsNRgtMA@mail.gmail.com>
References: <1400332406.2395.35.camel@actium.fritz.box> <53798E97.1000505@gmail.com>
 <5379D9A2.1070008@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5379D9A2.1070008-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Daniel Borkmann <dborkman-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Carsten Andrich <carsten.andrich-hs6bpBdVsEZfm0AUMx9V0g@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Neil Horman <nhorman-2XuSBdqkA4R54TAoqtyWWQ@public.gmane.org>, jbrouer-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Mon, May 19, 2014 at 6:14 AM, Daniel Borkmann <dborkman-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> wrote:
> Hi Carsten,
>
>
> On 05/19/2014 06:54 AM, Michael Kerrisk (man-pages) wrote:
>>
>> On 05/17/2014 03:13 PM, Carsten Andrich wrote:
>>>
>>> Hello again everyone,
>>>
>>> roughly 3 weeks ago the aftermath of an actually minor patch to fix an
>>> inaccuracy in packet.7's PACKET_TX_RING-related documentation led me to
>>> offer improving the entire PACKET_{RX,TX}_RING-documentation.
>>> Since I do happen to have most of my spare time back by now, I'd like to
>>> tackle this effort before I change my mind :)
>>
>>
>> Thanks for following up!

Indeed!

>>
>>> On 04/24/2014 12:21 PM, Michael Kerrisk (man-pages) wrote:
>>>>
>>>> I'd leave that plan largely to you. It sounds like Willem and
>>>> Daniel are willing to help out.
>>>
>>>
>>> I'd like to start with getting packet.7's documentation of
>>> PACKET_{RX,TX}_RING into a shape, that should allow most readers to
>>> actually use it without consulting packet_mmap.txt. The latter can be
>>> quite confusing for those unfamiliar with PACKET_{RX,TX}_RING.
>>>
>>> I plan to do the following to packet.7:
>
>
>     0. Perhaps a general writeup on how the RX/TX_RING works in Linux,
>        it's layout, constraints etc. Btw, not sure if that's also

This would duplicate the contents of
Documentation/networking/packet_mmap.txt? I would caution against
having two sources of documentation that may become inconsistent over
time. A detailed discussion could also become too long for a manual
page: packet_mmap.txt is already 1067 lines (albeit about half in
example code). If that document is confusing, a thorough edit of that
would be very helpful, though.

>        included already, but the same mmap-technique exists also for
>        netlink sockets.

See also Documentation/networking/netlink_mmap.txt . If the ring is a
generic netlink feature (i.e., not specific to nfnetlink), then man 7
netlink is the right place for user documentation (in as far as this
is a user-oriented feature).

>>>       1. Increase detail of PACKET_{RX,TX}_RING socket options, including
>>>          description of struct tpacket_hdr and anything else required to
>>>          operate the ring.

If expanding the man page, then moving mmap into a separate section
sounds good to me. If a man page is more user documentation than
kernel Documentation/ then perhaps start by discussing the pros and
cons of mmapped rings over recv and to help users decide whether to
use the mmapped ring, or for instance batch with recvmmsg().

>>>       2. Move some details from other sockopts (e.g. PACKET_LOSS) into
>>>          *_RING.

Yes, please move all ring-specific details into the new ring section.

>>>       3. Add fully functional example source code for simple
>>>          PACKET_{RX,TX}_RING operation (initialization and operation).
>>>          This may be as much as 3 different example programs if I
>>>          incorporate [2] and [3] in an appropriate manner. It might be a
>>>          good idea to add a non-*_RING example as well.
>
>
> Yes, some examples for mmap RX, mmap TX, fanout, and perhaps TPACKET_V3
> might be great.
>
>
>>>       4. Add a warning about inferior _TX_RING performance [1] which I
>>>          suffered from only recently in the measurements I made for my
>>>          thesis on Linux 3.14.

I would describe such points in a positive manner (optimization) as
opposed to a negative (inferior performance).

The optimization you refer to is to attach the tx-only packet socket
to a protocol family that is never observed, so that no packets are
looped back into the socket on receive. This is a great trick. There
are probably others. Again, I believe that such details belong more in
packet_mmap.txt than in the man page. But that is just one opinion, so
I'll gladly defer to Michael and others on that point.

>
>
> Can you elaborate? Jesper made recently a nice summary on using trafgen
> which uses TX_RING internally:
>
>   http://netoptimizer.blogspot.ch/2014/04/trafgen-fast-packet-generator.html

>
>
>>>       5. Other minor changes that'll come up while taking care of 1 thru
>>>          4 :)
>
>
> Absolutely, perhaps explaining differences from TPACKET_V1 -> V3 API and the
> like.

That would be very interesting. The packet -> block batching mechanism
likely was tested with small packet performance, but may have little
benefit for larger packets. A discussion of the trade offs from a user
point of view would be very interesting.

>>> Any suggestions regarding this rough course of action?
>>
>>
>> Well, I can't speak to the fine technical details, but the plan looks
>> rational to me. Perhaps Neil, Willem, or Daniel has a comment.
>>
>> Just by the way, I suggest CCing netdeve-u79uwXL29TY76Z2rM5mHXA@public.gmane.org on all patches.
>> It may be that someone else also comments.
>>
>> Cheers,
>>
>> Michael
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
