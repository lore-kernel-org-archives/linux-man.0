From: Kees Cook <keescook-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH] proc.5, core.5: clarify suid_dumpable vs core_pattern
Date: Sat, 12 Jan 2013 15:18:09 -0800
Message-ID: <CAGXu5jLVn0DfaDpjfJeiMCoFJt8ZCUN9AjONAbEGcVYtEAiXZw@mail.gmail.com>
References: <20130111211255.GA14713@www.outflux.net>
	<CAKgNAkjZvZmSgJUVkrLXuXiKDLccnkqGvrrbN4KR+fhkN4P8+Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAKgNAkjZvZmSgJUVkrLXuXiKDLccnkqGvrrbN4KR+fhkN4P8+Q-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On Sat, Jan 12, 2013 at 12:30 PM, Michael Kerrisk (man-pages)
<mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> Hi Kees,
>
> Thanks for the patch. A couple of questions below.
>
> On Fri, Jan 11, 2013 at 10:12 PM, Kees Cook <keescook-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org> wrote:
>> In 3.6, additional requirements were placed on core_pattern when
>> suid_dumpable is set to 2. Document this and include commit references.
>>
>> Signed-off-by: Kees Cook <keescook-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
>> ---
>>  man5/core.5 |    8 ++++++++
>>  man5/proc.5 |    7 +++++++
>>  2 files changed, 15 insertions(+)
>>
>> diff --git a/man5/core.5 b/man5/core.5
>> index 379082d..1d527b7 100644
>> --- a/man5/core.5
>> +++ b/man5/core.5
>> @@ -176,6 +176,14 @@ file contains the value 0, then a core dump file is simply named
>>  If this file contains a nonzero value, then the core dump file includes
>>  the process ID in a name of the form
>>  .IR core.PID .
>> +
>> +Since version 3.6,
>> +.\" 9520628e8ceb69fa9a4aee6b57f22675d9e1b709
>> +if
>> +.I /proc/sys/fs/suid_dumpable
>> +is set to 2 ("suidsafe"), the pattern must be either a fully qualified path
>> +(starting with a leading \(aq/\(aq character) or a pipe, as defined below.
>> +
>
> By fully qualified path (which is somewhat non-standard terminology,
> at least in man-pages), I assume you mean "absolute pathname".

Oh! Yes, totally right. My head is stuck on "fully qualified domain
name", I think. :) Absolute path is what I meant here.

>>  .SS Piping core dumps to a program
>>  Since kernel 2.6.19, Linux supports an alternate syntax for the
>>  .I /proc/sys/kernel/core_pattern
>> diff --git a/man5/proc.5 b/man5/proc.5
>> index c29eacc..940c1fa 100644
>> --- a/man5/proc.5
>> +++ b/man5/proc.5
>> @@ -2481,6 +2481,13 @@ For security reasons core dumps in this mode will not overwrite one
>>  another or other files.
>>  This mode is appropriate when administrators are
>>  attempting to debug problems in a normal environment.
>> +Additionally, since Linux 3.6,
>> +.\" 9520628e8ceb69fa9a4aee6b57f22675d9e1b709
>> +.I /proc/sys/kernel/core_pattern
>> +must either be a fully-qualified path, or a pipe command, as detailed in
>> +.BR core (5).
>> +Warnings will be emitted to the kernel syslog about disallowed combinations.
>
> What does "disallowed combinations" mean? Other than an absolute
> pathname or a pipe command? And other than the warning to the kernel
> log, how are the disallowed combinations treated? Are they ignored?

Yeah, by disallowed I mean a core_pattern that starts with neither /
nor | and suid_dumpable is set to 2. When conditions change to a
disallowed state, the kernel warns in dmesg. If a core dump happens
under this condition, the kernel warns again about the condition and
does not dump core.

-Kees

--
Kees Cook
Chrome OS Security
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
