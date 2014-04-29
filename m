From: Neil Horman <nhorman-2XuSBdqkA4R54TAoqtyWWQ@public.gmane.org>
Subject: Re: [patch] getsockopt.2, packet.7: improve sockopt documentation
 for packet sockets
Date: Tue, 29 Apr 2014 09:11:21 -0400
Message-ID: <20140429131121.GA14945@hmsreliant.think-freely.org>
References: <o3okqw7ix4iaf8ukfb6ufhie.1398770460424@email.android.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <o3okqw7ix4iaf8ukfb6ufhie.1398770460424-2ueSQiBKiTY7tOexoI0I+QC/G2K4zDHf@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Carsten Andrich <carsten.andrich-hs6bpBdVsEZfm0AUMx9V0g@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, lnx-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Stefan Puiu <stefan.puiu-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On Tue, Apr 29, 2014 at 01:22:24PM +0200, Carsten Andrich wrote:
> As far as I'm concerned, it is.
> Thanks, Neil.
> 
No problem.
Neil

> Cheers,
> Carsten
> 
> "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> schrieb:
> 
> >Hi Carsten,
> >
> >On Tue, Apr 29, 2014 at 12:51 PM, Neil Horman <nhorman-2XuSBdqkA4R54TAoqtyWWQ@public.gmane.org> wrote:
> >> On Mon, Apr 28, 2014 at 08:12:30PM +0200, Carsten Andrich wrote:
> >>> Am Montag, den 28.04.2014, 13:28 -0400 schrieb Neil Horman:
> >>> > Rather than 'lingernig' perhaps more exact language to indicate that positive
> >>> > action is required from the application.  Perhaps:
> >>> >
> >>> > Packets in the WRONG_FORMAT state block the kernel from sending it and subsequent
> >>> > packets on the ring.  Packet in the WRONG_FORMAT state must be moved to the
> >>> > AVAILABLE or SEND_REQUEST state (after correcting format errors), so that the
> >>> > next application call to send() properly transmits the frame.
> >>>
> >>> Thanks for the suggestion! I incorporated it into the following updated
> >>> PACKET_LOSS description:
> >>> When a malformed packet is encountered on a transmit ring, the default
> >>> is to reset its tp_status to TP_STATUS_WRONG_FORMAT and abort the
> >>> transmission immediately.  The malformed  packet  blocks  itself  and
> >>> subsequent enqueued  packets from being sent.  The format error must be
> >>> fixed, the associated tp_status reset to TP_STATUS_SEND_REQUEST and the
> >>> transmission process restarted via send(2).  However, if PACKET_LOSS is
> >>> set, any malformed packet will be skipped, its tp_status reset to
> >>> TP_STATUS_AVAILABLE, and the transmission process continued.
> >>>
> >>> IMHO this should go into the PACKET_TX_RING description, but I'd like to
> >>> defer that until I have a little more spare time on my hands, so I can
> >>> tackle the entire PACKET_MMAP-related part of the man-page in a single
> >>> effort.
> >>>
> >>> Updated patch follows.
> >>>
> >>> Cheers,
> >>> Carsten
> >>>
> >>
> >> Acked-by: Neil Horman <nhorman-2XuSBdqkA4R54TAoqtyWWQ@public.gmane.org>
> >
> >So, with Neil's Ack, is this patch ready to apply now?
> >
> >Cheers,
> >
> >Michael
> >
> >
> >-- 
> >Michael Kerrisk
> >Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
> >Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
