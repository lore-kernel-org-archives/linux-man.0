From: Daniel Borkmann <dborkman-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: Improving PACKET_{RX,TX}_RING documentation
Date: Mon, 19 May 2014 18:01:01 +0200
Message-ID: <537A2ABD.4010006@redhat.com>
References: <1400332406.2395.35.camel@actium.fritz.box> <53798E97.1000505@gmail.com> <5379D9A2.1070008@redhat.com> <CA+FuTSeWh_iQGqc-4usL7vr28OrkHTnBvHvXvVO=LcGsNRgtMA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CA+FuTSeWh_iQGqc-4usL7vr28OrkHTnBvHvXvVO=LcGsNRgtMA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Willem de Bruijn <willemb-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Cc: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Carsten Andrich <carsten.andrich-hs6bpBdVsEZfm0AUMx9V0g@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Neil Horman <nhorman-2XuSBdqkA4R54TAoqtyWWQ@public.gmane.org>, jbrouer-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 05/19/2014 05:05 PM, Willem de Bruijn wrote:
...
> This would duplicate the contents of
> Documentation/networking/packet_mmap.txt? I would caution against
> having two sources of documentation that may become inconsistent over
> time. A detailed discussion could also become too long for a manual
> page: packet_mmap.txt is already 1067 lines (albeit about half in
> example code). If that document is confusing, a thorough edit of that
> would be very helpful, though.

Okay, agreed, that would also be a good idea.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
