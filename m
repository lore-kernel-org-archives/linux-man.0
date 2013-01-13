From: Kees Cook <keescook-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH] proc.5, core.5: clarify suid_dumpable vs core_pattern
Date: Sat, 12 Jan 2013 20:52:12 -0800
Message-ID: <CAGXu5jKqSJfaLSXkcDNLuuYiLGkyDxpxWxCJhWG3JVntDJEnGw@mail.gmail.com>
References: <20130111211255.GA14713@www.outflux.net>
	<CAKgNAkjZvZmSgJUVkrLXuXiKDLccnkqGvrrbN4KR+fhkN4P8+Q@mail.gmail.com>
	<CAGXu5jLVn0DfaDpjfJeiMCoFJt8ZCUN9AjONAbEGcVYtEAiXZw@mail.gmail.com>
	<CAKgNAkjzcd0PFzd_kQfXt3cOkyR+Wo8jXTndBn3SAUU40xUFrQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAKgNAkjzcd0PFzd_kQfXt3cOkyR+Wo8jXTndBn3SAUU40xUFrQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On Sat, Jan 12, 2013 at 8:50 PM, Michael Kerrisk (man-pages)
<mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>>>>  .SS Piping core dumps to a program
>>>>  Since kernel 2.6.19, Linux supports an alternate syntax for the
>>>>  .I /proc/sys/kernel/core_pattern
>>>> diff --git a/man5/proc.5 b/man5/proc.5
>>>> index c29eacc..940c1fa 100644
>>>> --- a/man5/proc.5
>>>> +++ b/man5/proc.5
>>>> @@ -2481,6 +2481,13 @@ For security reasons core dumps in this mod=
e will not overwrite one
>>>>  another or other files.
>>>>  This mode is appropriate when administrators are
>>>>  attempting to debug problems in a normal environment.
>>>> +Additionally, since Linux 3.6,
>>>> +.\" 9520628e8ceb69fa9a4aee6b57f22675d9e1b709
>>>> +.I /proc/sys/kernel/core_pattern
>>>> +must either be a fully-qualified path, or a pipe command, as deta=
iled in
>>>> +.BR core (5).
>>>> +Warnings will be emitted to the kernel syslog about disallowed co=
mbinations.
>>>
>>> What does "disallowed combinations" mean? Other than an absolute
>>> pathname or a pipe command? And other than the warning to the kerne=
l
>>> log, how are the disallowed combinations treated? Are they ignored?
>>
>> Yeah, by disallowed I mean a core_pattern that starts with neither /
>> nor | and suid_dumpable is set to 2. When conditions change to a
>> disallowed state, the kernel warns in dmesg. If a core dump happens
>> under this condition, the kernel warns again about the condition and
>> does not dump core.
>
> So, does the following text look okay?
>
>                      Additionally,  since  Linux  3.6,  /proc/sys/ker=
=E2=80=90
>                      nel/core_pattern must either be an absolute path=
=E2=80=90
>                      name  or  a pipe command, as detailed in core(5)=
=2E
>                      Warnings will be written to  the  kernel  log  i=
f
>                      core_pattern  does not follow these rules, and n=
o
>                      core dump will be produced.

Yeah, that looks great. Thanks!

-Kees

--
Kees Cook
Chrome OS Security
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
