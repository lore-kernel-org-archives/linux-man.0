From: Daniel Borkmann <dborkman-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: Improving PACKET_{RX,TX}_RING documentation
Date: Mon, 19 May 2014 12:14:58 +0200
Message-ID: <5379D9A2.1070008@redhat.com>
References: <1400332406.2395.35.camel@actium.fritz.box> <53798E97.1000505@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <53798E97.1000505-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Carsten Andrich <carsten.andrich-hs6bpBdVsEZfm0AUMx9V0g@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Willem de Bruijn <willemb-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Neil Horman <nhorman-2XuSBdqkA4R54TAoqtyWWQ@public.gmane.org>, jbrouer-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi Carsten,

On 05/19/2014 06:54 AM, Michael Kerrisk (man-pages) wrote:
> On 05/17/2014 03:13 PM, Carsten Andrich wrote:
>> Hello again everyone,
>>
>> roughly 3 weeks ago the aftermath of an actually minor patch to fix an
>> inaccuracy in packet.7's PACKET_TX_RING-related documentation led me to
>> offer improving the entire PACKET_{RX,TX}_RING-documentation.
>> Since I do happen to have most of my spare time back by now, I'd like to
>> tackle this effort before I change my mind :)
>
> Thanks for following up!
>
>> On 04/24/2014 12:21 PM, Michael Kerrisk (man-pages) wrote:
>>> I'd leave that plan largely to you. It sounds like Willem and
>>> Daniel are willing to help out.
>>
>> I'd like to start with getting packet.7's documentation of
>> PACKET_{RX,TX}_RING into a shape, that should allow most readers to
>> actually use it without consulting packet_mmap.txt. The latter can be
>> quite confusing for those unfamiliar with PACKET_{RX,TX}_RING.
>>
>> I plan to do the following to packet.7:

     0. Perhaps a general writeup on how the RX/TX_RING works in Linux,
        it's layout, constraints etc. Btw, not sure if that's also
        included already, but the same mmap-technique exists also for
        netlink sockets.

>>       1. Increase detail of PACKET_{RX,TX}_RING socket options, including
>>          description of struct tpacket_hdr and anything else required to
>>          operate the ring.
>>       2. Move some details from other sockopts (e.g. PACKET_LOSS) into
>>          *_RING.
>>       3. Add fully functional example source code for simple
>>          PACKET_{RX,TX}_RING operation (initialization and operation).
>>          This may be as much as 3 different example programs if I
>>          incorporate [2] and [3] in an appropriate manner. It might be a
>>          good idea to add a non-*_RING example as well.

Yes, some examples for mmap RX, mmap TX, fanout, and perhaps TPACKET_V3
might be great.

>>       4. Add a warning about inferior _TX_RING performance [1] which I
>>          suffered from only recently in the measurements I made for my
>>          thesis on Linux 3.14.

Can you elaborate? Jesper made recently a nice summary on using trafgen
which uses TX_RING internally:

   http://netoptimizer.blogspot.ch/2014/04/trafgen-fast-packet-generator.html

>>       5. Other minor changes that'll come up while taking care of 1 thru
>>          4 :)

Absolutely, perhaps explaining differences from TPACKET_V1 -> V3 API and the like.

>> Any suggestions regarding this rough course of action?
>
> Well, I can't speak to the fine technical details, but the plan looks
> rational to me. Perhaps Neil, Willem, or Daniel has a comment.
>
> Just by the way, I suggest CCing netdeve-u79uwXL29TY76Z2rM5mHXA@public.gmane.org on all patches.
> It may be that someone else also comments.
>
> Cheers,
>
> Michael
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
