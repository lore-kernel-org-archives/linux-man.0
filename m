From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: status in PACKET_RX_RING is actually a bit mask
Date: Thu, 24 Apr 2014 10:04:31 +0200
Message-ID: <CAKgNAkjwHkba6NktfNK9nRUUAwcYeFK5aGBgov1tcuipy4mPdw@mail.gmail.com>
References: <CACKs7VD6a0hzMd_Go6yUAxJ=tbYdJ9Qbq=FXQezVvaUUE9egUw@mail.gmail.com>
 <CACKs7VAUE89+NyuywOwpZ2GzeVQLtV_A-+4PicErmCzLNNNd6Q@mail.gmail.com>
 <CAKgNAkhJO2ZMpMf6BiaW7TRUd6jvLFU7yPN7xKH9fDoVPPr=tA@mail.gmail.com> <5358C4FC.80204@redhat.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5358C4FC.80204-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Daniel Borkmann <dborkman-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Stefan Puiu <stefan.puiu-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, lnx-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Willem de Bruijn <willemb-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Neil Horman <nhorman-2XuSBdqkA4R54TAoqtyWWQ@public.gmane.org>, Carsten Andrich <carsten.andrich-hs6bpBdVsEZfm0AUMx9V0g@public.gmane.org>
List-Id: linux-man@vger.kernel.org

> Now to your question. It can easily be seen from the if_packet.h header
> file http://lingrok.org/xref/linux-net-next/include/uapi/linux/if_packet.h#93
> that TP_STATUS_* are individual bits that are set in tp_status field.

So, I take it that that's an Ack-for the patch by Stefan?

Cheers,

Michael
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
