From: walter harms <wharms-fPG8STNUNVg@public.gmane.org>
Subject: Re: IPPROTO_ICMP
Date: Sat, 03 Dec 2016 13:43:16 +0100
Message-ID: <5842BDE4.3010204@bfs.de>
References: <CAGXu5jLwj7p_ueaz-vEH_MJLC_xxwpXUT_GFLAnMOvdh7HUxmQ@mail.gmail.com>
Reply-To: wharms-fPG8STNUNVg@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAGXu5jLwj7p_ueaz-vEH_MJLC_xxwpXUT_GFLAnMOvdh7HUxmQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kees Cook <keescook-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Cc: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org



Am 03.12.2016 05:58, schrieb Kees Cook:
> Hi,
> 
> So, while playing with IPPROTO_ICMP[1], I rediscovered the sysctl
> needed to use it, and went to make sure that it was covered in the
> man-pages. It is, in man.7 (ping_group_range), though there is no
> mention of IPPROTO_ICMP there. Also, it seems that socket.2 says to
> either look at protocols.5 (which just talks about the file) or ip.7
> for AF_INET. ip.7 says:
> 
>        udp_socket = socket(AF_INET, SOCK_DGRAM, 0);
> 
> And continues to make assumptions that IPPROTO_ICMP doesn't exist:
> "SOCK_DGRAM to  open a  udp(7) socket", "The  only  valid  values  for
> protocol  are ... 0 and IPPROTO_UDP", etc. Additionally, EACCESS is
> missing the error condition for not having ping_group_range set
> correctly.
> 
> Does it make sense to put IPPROTO_ICMP details in ip.7? Or is there a
> better place to list it? Are there additional details beyond what I
> pointed out that should be updated in ip.7?
> 
> Thanks!
> 
> -Kees
> 
> [1] https://lwn.net/Articles/443051/
> 

Interesting, i have never heard about it.
But i would suggest this as a special chapter in ICMP(7).

When I would search for information about ping, i would go to icmp
not to IP.


re,
 wh

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
