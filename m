From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] termios.3: Document line length in canonical mode
Date: Thu, 18 Feb 2016 12:25:45 +0100
Message-ID: <56C5AA39.4090007@gmail.com>
References: <1455542819-29184-1-git-send-email-toddy@debian.org>
 <56C1EEA6.5080500@gmail.com> <56C3A30D.5010101@hurleysoftware.com>
 <56C446E3.2070501@gmail.com> <56C4A1E4.3090201@hurleysoftware.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <56C4A1E4.3090201-WaGBZJeGNqdsbIuE7sb01tBPR1lH4CV8@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter Hurley <peter-WaGBZJeGNqdsbIuE7sb01tBPR1lH4CV8@public.gmane.org>, "Dr. Tobias Quathamer" <toddy-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Daniel Shahaf <danielsh-1oDqGaOF3Lkdnm+yROfE0A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hello Peter,

On 02/17/2016 05:37 PM, Peter Hurley wrote:
> Hi Michael,
>=20
> On 02/17/2016 02:09 AM, Michael Kerrisk (man-pages) wrote:
>> On 02/16/2016 11:30 PM, Peter Hurley wrote:
>>> On 02/15/2016 07:28 AM, Michael Kerrisk (man-pages) wrote:
>>>> On 02/15/2016 02:26 PM, Dr. Tobias Quathamer wrote:
>>>>> See https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.g=
it/tree/drivers/tty/n_tty.c#n1673
>>>>> See https://bugs.debian.org/797479
>>>>> ---
>>>>>  man3/termios.3 | 9 +++++++++
>>>>>  1 file changed, 9 insertions(+)
>>>>>
>>>>> diff --git a/man3/termios.3 b/man3/termios.3
>>>>> index 7d738d4..3f57607 100644
>>>>> --- a/man3/termios.3
>>>>> +++ b/man3/termios.3
>>>>> @@ -728,11 +728,20 @@ requested fewer bytes than are available in=
 the current line of input,
>>>>>  then only as many bytes as requested are read,
>>>>>  and the remaining characters will be available for a future
>>>>>  .BR read (2).
>>>>> +.IP * 2
>>>>> +The maximum line length is 4096 chars (including the line termin=
ation
>>>>> +char); lines longer than 4096 chars are truncated. After 4095 ch=
ars,
>>>>> +input data is still processed but not stored. Overflow processin=
g
>>>>> +ensures the tty can always receive more input until at least one
>>>>> +line can be read.
>>>>>  .PP
>>>>>  In noncanonical mode input is available immediately (without
>>>>>  the user having to type a line-delimiter character),
>>>>>  no input processing is performed,
>>>>>  and line editing is disabled.
>>>>> +The read buffer will only accept 4095 chars; this provides the
>>>>> +necessary space for a newline char if the input mode is switched
>>>>> +to canonical.
>>>>>  The settings of MIN
>>>>>  .RI ( c_cc[VMIN] )
>>>>>  and TIME
>>>>
>>>> Thanks for crafting this. I've applied, and tweaked a little to cl=
arify
>>>> some details:
>>>>
>>>>        * The maximum line length is 4096 chars (including the  ter=
minating
>>>>          newline  character);  lines longer than 4096 chars are tr=
uncated.
>>>>          After 4095 characters, input data up (but not including) =
any ter=E2=80=90
>>>>          minating  newline  is  discarded.  This ensures that the =
terminal
>>>>          can always receive more input until at  least  one  line =
 can  be
>>>>          read.
>>>
>>> Hmm. Neither description is accurate of the observable behavior fro=
m userspace.
>>> For example, it's entirely possible to retrieve > 4096 bytes in non=
-canonical
>>> mode, at least since 3.12
>>
>> Note that the text I quoted applies just to canonical mode:
>>
>>        In canonical mode:
>>
>>        [...]
>>
>>        * The maximum line length is 4096 chars (including the  termi=
nat=E2=80=90
>>          ing  newline character); lines longer than 4096 chars are t=
run=E2=80=90
>>          cated.  After 4095 characters, input data up (but  not  inc=
lud=E2=80=90
>>          ing)  any  terminating newline is discarded.  This ensures =
that
>>          the terminal can always receive more input until at  least =
 one
>>          line can be read.
>>
>> So, does that seem okay?
>=20
> See below.
>=20
>>> And input processing continues on the input, even past 4096 bytes.
>>> Line editing, ISIG, ECHOxx processing still occurs.
>>
>> Yes, but only in noncanonical mode, right?
>=20
> No. Input processing continues in canonical mode, including echoing.
> Only when bytes are to actually be stored for userspace to later read=
 is
> the input data discarded if the buffer is full (less the 1 byte requi=
red to
> store the line termination).
>=20
> Every input byte received in canonical mode is always processed norma=
lly
> and only discarded if the buffer is full. IOW, a Ctrl+u (line kill) r=
eceived
> as the 6000th byte received w/o line termination will still cause all=
 previous
> data to be flushed and the line restarted when new input arrives.

Ahh -- got it. I wasn't thinking about that stuff at all!

> Similarly, all data is still echoed regardless of how long the line i=
s.
>=20
>>> It is true that it is not possible to retrieve > 4096 char line in =
canonical
>>> mode, and I don't see that ever changing via read() because userspa=
ce may
>>> assume it has received a terminated line in 4096-byte read buffer.
>>
>> Yep. So we all seem to agree.
>=20
> The way I read your edits above is that all new input data is simply =
discarded
> until line termination, which is not the case.

Yes, because I wasn't even considering your point :-). Thanks for the
clarifications.

> Dr. Quathamer's first diff hunk is accurate wrt canonical mode. Howev=
er,
> I think the 'Overflow processing ...' is overly specific; the tty cor=
e contains
> many elements which prevent terminal lockup.

Okay -- so how's this text?

       In canonical mode:
       [...]
       * The maximum line length is 4096 chars (including the terminati=
ng
         newline character); lines longer than 4096 chars are  truncate=
d.
         After  4095  characters,  input processing (e.g., ISIG and ECH=
O*
         processing) continues, but any input data after 4095  characte=
rs
         up  to (but not including) any terminating newline is discarde=
d.
         This ensures that the terminal can  always  receive  more  inp=
ut
         until at least one line can be read.


>>> However, the noncanonical mode input buffer size may change in the =
near
>>> future.
>>
>> Can you say some more about that?
>=20
> At very high line rates and with ptys, the size of the read buffer be=
comes a
> bottleneck, while at the same time, an already-committed page of memo=
ry is
> going unused because of the page order allocation used by vm area all=
ocator
> (where N_TTY data is stored).
>=20
> The change is non-trivial however, since the maximum read size return=
ed
> by canonical mode cannot > 4096 bytes (because of the userspace assum=
ptions
> I referred to earlier).
>=20
>> And what changed in 3.13 with respect to noncanonical mode, by the w=
ay?
>=20
> In 3.12, the entire tty input path was parallelized.
>=20
> So while data is being read by userspace, input processing continues
> concurrently, adding new data for userspace to read (the actual
> construct used is a lockless circular buffer). In non-canonical modes=
,
> the userspace copy is always performed twice -- first, from beginning=
 of
> unread data (head) to the end of buffer and then, from the beginning =
of
> buffer to last unread data (tail).
>=20
> Since new data may be added to the circular buffer in parallel after =
the
> first user copy has been performed, it's possible to retrieve up to 8=
192
> bytes (assuming the user copy buffer is that large).

Thanks for the info. Do you think this warrants any changes in the man =
page?

Cheers,

Michael



--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
