From: Stefan Puiu <stefan.puiu-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [patch] packet.7: PACKET_LOSS has inverse meaning
Date: Wed, 23 Apr 2014 23:53:21 +0300
Message-ID: <CACKs7VCdutMZk8qmEkVws7YBcmS4oYTDJssYjH3Crohd1vuR2Q@mail.gmail.com>
References: <1398182519.2926.26.camel@x201>
	<5356B3BA.7050401@gmail.com>
	<CA+FuTSc=4fwH=+jX58teeQHrRse718qLBOLzAcrZJSYug2TfSw@mail.gmail.com>
	<5356BB3F.4030502@gmail.com>
	<CA+FuTScUexjc6bETYMVgPUgmN5CSR40=UrELT9N363Tvk1+waA@mail.gmail.com>
	<1398200019.5031.24.camel@actium.fritz.box>
	<53575872.6080403@gmail.com>
	<e1a7b65cad75dd1a52721826c226c352@localhost>
	<53579224.3060006@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <53579224.3060006-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Carsten Andrich <carsten.andrich-hs6bpBdVsEZfm0AUMx9V0g@public.gmane.org>, Willem de Bruijn <willemb-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Daniel Borkmann <dborkman-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, lnx-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hi Michael,

On Wed, Apr 23, 2014 at 1:12 PM, Michael Kerrisk (man-pages)
<mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> packet.7 is another one of those dusty corners.
[...]
> Andi Kleen made a good effort in
> putting the page together 15 years ago, but since then it has
> mostly languished, short of real love, except for a couple of
> patches in the last 18 months (from Daniel/Willem, and Neil Horman).

I've also sent a patch for packet.7 to the list on March 13th, which I
think is kind of important (it mentions that the tp_status is actually
a bit mask) - hint, hint :).

Stefan.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
