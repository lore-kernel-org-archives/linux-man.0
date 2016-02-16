From: Peter Hurley <peter-WaGBZJeGNqdsbIuE7sb01tBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH] termios.3: Document line length in canonical mode
Date: Tue, 16 Feb 2016 14:30:37 -0800
Message-ID: <56C3A30D.5010101@hurleysoftware.com>
References: <1455542819-29184-1-git-send-email-toddy@debian.org>
 <56C1EEA6.5080500@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <56C1EEA6.5080500-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "Dr. Tobias Quathamer" <toddy-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Daniel Shahaf <danielsh-1oDqGaOF3Lkdnm+yROfE0A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On 02/15/2016 07:28 AM, Michael Kerrisk (man-pages) wrote:
> Hello Tobias,
>=20
> On 02/15/2016 02:26 PM, Dr. Tobias Quathamer wrote:
>> See https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/=
tree/drivers/tty/n_tty.c#n1673
>> See https://bugs.debian.org/797479
>> ---
>>  man3/termios.3 | 9 +++++++++
>>  1 file changed, 9 insertions(+)
>>
>> diff --git a/man3/termios.3 b/man3/termios.3
>> index 7d738d4..3f57607 100644
>> --- a/man3/termios.3
>> +++ b/man3/termios.3
>> @@ -728,11 +728,20 @@ requested fewer bytes than are available in th=
e current line of input,
>>  then only as many bytes as requested are read,
>>  and the remaining characters will be available for a future
>>  .BR read (2).
>> +.IP * 2
>> +The maximum line length is 4096 chars (including the line terminati=
on
>> +char); lines longer than 4096 chars are truncated. After 4095 chars=
,
>> +input data is still processed but not stored. Overflow processing
>> +ensures the tty can always receive more input until at least one
>> +line can be read.
>>  .PP
>>  In noncanonical mode input is available immediately (without
>>  the user having to type a line-delimiter character),
>>  no input processing is performed,
>>  and line editing is disabled.
>> +The read buffer will only accept 4095 chars; this provides the
>> +necessary space for a newline char if the input mode is switched
>> +to canonical.
>>  The settings of MIN
>>  .RI ( c_cc[VMIN] )
>>  and TIME
>=20
> Thanks for crafting this. I've applied, and tweaked a little to clari=
fy
> some details:
>=20
>        * The maximum line length is 4096 chars (including the  termin=
ating
>          newline  character);  lines longer than 4096 chars are trunc=
ated.
>          After 4095 characters, input data up (but not including) any=
 ter=E2=80=90
>          minating  newline  is  discarded.  This ensures that the ter=
minal
>          can always receive more input until at  least  one  line  ca=
n  be
>          read.

Hmm. Neither description is accurate of the observable behavior from us=
erspace.
=46or example, it's entirely possible to retrieve > 4096 bytes in non-c=
anonical
mode, at least since 3.12

And input processing continues on the input, even past 4096 bytes.
Line editing, ISIG, ECHOxx processing still occurs.

It is true that it is not possible to retrieve > 4096 char line in cano=
nical
mode, and I don't see that ever changing via read() because userspace m=
ay
assume it has received a terminated line in 4096-byte read buffer.

However, the noncanonical mode input buffer size may change in the near
future.

Regards,
Peter Hurley
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
