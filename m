From: Elie De Brauwer <eliedebrauwer-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] recvmmsg.2 Updated timeout documentation
Date: Sun, 23 Dec 2012 21:42:20 +0100
Message-ID: <50D76CAC.7070403@gmail.com>
References: <CAKgNAkhz1E8c2jpECcYrKJyMv1RB36qC_HjW9s=i=+bYLfii4w@mail.gmail.com> <1356264415-5108-1-git-send-email-eliedebrauwer@gmail.com> <CAKgNAkhFS_n4BrTvqV12VcLSPXGjkBE6MOFS-sUCnCT8y7Pjfw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAKgNAkhFS_n4BrTvqV12VcLSPXGjkBE6MOFS-sUCnCT8y7Pjfw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 12/23/2012 07:30 PM, Michael Kerrisk (man-pages) wrote:
> Elie,
>
>> In any case, when operating in non-blocking mode, the timeout is taken into
>> account, which could mean that recvmmsg() returns while data is still
>> available (which was not clearly stated). (Combination of much data to
>> copy and a very sharp timeout).
>
> Can you say more about what you see/understand with nonblocking mode.
> I don't understand what you mean here (and it doesn't fit with what I
> am seeing on testing). Nonblocking mode should, I believe, always mean
> an immediate return, regardless of any timeout.

It's just cosmetics really, now they state that:
"
A nonblocking call reads as many messages as are available (up to the 
limit specified by vlen) and returns immediately.
"

Suppose that you are operating in non-blocking mode, the timeout is set 
to one nanosecond (yeah, living on the edge), and vlen is an insane 
large number (say a thousand) whilst assuming that data is available to 
be received. The text from the manpage says that you will return if the 
available data is depleted or if you have read 'vlen' buffers. So it 
means there's a 'faster than timeout' possible.

What the kernel implementation actually does (simplified, and ignoring 
WAITFORONE) is:

while(datagrams < vlen) {
   err = recvmsg()
   if (err) break;
   if (timeout) break;
   datagrams++
}

Both in non-blocking/blocking mode, and I think the manpage should make 
the three possible exit scenario (vlen, timeout, err) clear in both 
blocking and non-blocking mode.

gr
E.

-- 
Elie De Brauwer

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
