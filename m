From: Jan Engelhardt <jengelh-9+2X+4sQBs8@public.gmane.org>
Subject: Re: raw.7 missing ETH_P_ALL hack
Date: Sun, 29 Jul 2012 16:14:51 +0200 (CEST)
Message-ID: <alpine.LNX.2.01.1207291614330.13011@frira.zrqbmnf.qr>
References: <alpine.LSU.2.00.0910221353080.21589@obet.zrqbmnf.qr> <CAKgNAki70auDaFRkk430FNNz3icNEMzr+JOOq=trGigvX_7V0A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAKgNAki70auDaFRkk430FNNz3icNEMzr+JOOq=trGigvX_7V0A-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Sunday 2012-07-29 06:32, Michael Kerrisk (man-pages) wrote:

>On Thu, Oct 22, 2009 at 1:56 PM, Jan Engelhardt <jengelh-nopoi9nDyk+ELgA04lAiVw@public.gmane.org> wrote:
>> Hi,
>>
>>
>> some codes use a raw socket with ETH_P_ALL, such as
>> http://code.google.com/p/libdnet/source/browse/trunk/src/eth-linux.c
>> However this is not documented yet in raw(7).
>
>Does packet(7) not give you what you are looking for?

Right.. eth-linux.c happens to use AF_PACKET (at least now, two years 
later ;-)
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
