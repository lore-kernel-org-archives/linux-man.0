From: Carsten Andrich <carsten.andrich-hs6bpBdVsEZfm0AUMx9V0g@public.gmane.org>
Subject: Re: [patch] packet.7: =?UTF-8?Q?PACKET=5FLOSS=20has=20inverse=20m?=
 =?UTF-8?Q?eaning?=
Date: Wed, 23 Apr 2014 10:51:24 +0200
Message-ID: <e1a7b65cad75dd1a52721826c226c352@localhost>
References: <1398182519.2926.26.camel@x201> <5356B3BA.7050401@gmail.com>
 <CA+FuTSc=4fwH=+jX58teeQHrRse718qLBOLzAcrZJSYug2TfSw@mail.gmail.com>
 <5356BB3F.4030502@gmail.com>
 <CA+FuTScUexjc6bETYMVgPUgmN5CSR40=UrELT9N363Tvk1+waA@mail.gmail.com>
 <1398200019.5031.24.camel@actium.fritz.box> <53575872.6080403@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain;
 charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <53575872.6080403-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Willem de Bruijn <willemb-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Daniel Borkmann <dborkman-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

"Michael Kerrisk (man-pages)" schrieb:
> How would adding just a little more precision be:
> 
> [[
> However, if
> .BR PACKET_LOSS
> is set, any malformed packet will be skipped, its status 
> .RI ( tp_status
> in the
> .I tpacket_hdr
> structure) reset to
> .BR TP_STATUS_AVAILABLE ,
> and the transmission process continued.
> ]]
> 
> ?

I sense a disturb ... ehm ... general discussion regarding PACKET_MMAP
documenation arising.

I agree with Willem's commit message, adding PACKET_MMAP to packet.7:
https://git.kernel.org/cgit/docs/man-pages/man-pages.git/commit/?id=dbb4f7516b
> It tries to balance being informative with exposing kernel detail
> that is unlikely to be used by most readers or that may change
> frequently. For implementation details, the manpage points to the
> documentation in kernel Documentation/networking. Let me know if
> options should be added or removed.

The entire packet.7 manpage does not mention struct tpacket_hdr a
single time,
so mentioning it only when describing the PACKET_LOSS socket option may
confuse
the reader. Particulary since different versions of this struct exist.

In my opinion packet.7 should be complete (and correct), yet brief in
describing anything PACKET_MMAP related, so anyone with a basic
unterstanding
of PACKET_MMAP internals will comprehend the descriptions in packet.7.
packet.7 already refers to Documentation/networking/packet_mmap.txt for
additional information. Reading only packet.7 will not enable anyone
unfamiliar
with PACKET_MMAP to actually use it.

This brings me to packet_mmap.txt, which -- I am sorry to say --
definitely
needs to be improved. It lacks some information (e.g. PACKET_LOSS is
not
mentioned at all), should give some basic usage examples, clarify some
details, etc. It does not mention the excellent example code in
/tools/testing/selftests/net/psock_tpacket.c at all, which I only
stumled upon
yesterday. It would have been very helpful to me, when I was getting
started
with PACKET_MMAP, since packet_mmap.txt was quite puzzling in the
beginning.

Both packet.7 and packet_mmap.txt should be synchronized to some
extent, so
the former gives basic information and the latter contains
implementation
details. But that would be a lot of work ...

Cheers,
Carsten

PS: This is not me volunteering to help in that effort. At least not
yet ;)
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
