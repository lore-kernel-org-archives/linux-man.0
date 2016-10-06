From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] core(5): add more details for output paths and the crash
 handler
Date: Thu, 6 Oct 2016 07:51:53 +0200
Message-ID: <e2e0ffd8-bf10-46de-4dbc-ceadd22ebe42@gmail.com>
References: <20160928111450.32157-1-vapier@gentoo.org>
 <CAKgNAkhFQnk=9k6J_mu8inhfFMaVwn=AhdH9xPg=HKG1OEiqyA@mail.gmail.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAKgNAkhFQnk=9k6J_mu8inhfFMaVwn=AhdH9xPg=HKG1OEiqyA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Cc: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hi Mike,

Ping!

Cheers,

Michael


On 09/30/2016 10:05 AM, Michael Kerrisk (man-pages) wrote:
> Hi Mike,
> 
> Nice additions. Some comments below.
> 
> On 28 September 2016 at 13:14, Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org> wrote:
>> People sometimes assume that the crash handler runs in the same context
>> as the crashing process.  They would be incorrect :).
>> ---
>>  man5/core.5 | 30 ++++++++++++++++++++++++++++++
>>  1 file changed, 30 insertions(+)
>>
>> diff --git a/man5/core.5 b/man5/core.5
>> index c587da5209c8..1c2c6a45c047 100644
>> --- a/man5/core.5
>> +++ b/man5/core.5
>> @@ -208,6 +208,16 @@ and
>>  (see below)
>>  is nonzero, then .PID will be appended to the core filename.
>>
>> +Paths are interpreted according to the settings that are active for the
>> +crashing process.
>> +That means the current mount
>> +.BR namespaces (7),
> 
> Better here would be a reference to the (newish) mount_namespaces(7) page?
> 
>> +the current working directory (found via
>> +.BR getcwd (2)),
>> +and the current
>> +.BR chroot (2)
>> +path.
>> +
>>  Since version 2.4, Linux has also provided
>>  a more primitive method of controlling
>>  the name of the core dump file.
>> @@ -240,9 +250,29 @@ The program must be specified using an absolute pathname (or a
>>  pathname relative to the root directory, \fI/\fP),
>>  and must immediately follow the '|' character.
>>  .IP *
>> +The program must live in the root filesystem as it is always executed there.
> 
> Should the wording here be something like: "The program pathname is
> interpreted with respect to the initial mount namespace"?
> 
>> +It is not affected by the
>> +.BR chroot (2)
>> +setting of the crashing process.
>> +.IP *
>>  The process created to run the program runs as user and group
>>  .IR root .
>>  .IP *
>> +Running as
>> +.I root
>> +does not confer any exceptional security bypasses.
>> +Namely, LSMs (e.g. SELinux) are still active and may prevent the handler
>> +from accessing details about the crashed process via
>> +.I /proc/PID
>> +.IP *
>> +The process created runs in the initial namespaces (pid, mount, user, etc...)
>> +and not in the namespaces of the crashing process.
>> +You can utilize specifiers like
>> +.I %P
>> +to find the right
>> +.I /proc/PID
>> +directory and probe/enter the crashing process's namespaces if needed.
>> +.IP *
>>  Command-line arguments can be supplied to the
>>  program (since Linux 2.6.24),
>>  delimited by white space (up to a total line length of 128 bytes).
> 
> Cheers,
> 
> Michael
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
