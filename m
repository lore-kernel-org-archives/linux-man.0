From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] termios.3: Document line length in canonical mode
Date: Wed, 17 Feb 2016 11:09:39 +0100
Message-ID: <56C446E3.2070501@gmail.com>
References: <1455542819-29184-1-git-send-email-toddy@debian.org>
 <56C1EEA6.5080500@gmail.com> <56C3A30D.5010101@hurleysoftware.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <56C3A30D.5010101-WaGBZJeGNqdsbIuE7sb01tBPR1lH4CV8@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter Hurley <peter-WaGBZJeGNqdsbIuE7sb01tBPR1lH4CV8@public.gmane.org>, "Dr. Tobias Quathamer" <toddy-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Daniel Shahaf <danielsh-1oDqGaOF3Lkdnm+yROfE0A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hello Peter

On 02/16/2016 11:30 PM, Peter Hurley wrote:
> On 02/15/2016 07:28 AM, Michael Kerrisk (man-pages) wrote:
>> Hello Tobias,
>>
>> On 02/15/2016 02:26 PM, Dr. Tobias Quathamer wrote:
>>> See https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git=
/tree/drivers/tty/n_tty.c#n1673
>>> See https://bugs.debian.org/797479
>>> ---
>>>  man3/termios.3 | 9 +++++++++
>>>  1 file changed, 9 insertions(+)
>>>
>>> diff --git a/man3/termios.3 b/man3/termios.3
>>> index 7d738d4..3f57607 100644
>>> --- a/man3/termios.3
>>> +++ b/man3/termios.3
>>> @@ -728,11 +728,20 @@ requested fewer bytes than are available in t=
he current line of input,
>>>  then only as many bytes as requested are read,
>>>  and the remaining characters will be available for a future
>>>  .BR read (2).
>>> +.IP * 2
>>> +The maximum line length is 4096 chars (including the line terminat=
ion
>>> +char); lines longer than 4096 chars are truncated. After 4095 char=
s,
>>> +input data is still processed but not stored. Overflow processing
>>> +ensures the tty can always receive more input until at least one
>>> +line can be read.
>>>  .PP
>>>  In noncanonical mode input is available immediately (without
>>>  the user having to type a line-delimiter character),
>>>  no input processing is performed,
>>>  and line editing is disabled.
>>> +The read buffer will only accept 4095 chars; this provides the
>>> +necessary space for a newline char if the input mode is switched
>>> +to canonical.
>>>  The settings of MIN
>>>  .RI ( c_cc[VMIN] )
>>>  and TIME
>>
>> Thanks for crafting this. I've applied, and tweaked a little to clar=
ify
>> some details:
>>
>>        * The maximum line length is 4096 chars (including the  termi=
nating
>>          newline  character);  lines longer than 4096 chars are trun=
cated.
>>          After 4095 characters, input data up (but not including) an=
y ter=E2=80=90
>>          minating  newline  is  discarded.  This ensures that the te=
rminal
>>          can always receive more input until at  least  one  line  c=
an  be
>>          read.
>=20
> Hmm. Neither description is accurate of the observable behavior from =
userspace.
> For example, it's entirely possible to retrieve > 4096 bytes in non-c=
anonical
> mode, at least since 3.12

Note that the text I quoted applies just to canonical mode:

       In canonical mode:

       [...]

       * The maximum line length is 4096 chars (including the  terminat=
=E2=80=90
         ing  newline character); lines longer than 4096 chars are trun=
=E2=80=90
         cated.  After 4095 characters, input data up (but  not  includ=
=E2=80=90
         ing)  any  terminating newline is discarded.  This ensures tha=
t
         the terminal can always receive more input until at  least  on=
e
         line can be read.

So, does that seem okay?

> And input processing continues on the input, even past 4096 bytes.
> Line editing, ISIG, ECHOxx processing still occurs.

Yes, but only in noncanonical mode, right?
>
> It is true that it is not possible to retrieve > 4096 char line in ca=
nonical
> mode, and I don't see that ever changing via read() because userspace=
 may
> assume it has received a terminated line in 4096-byte read buffer.

Yep. So we all seem to agree.
=20
> However, the noncanonical mode input buffer size may change in the ne=
ar
> future.

Can you say some more about that? And what changed in 3.13 with respect
to noncanonical mode, by the way?

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
