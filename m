From: "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>
Subject: Re: Bug in socket(7) man page
Date: Mon, 20 Nov 2017 12:32:49 +0100
Message-ID: <CAKgNAki1SVPTnRBHL9CJF2nv99XdWtfQs_OjgGCoYapNUdz2jw@mail.gmail.com>
References: <20170807115342.GA54528@skade.schwarzvogel.de>
Reply-To: mtk.manpages@gmail.com
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20170807115342.GA54528@skade.schwarzvogel.de>
Sender: netdev-owner@vger.kernel.org
To: Tobias Klausmann <klausman@schwarzvogel.de>
Cc: linux-man <linux-man@vger.kernel.org>, Petr Malat <oss@malat.biz>, netdev <netdev@vger.kernel.org>, Neil Horman <nhorman@tuxdriver.com>
List-Id: linux-man@vger.kernel.org

[CC widended]

Tobias,

On 7 August 2017 at 13:53, Tobias Klausmann <klausman@schwarzvogel.de> wrote:
> Hi!
>
> This bug pertains to the manpage as visible on man7.org right
> now.
>
> The socket(7) man page has this paragraph:
>
>        SO_RXQ_OVFL (since Linux 2.6.33)
>               Indicates that an unsigned 32-bit value ancillary message (cmsg) should be attached to
>               received skbs indicating the number of packets dropped by the socket between the  last
>               received packet and this received packet.
>
> The second half is wrong: the counter (internally,
> SOCK_SKB_CB(skb)->dropcount is *not* reset after every packet.
> That is, it is a proper counter, not a gauge, in monitoring
> parlance.
>
> A better version of that paragraph:
>
>        SO_RXQ_OVFL (since Linux 2.6.33)
>               Indicates that an unsigned 32-bit value ancillary message (cmsg) should be attached to
>               received skbs indicating the number of packets dropped by the socket since its
>               creation.

Thanks for the report. See also my reply to Petr in just a moment.
I've taken your suggested text change.

Cheers,

Michael


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
