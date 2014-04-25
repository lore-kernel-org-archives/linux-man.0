From: Stefan Puiu <stefan.puiu-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: status in PACKET_RX_RING is actually a bit mask
Date: Fri, 25 Apr 2014 09:39:05 +0300
Message-ID: <CACKs7VCaLfmCR1tRKNcdCG8PESqPcEvoMwrR37FNM65VbYN2aw@mail.gmail.com>
References: <CACKs7VD6a0hzMd_Go6yUAxJ=tbYdJ9Qbq=FXQezVvaUUE9egUw@mail.gmail.com>
	<CACKs7VAUE89+NyuywOwpZ2GzeVQLtV_A-+4PicErmCzLNNNd6Q@mail.gmail.com>
	<CAKgNAkhJO2ZMpMf6BiaW7TRUd6jvLFU7yPN7xKH9fDoVPPr=tA@mail.gmail.com>
	<5358C4FC.80204@redhat.com>
	<CAKgNAkjwHkba6NktfNK9nRUUAwcYeFK5aGBgov1tcuipy4mPdw@mail.gmail.com>
	<5358C7E0.9040704@redhat.com>
	<a8bac93e5e046516a01b2b1952c8cae5@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <a8bac93e5e046516a01b2b1952c8cae5@localhost>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Carsten Andrich <carsten.andrich-hs6bpBdVsEZfm0AUMx9V0g@public.gmane.org>
Cc: Daniel Borkmann <dborkman-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Michael Kerrisk-manpages <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, lnx-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Willem de Bruijn <willemb-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Neil Horman <nhorman-2XuSBdqkA4R54TAoqtyWWQ@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hi Carsten,

On Thu, Apr 24, 2014 at 12:17 PM, Carsten Andrich
<carsten.andrich-hs6bpBdVsEZfm0AUMx9V0g@public.gmane.org> wrote:
> I'd ack the patch, too.
> However if we start clarifying the bitmask situation, we should do it
> properly. packet.7 mentions TP_STATUS_xyz several times and never
> actually differentiates between setting bits and setting the whole
> tp_status variable. Actually both occurs inside the kernel:
> http://lingrok.org/xref/linux-net-next/net/packet/af_packet.c#798
> http://lingrok.org/xref/linux-net-next/net/packet/af_packet.c#2300

Note the section I touched covers PACKET_RX_RING. The second
occurrence you quote concerns PACKET_TX_RING - the send side. So far,
TP_STATUS_LOSING is the only status I've stumbled upon, but I know
there are other values possible.

>
> I could prepare another patch for review, that clarifies the tp_status
> usage for all references to TP_STATUS_xyz values.
> Unless Stefan would like to do this himself, since it's actually his
> "discovery" ;)

I don't have a patch cooking for the rest of the bits, so if you want
to have a stab at it, go ahead :).

Thanks for reviewing and submitting the patch, guys!

Stefan.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
