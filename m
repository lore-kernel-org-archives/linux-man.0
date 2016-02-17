From: Peter Hurley <peter-WaGBZJeGNqdsbIuE7sb01tBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH] termios.3: Document line length in canonical mode
Date: Wed, 17 Feb 2016 08:37:56 -0800
Message-ID: <56C4A1E4.3090201@hurleysoftware.com>
References: <1455542819-29184-1-git-send-email-toddy@debian.org>
 <56C1EEA6.5080500@gmail.com> <56C3A30D.5010101@hurleysoftware.com>
 <56C446E3.2070501@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <56C446E3.2070501-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "Dr. Tobias Quathamer" <toddy-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Daniel Shahaf <danielsh-1oDqGaOF3Lkdnm+yROfE0A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hi Michael,

On 02/17/2016 02:09 AM, Michael Kerrisk (man-pages) wrote:
> On 02/16/2016 11:30 PM, Peter Hurley wrote:
>> On 02/15/2016 07:28 AM, Michael Kerrisk (man-pages) wrote:
>>> On 02/15/2016 02:26 PM, Dr. Tobias Quathamer wrote:
>>>> See https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.gi=
t/tree/drivers/tty/n_tty.c#n1673
>>>> See https://bugs.debian.org/797479
>>>> ---
>>>>  man3/termios.3 | 9 +++++++++
>>>>  1 file changed, 9 insertions(+)
>>>>
>>>> diff --git a/man3/termios.3 b/man3/termios.3
>>>> index 7d738d4..3f57607 100644
>>>> --- a/man3/termios.3
>>>> +++ b/man3/termios.3
>>>> @@ -728,11 +728,20 @@ requested fewer bytes than are available in =
the current line of input,
>>>>  then only as many bytes as requested are read,
>>>>  and the remaining characters will be available for a future
>>>>  .BR read (2).
>>>> +.IP * 2
>>>> +The maximum line length is 4096 chars (including the line termina=
tion
>>>> +char); lines longer than 4096 chars are truncated. After 4095 cha=
rs,
>>>> +input data is still processed but not stored. Overflow processing
>>>> +ensures the tty can always receive more input until at least one
>>>> +line can be read.
>>>>  .PP
>>>>  In noncanonical mode input is available immediately (without
>>>>  the user having to type a line-delimiter character),
>>>>  no input processing is performed,
>>>>  and line editing is disabled.
>>>> +The read buffer will only accept 4095 chars; this provides the
>>>> +necessary space for a newline char if the input mode is switched
>>>> +to canonical.
>>>>  The settings of MIN
>>>>  .RI ( c_cc[VMIN] )
>>>>  and TIME
>>>
>>> Thanks for crafting this. I've applied, and tweaked a little to cla=
rify
>>> some details:
>>>
>>>        * The maximum line length is 4096 chars (including the  term=
inating
>>>          newline  character);  lines longer than 4096 chars are tru=
ncated.
>>>          After 4095 characters, input data up (but not including) a=
ny ter=E2=80=90
>>>          minating  newline  is  discarded.  This ensures that the t=
erminal
>>>          can always receive more input until at  least  one  line  =
can  be
>>>          read.
>>
>> Hmm. Neither description is accurate of the observable behavior from=
 userspace.
>> For example, it's entirely possible to retrieve > 4096 bytes in non-=
canonical
>> mode, at least since 3.12
>=20
> Note that the text I quoted applies just to canonical mode:
>=20
>        In canonical mode:
>=20
>        [...]
>=20
>        * The maximum line length is 4096 chars (including the  termin=
at=E2=80=90
>          ing  newline character); lines longer than 4096 chars are tr=
un=E2=80=90
>          cated.  After 4095 characters, input data up (but  not  incl=
ud=E2=80=90
>          ing)  any  terminating newline is discarded.  This ensures t=
hat
>          the terminal can always receive more input until at  least  =
one
>          line can be read.
>=20
> So, does that seem okay?

See below.

>> And input processing continues on the input, even past 4096 bytes.
>> Line editing, ISIG, ECHOxx processing still occurs.
>=20
> Yes, but only in noncanonical mode, right?

No. Input processing continues in canonical mode, including echoing.
Only when bytes are to actually be stored for userspace to later read i=
s
the input data discarded if the buffer is full (less the 1 byte require=
d to
store the line termination).

Every input byte received in canonical mode is always processed normall=
y
and only discarded if the buffer is full. IOW, a Ctrl+u (line kill) rec=
eived
as the 6000th byte received w/o line termination will still cause all p=
revious
data to be flushed and the line restarted when new input arrives.

Similarly, all data is still echoed regardless of how long the line is.

>> It is true that it is not possible to retrieve > 4096 char line in c=
anonical
>> mode, and I don't see that ever changing via read() because userspac=
e may
>> assume it has received a terminated line in 4096-byte read buffer.
>=20
> Yep. So we all seem to agree.

The way I read your edits above is that all new input data is simply di=
scarded
until line termination, which is not the case.

Dr. Quathamer's first diff hunk is accurate wrt canonical mode. However=
,
I think the 'Overflow processing ...' is overly specific; the tty core =
contains
many elements which prevent terminal lockup.


>> However, the noncanonical mode input buffer size may change in the n=
ear
>> future.
>=20
> Can you say some more about that?

At very high line rates and with ptys, the size of the read buffer beco=
mes a
bottleneck, while at the same time, an already-committed page of memory=
 is
going unused because of the page order allocation used by vm area alloc=
ator
(where N_TTY data is stored).

The change is non-trivial however, since the maximum read size returned
by canonical mode cannot > 4096 bytes (because of the userspace assumpt=
ions
I referred to earlier).

> And what changed in 3.13 with respect to noncanonical mode, by the wa=
y?

In 3.12, the entire tty input path was parallelized.

So while data is being read by userspace, input processing continues
concurrently, adding new data for userspace to read (the actual
construct used is a lockless circular buffer). In non-canonical modes,
the userspace copy is always performed twice -- first, from beginning o=
f
unread data (head) to the end of buffer and then, from the beginning of
buffer to last unread data (tail).

Since new data may be added to the circular buffer in parallel after th=
e
first user copy has been performed, it's possible to retrieve up to 819=
2
bytes (assuming the user copy buffer is that large).

Regards,
Peter Hurley
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
