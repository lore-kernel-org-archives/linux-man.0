From: Carsten Andrich <carsten.andrich-hs6bpBdVsEZfm0AUMx9V0g@public.gmane.org>
Subject: Improving PACKET_{RX,TX}_RING documentation
Date: Sat, 17 May 2014 15:13:26 +0200
Message-ID: <1400332406.2395.35.camel@actium.fritz.box>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Daniel Borkmann <dborkman-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Willem de Bruijn <willemb-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Neil Horman <nhorman-2XuSBdqkA4R54TAoqtyWWQ@public.gmane.org>, Michael Kerrisk-manpages <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hello again everyone,

roughly 3 weeks ago the aftermath of an actually minor patch to fix an
inaccuracy in packet.7's PACKET_TX_RING-related documentation led me to
offer improving the entire PACKET_{RX,TX}_RING-documentation.
Since I do happen to have most of my spare time back by now, I'd like to
tackle this effort before I change my mind :)

On 04/24/2014 12:21 PM, Michael Kerrisk (man-pages) wrote:
> I'd leave that plan largely to you. It sounds like Willem and
> Daniel are willing to help out.

I'd like to start with getting packet.7's documentation of
PACKET_{RX,TX}_RING into a shape, that should allow most readers to
actually use it without consulting packet_mmap.txt. The latter can be
quite confusing for those unfamiliar with PACKET_{RX,TX}_RING.

I plan to do the following to packet.7:
     1. Increase detail of PACKET_{RX,TX}_RING socket options, including
        description of struct tpacket_hdr and anything else required to
        operate the ring.
     2. Move some details from other sockopts (e.g. PACKET_LOSS) into
        *_RING.
     3. Add fully functional example source code for simple
        PACKET_{RX,TX}_RING operation (initialization and operation).
        This may be as much as 3 different example programs if I
        incorporate [2] and [3] in an appropriate manner. It might be a
        good idea to add a non-*_RING example as well.
     4. Add a warning about inferior _TX_RING performance [1] which I
        suffered from only recently in the measurements I made for my
        thesis on Linux 3.14.
     5. Other minor changes that'll come up while taking care of 1 thru
        4 :)

Any suggestions regarding this rough course of action?

Cheers,
Carsten

[1]https://github.com/netsniff-ng/netsniff-ng/commit/c3602a9
[2]https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/Documentation/networking/packet_mmap.txt?id=66e56cd46b93ef407c60adcac62cf33b06119d50
[3]https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/Documentation/networking/packet_mmap.txt?id=7e11daa7c19ec319fa4b750fd249a18957f17797

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
