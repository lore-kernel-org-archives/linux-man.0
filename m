From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] termios.3: Document line length in canonical mode
Date: Thu, 18 Feb 2016 20:29:43 +0100
Message-ID: <CAKgNAkhHNeHo0yS3D0cpUfFT9pA7bp5xQoidksbq9J4tP8zXnA@mail.gmail.com>
References: <1455542819-29184-1-git-send-email-toddy@debian.org>
 <56C1EEA6.5080500@gmail.com> <56C3A30D.5010101@hurleysoftware.com>
 <56C446E3.2070501@gmail.com> <56C4A1E4.3090201@hurleysoftware.com>
 <56C5AA39.4090007@gmail.com> <56C5E3DC.6040504@hurleysoftware.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <56C5E3DC.6040504-WaGBZJeGNqdsbIuE7sb01tBPR1lH4CV8@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter Hurley <peter-WaGBZJeGNqdsbIuE7sb01tBPR1lH4CV8@public.gmane.org>
Cc: "Dr. Tobias Quathamer" <toddy-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Daniel Shahaf <danielsh-1oDqGaOF3Lkdnm+yROfE0A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hello Peter

On 18 February 2016 at 16:31, Peter Hurley <peter-WaGBZJeGNqdsbIuE7sb01tBPR1lH4CV8@public.gmane.org> wrote:
> On 02/18/2016 03:25 AM, Michael Kerrisk (man-pages) wrote:
>> Hello Peter,
>>
>> On 02/17/2016 05:37 PM, Peter Hurley wrote:
[...]
>> Okay -- so how's this text?
>>
>>        In canonical mode:
>>        [...]
>>        * The maximum line length is 4096 chars (including the terminating
>>          newline character); lines longer than 4096 chars are  truncated.
>>          After  4095  characters,  input processing (e.g., ISIG and ECHO*
>>          processing) continues, but any input data after 4095  characters
>>          up  to (but not including) any terminating newline is discarded.
>>          This ensures that the terminal can  always  receive  more  input
>>          until at least one line can be read.
>
> Yeah, this seems fine.

Thanks for checking it.

>>>>> However, the noncanonical mode input buffer size may change in the near
>>>>> future.
>>>>
>>>> Can you say some more about that?
>>>
>>> At very high line rates and with ptys, the size of the read buffer becomes a
>>> bottleneck, while at the same time, an already-committed page of memory is
>>> going unused because of the page order allocation used by vm area allocator
>>> (where N_TTY data is stored).
>>>
>>> The change is non-trivial however, since the maximum read size returned
>>> by canonical mode cannot > 4096 bytes (because of the userspace assumptions
>>> I referred to earlier).
>>>
>>>> And what changed in 3.13 with respect to noncanonical mode, by the way?
>>>
>>> In 3.12, the entire tty input path was parallelized.
>>>
>>> So while data is being read by userspace, input processing continues
>>> concurrently, adding new data for userspace to read (the actual
>>> construct used is a lockless circular buffer). In non-canonical modes,
>>> the userspace copy is always performed twice -- first, from beginning of
>>> unread data (head) to the end of buffer and then, from the beginning of
>>> buffer to last unread data (tail).
>>>
>>> Since new data may be added to the circular buffer in parallel after the
>>> first user copy has been performed, it's possible to retrieve up to 8192
>>> bytes (assuming the user copy buffer is that large).
>>
>> Thanks for the info. Do you think this warrants any changes in the man page?
>
> I don't think so. The goal of most changes in tty is to improve reliability
> or performance w/o affecting userspace-observable behavior.

Okay.

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
