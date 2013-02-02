From: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [man-pages PATCH] Add note about calling fclose(NULL)
Date: Sat, 02 Feb 2013 02:11:08 +0100
Message-ID: <510C67AC.9040409@gmail.com>
References: <1695270.M7m4ekngnN@storm> <CAKgNAkiQsWWWTfLWeixN5+GcwkfP6UX+AYdL4HY6beq7rdpUxw@mail.gmail.com> <3571094.25JfT3zTrV@storm>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <3571094.25JfT3zTrV@storm>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thomas Jarosch <thomas.jarosch-XXsH3GEs1jrby3iVrkZq2A@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 01/31/2013 09:26 AM, Thomas Jarosch wrote:
> On Thursday, 31. January 2013 01:50:49 Michael Kerrisk wrote:
>>> diff --git a/man3/fclose.3 b/man3/fclose.3
>>> index 1bdf0a5..6945e89 100644
>>> --- a/man3/fclose.3
>>> +++ b/man3/fclose.3
>>> @@ -97,6 +97,10 @@ on disk the kernel buffers must be flushed too, for
>>> example, with> 
>>>  .BR sync (2)
>>>  or
>>>  .BR fsync (2).
>>>
>>> +Also it's undefined behavior to call
>>> +.BR fclose ()
>>> +with a NULL pointer.
>>> +
>>
>> Could you supply some explanation of why you think this patch is required?
> 
> I always thought fclose(NULL) behaves like free(NULL)
> and even sent a patch for the "perf" utility assuming this.
> Luckily Arnaldo caught the error before applying the patch,
> at least in one case.
> 
> Also fclose(NULL) "works" fine on HP-UX and Solaris,
> glibc will die with a segfault.

Thomas,

Can you define "works" with respect to those OSes? Their man pages seems 
to say nothing about fclose(NULL). At this stage, I'm not convinced that
adding this text to the man page is really required.

Thanks,

Michael


--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
