From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Improving PACKET_{RX,TX}_RING documentation
Date: Thu, 22 May 2014 15:13:01 +0200
Message-ID: <CAKgNAkj6nUL8ngweOQ1=jn_DZubeWT1aCs51Te7WEGje8PzzKQ@mail.gmail.com>
References: <1400332406.2395.35.camel@actium.fritz.box> <53798E97.1000505@gmail.com>
 <5379D9A2.1070008@redhat.com> <CA+FuTSeWh_iQGqc-4usL7vr28OrkHTnBvHvXvVO=LcGsNRgtMA@mail.gmail.com>
 <d1afaaacb05c031517bb96211c098edf@localhost>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <d1afaaacb05c031517bb96211c098edf@localhost>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Carsten Andrich <carsten.andrich-hs6bpBdVsEZfm0AUMx9V0g@public.gmane.org>
Cc: Willem de Bruijn <willemb-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Daniel Borkmann <dborkman-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Neil Horman <nhorman-2XuSBdqkA4R54TAoqtyWWQ@public.gmane.org>, jbrouer-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Thu, May 22, 2014 at 2:22 PM, Carsten Andrich
<carsten.andrich-hs6bpBdVsEZfm0AUMx9V0g@public.gmane.org> wrote:
> Thanks for the feedback, Daniel and Willem.
>
> Executive summary: We need a good concept for distributing (preferably
> mutually exclusive) information among packet(7) and packet_mmap.txt.
>
> Willem de Bruijn schrieb:
>>>     0. Perhaps a general writeup on how the RX/TX_RING works in Linux,
>>>        it's layout, constraints etc. Btw, not sure if that's also
>>
>> This would duplicate the contents of
>> Documentation/networking/packet_mmap.txt? I would caution against
>> having two sources of documentation that may become inconsistent over
>> time. A detailed discussion could also become too long for a manual
>> page: packet_mmap.txt is already 1067 lines (albeit about half in
>> example code). If that document is confusing, a thorough edit of that
>> would be very helpful, though.
>>
>>>        included already, but the same mmap-technique exists also for
>>>        netlink sockets.
>>
>> See also Documentation/networking/netlink_mmap.txt . If the ring is a
>> generic netlink feature (i.e., not specific to nfnetlink), then man 7
>> netlink is the right place for user documentation (in as far as this
>> is a user-oriented feature).
>
> Some deduplication between netlink(7), packet(7), netlink_mmap.txt and
> packet_mmap.txt is probably a good idea. However, this is much more than
> I initially bargained for :)
> I had a superficial look at the netlink documents, and most concepts
> appear to be very much alike. The operational aspects make quite a large
> exception, though, since the netlink header (usage) is a lot simpler
> than tpacket_hdr including its different versions.
>
> IMHO user-space API documentation should reside in the man page and not
> Documentation/, but I'd like to heard Michael's opinion on that. Maybe
> it's a good idea to have at least a basic description on packet(7) and
> reserve packet_mmap.txt for the more advanced topics?

Yes, user-space API documentation is best in the man pages, IMO. The
split you suggest seems okay to me: the essentials in packet(7) and
referring as needed for advanced stuff to Documentation/

Cheers,

Michael



-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
