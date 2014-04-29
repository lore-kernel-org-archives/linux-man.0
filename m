From: Neil Horman <nhorman-2XuSBdqkA4R54TAoqtyWWQ@public.gmane.org>
Subject: Re: [patch] getsockopt.2, packet.7: improve sockopt documentation
 for packet sockets
Date: Tue, 29 Apr 2014 06:51:18 -0400
Message-ID: <20140429105118.GA11686@hmsreliant.think-freely.org>
References: <1398356057.1966.14.camel@x201.fritz.box>
 <20140425110218.GA14074@hmsreliant.think-freely.org>
 <1398465760.6683.33.camel@actium.fritz.box>
 <20140428133444.GD16041@hmsreliant.think-freely.org>
 <1398698632.2988.10.camel@actium.fritz.box>
 <20140428172815.GG16041@hmsreliant.think-freely.org>
 <1398708750.2988.18.camel@actium.fritz.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1398708750.2988.18.camel-FQO4gtnRtnzkVFMGpb/cPg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Carsten Andrich <carsten.andrich-hs6bpBdVsEZfm0AUMx9V0g@public.gmane.org>
Cc: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, lnx-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Willem de Bruijn <willemb-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Daniel Borkmann <dborkman-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Stefan Puiu <stefan.puiu-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On Mon, Apr 28, 2014 at 08:12:30PM +0200, Carsten Andrich wrote:
> Am Montag, den 28.04.2014, 13:28 -0400 schrieb Neil Horman:
> > Rather than 'lingernig' perhaps more exact language to indicate that positive
> > action is required from the application.  Perhaps:
> > 
> > Packets in the WRONG_FORMAT state block the kernel from sending it and subsequent
> > packets on the ring.  Packet in the WRONG_FORMAT state must be moved to the
> > AVAILABLE or SEND_REQUEST state (after correcting format errors), so that the
> > next application call to send() properly transmits the frame.
> 
> Thanks for the suggestion! I incorporated it into the following updated
> PACKET_LOSS description:
> When a malformed packet is encountered on a transmit ring, the default
> is to reset its tp_status to TP_STATUS_WRONG_FORMAT and abort the
> transmission immediately.  The malformed  packet  blocks  itself  and
> subsequent enqueued  packets from being sent.  The format error must be
> fixed, the associated tp_status reset to TP_STATUS_SEND_REQUEST and the
> transmission process restarted via send(2).  However, if PACKET_LOSS is
> set, any malformed packet will be skipped, its tp_status reset to
> TP_STATUS_AVAILABLE, and the transmission process continued.
> 
> IMHO this should go into the PACKET_TX_RING description, but I'd like to
> defer that until I have a little more spare time on my hands, so I can
> tackle the entire PACKET_MMAP-related part of the man-page in a single
> effort.
> 
> Updated patch follows.
> 
> Cheers,
> Carsten
> 

Acked-by: Neil Horman <nhorman-2XuSBdqkA4R54TAoqtyWWQ@public.gmane.org>
Thanks!
Neil

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
