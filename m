From: Carsten Andrich <carsten.andrich-hs6bpBdVsEZfm0AUMx9V0g@public.gmane.org>
Subject: Re: [patch] getsockopt.2, packet.7: improve sockopt documentation
 for packet sockets
Date: Mon, 28 Apr 2014 17:23:52 +0200
Message-ID: <1398698632.2988.10.camel@actium.fritz.box>
References: <1398356057.1966.14.camel@x201.fritz.box>
	 <20140425110218.GA14074@hmsreliant.think-freely.org>
	 <1398465760.6683.33.camel@actium.fritz.box>
	 <20140428133444.GD16041@hmsreliant.think-freely.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140428133444.GD16041-B26myB8xz7F8NnZeBjwnZQMhkBWG/bsMQH7oEaQurus@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Neil Horman <nhorman-2XuSBdqkA4R54TAoqtyWWQ@public.gmane.org>
Cc: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, lnx-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Willem de Bruijn <willemb-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Daniel Borkmann <dborkman-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Stefan Puiu <stefan.puiu-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Am Montag, den 28.04.2014, 09:34 -0400 schrieb Neil Horman:
> On Sat, Apr 26, 2014 at 12:42:40AM +0200, Carsten Andrich wrote:
> > Am Freitag, den 25.04.2014, 07:02 -0400 schrieb Neil Horman:
> > > On Thu, Apr 24, 2014 at 06:14:17PM +0200, Carsten Andrich wrote:
> > > [...]
> > > > +When a malformed packet is encountered on a transmit ring, the default is
> > > > +to reset its
> > > > +.I tp_status
> > > > +to
> > > > +.BR TP_STATUS_WRONG_FORMAT
> > > > +and abort the transmission immediately (it and following packets are left
> > > > +lingering on the ring).
> > > 
> > > I'm not sure this is 100% clear.  Any of these error status flags leave the
> > > packet in memory on the ring.  WRONG_FORMAT, doesn't do anything special here.
> > 
> > The RX-related flags simply denote additional information, which are not
> > essential for RX ring operation, i.e. it won't hurt you if you ignore
> > them.
> > 
> > TP_STATUS_WRONG_FORMAT is different. It's only set if the transmission
> > process is aborted by the kernel. If this occurs the sendto()-call will
> > return EINVAL. In this case you have to walk the ring backwards from the
> > current userspace frame pointer, look for a frame with tp_status ==
> > TP_STATUS_WRONG_FORMAT, fix it and set its tp_status =
> > TP_STATUS_SEND_REQUEST. I assume PACKET_LOSS was introduced to obviate
> > the need to do this.
> > 
> > This should qualify TP_STATUS_WRONG_FORMAT as special. This behaviour
> > probably deserves a little more detail in the man-page, but I'll defer
> > that until the general overhaul takes place.
> > 
> > I've hacked up a demonstration and attached it.
> > Sorry, I'm a freedom-fighter against the 80-character-oppression :)
> > 
> > I also updated my patch for merge-less application to current
> > git-master:
> > 
> I'm fine with the example, its the specific reference to the statement "it and
> following packets are left lingering on the ring".  Thats not special in
> relation to WRONG_FORMAT.  Even if a packet transmits successfully and gets its
> status set back to AVAILABLE, the data of the packet is still in the ring and
> can be recovered by user space.  Thats all I'm getting at.
> Neil

I put the lingering-thingy into the TP_STATUS_WRONG_FORMAT description
to emphasize, that packets that have actually been scheduled for
transmission are still waiting for user-space to clean up its self-made
mess and retrigger the transmission.
Of course packets don't just vanish from the ring, I just though that
this very case deserves to have this explicitly mentioned. Facts like
these may not be entirely self-evident to the occasional PACKET_MMAP
user and/or man-page reader.

But lets cut this short ;)

Do you have any concrete suggestions on how to improve the phrasing?

Cheers,
Carsten

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
