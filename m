From: Mijo Safradin <safradin-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH] proc.5: Add missing fields to /proc/PID/stat
Date: Thu, 10 Jul 2014 12:24:14 +0200 (CEST)
Message-ID: <alpine.DEB.2.02.1407101216210.30830@tp530.de.ibm.com>
References: <1404983420-21338-1-git-send-email-mijo@linux.vnet.ibm.com> <53BE5E17.8050509@redhat.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII; format=flowed
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <53BE5E17.8050509-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jan Chaloupka <jchaloup-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org


Hi Jan,

ok, thanks.

Mijo


On Thu, 10 Jul 2014, Jan Chaloupka wrote:

> Hi, Mijo,
>
> the patch is already sent
>
> http://www.spinics.net/lists/linux-man/msg06029.html
>
> Just not pushed to the repo.
>
> Jan
>
> On 07/10/2014 11:10 AM, Mijo Safradin wrote:
>> Merge stat fields from upstream file 'fs/proc/array.c'
>> 
>> Fields to add:
>> 'start_data', 'end_data', 'start_brk', 'arg_start',
>> 'arg_end', 'env_start', 'env_end', 'exit_code'
>> ---
>>   man5/proc.5 |   25 +++++++++++++++++++++++++
>>   1 file changed, 25 insertions(+)
>> 
>> diff --git a/man5/proc.5 b/man5/proc.5
>> index 239d8ac..617c20a 100644
>> --- a/man5/proc.5
>> +++ b/man5/proc.5
>> @@ -1383,6 +1383,31 @@ for a guest operating system), measured in clock 
>> ticks (divide by
>>   \fIcguest_time\fP %ld (since Linux 2.6.24)
>>   (44) Guest time of the process's children, measured in clock ticks 
>> (divide by
>>   .IR sysconf(_SC_CLK_TCK) ).
>> +.TP
>> +\fIstartdata\fP %lu
>> +(45) address above which program data+bss is placed.
>> +.TP
>> +\fIenddata\fP %lu
>> +(46) address below which program data+bss is placed.
>> +.TP
>> +\fIstartbrk\fP %lu
>> +(47) address above which program heap can be expanded with brk().
>> +.TP
>> +\fIargstart\fP %lu
>> +(48) address above which program command line is placed.
>> +.TP
>> +\fIargend\fP %lu
>> +(49) address below which program command line is placed.
>> +.TP
>> +\fIenvstart\fP %lu
>> +(50) address above which program environment is placed.
>> +.TP
>> +\fIenvend\fP %lu
>> +(51) address below which program environment is placed.
>> +.TP
>> +\fIexitcode\fP %lu
>> +(52) the thread's exit_code in the form reported by the waitpid system 
>> call.
>> +.TP
>>   .RE
>>   .TP
>>   .I /proc/[pid]/statm
>
> -- 
> Jan Chaloupka
> ------------------------------
> * Software Engineer          *
> * ENG Base Operating Systems *
> * Red Hat Czech, s. r. o.    *
> * UTC+1 (CET), jchaloup      *
>
>

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
