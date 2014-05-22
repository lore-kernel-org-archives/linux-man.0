From: Jesper Dangaard Brouer <jbrouer-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: Improving PACKET_{RX,TX}_RING documentation
Date: Thu, 22 May 2014 15:37:55 +0200
Message-ID: <20140522153755.13aa7f5a@redhat.com>
References: <1400332406.2395.35.camel@actium.fritz.box>
	<53798E97.1000505@gmail.com>
	<5379D9A2.1070008@redhat.com>
	<CA+FuTSeWh_iQGqc-4usL7vr28OrkHTnBvHvXvVO=LcGsNRgtMA@mail.gmail.com>
	<d1afaaacb05c031517bb96211c098edf@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <d1afaaacb05c031517bb96211c098edf@localhost>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Carsten Andrich <carsten.andrich-hs6bpBdVsEZfm0AUMx9V0g@public.gmane.org>
Cc: Willem de Bruijn <willemb-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Daniel Borkmann <dborkman-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Neil Horman <nhorman-2XuSBdqkA4R54TAoqtyWWQ@public.gmane.org>
List-Id: linux-man@vger.kernel.org


On Thu, 22 May 2014 14:22:22 +0200 Carsten Andrich <carsten.andrich-hs6bpBdVsEZfm0AUMx9V0g@public.gmane.org> wrote:

> Using positive wording is always a good idea, but packet_mmap.txt
> already tricked me into believing that PACKET_TX_RING should be faster
> than plain sendto(). The user should be allowed to make an informed
> decision, which requires the manpage to tell the (ugly) truth that
> sendto() currently outperforms TX_RING.

See:
https://github.com/netsniff-ng/netsniff-ng/commit/d21b30bd64fdf4e7358037aa2d6f0cea02c49b6e

With most recent trafgen using small packets, TX_RING version is faster than sendto().

 
> > The optimization you refer to is to attach the tx-only packet socket
> > to a protocol family that is never observed, so that no packets are
> > looped back into the socket on receive. This is a great trick. There
> > are probably others. Again, I believe that such details belong more in
> > packet_mmap.txt than in the man page. But that is just one opinion, so
> > I'll gladly defer to Michael and others on that point.

See commit, on how to avoid the packet_rcv() call:
https://github.com/netsniff-ng/netsniff-ng/commit/c3602a995b21e8133c7f

It differs a little sendto() vs. TX_RING setup.

-- 
Best regards,
  Jesper Dangaard Brouer
  MSc.CS, Sr. Network Kernel Developer at Red Hat
  Author of http://www.iptv-analyzer.org
  LinkedIn: http://www.linkedin.com/in/brouer
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
