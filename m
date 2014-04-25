From: Neil Horman <nhorman-2XuSBdqkA4R54TAoqtyWWQ@public.gmane.org>
Subject: Re: [patch] getsockopt.2, packet.7: improve sockopt documentation
 for packet sockets
Date: Fri, 25 Apr 2014 07:02:18 -0400
Message-ID: <20140425110218.GA14074@hmsreliant.think-freely.org>
References: <1398356057.1966.14.camel@x201.fritz.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1398356057.1966.14.camel-DYJrb7SVE5twFLYp8hBm2A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Carsten Andrich <carsten.andrich-hs6bpBdVsEZfm0AUMx9V0g@public.gmane.org>
Cc: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, lnx-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Willem de Bruijn <willemb-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Daniel Borkmann <dborkman-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Stefan Puiu <stefan.puiu-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On Thu, Apr 24, 2014 at 06:14:17PM +0200, Carsten Andrich wrote:
> Hello everyone,
> 
> building up on Stefan's and my patches and Daniel's useful hint
> regarding filter.txt, I assembled this short patch.
> 
> It attempts to clarify the tp_status situtation, considering that zero
> has a special meaning and most bits are actually mutually exclusive.
> 
> I added filter.txt and and Daniel's and Chetan's excellent
> psock_tpacket.c (IIRC Michael has already done that, but not yet pushed
> to the public git repo) to the "see also" section.
> I also appended packet.7 to getsockopt.2's "see also" section.
> 
> Cheers,
> Carsten
> 
> 
> diff --git a/man2/getsockopt.2 b/man2/getsockopt.2
> index 925fa90..151cd31 100644
> --- a/man2/getsockopt.2
> +++ b/man2/getsockopt.2
> @@ -205,6 +205,7 @@ system.
>  .BR getprotoent (3),
>  .BR protocols (5),
>  .BR ip (7),
> +.BR packet (7),
>  .BR socket (7),
>  .BR tcp (7),
>  .BR udp (7),
> diff --git a/man7/packet.7 b/man7/packet.7
> index d8257f9..1ffcf32 100644
> --- a/man7/packet.7
> +++ b/man7/packet.7
> @@ -319,9 +319,20 @@ original fanout algorithm selects a backlogged socket, the packet
>  rolls over to the next available one.
>  .TP
>  .BR PACKET_LOSS " (with " PACKET_TX_RING )
> -If set, do not silently drop a packet on transmission error, but
> -return it with status set to
> -.BR TP_STATUS_WRONG_FORMAT .
> +When a malformed packet is encountered on a transmit ring, the default is
> +to reset its
> +.I tp_status
> +to
> +.BR TP_STATUS_WRONG_FORMAT
> +and abort the transmission immediately (it and following packets are left
> +lingering on the ring).

I'm not sure this is 100% clear.  Any of these error status flags leave the
packet in memory on the ring.  WRONG_FORMAT, doesn't do anything special here.

The rest of teh packet changes look good to me.

Best
Neil

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
