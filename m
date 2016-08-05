From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: WEXITSTATUS() under wait(2) has ambiguous description
Date: Sat, 6 Aug 2016 09:52:17 +1000
Message-ID: <dba9f0e5-54df-a987-9aa3-d246c73e133a@gmail.com>
References: <DED29858-0AB0-4BCE-A80E-998C67542001@cpanel.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <DED29858-0AB0-4BCE-A80E-998C67542001-Fu4SeaK3EASsTnJN9+BGXg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sloane Bernstein <sloane-Fu4SeaK3EASsTnJN9+BGXg@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Sloane,

On 08/04/2016 10:55 PM, Sloane Bernstein wrote:
> Hello,
>
> I believe that the description of the WEXITSTATUS() macro from the
> wait(2) manpage <http://man7.org/linux/man-pages/man2/wait.2.html> is
> either incorrect or very unclear:
>
>>        WEXITSTATUS(wstatus)
>>
>>               returns the exit status of the child.  This consists of the
>>               least significant 8 bits of the wstatus argument that the
>>               child specified in a call to exit(3) or _exit(2) or as the
>>               argument for a return statement in main().  This macro should
>>               be employed only if WIFEXITED returned true.
>
> The system's headers (it's a CentOS 6.8 system I pulled these from,
> IIRC) themselves define the macro as:
>
>> # define WEXITSTATUS(status)    __WEXITSTATUS (__WAIT_INT (status))
>
> from sys/wait.h and
>
>> #define __WEXITSTATUS(status)   (((status) & 0xff00) >> 8)
>
>
> but a simplistic reading of the manpage entry seems to imply that the
>  latter definition should be:
>
>> #define __WEXITSTATUS(status)   ((status) & 0xff)
>
>
> It isn't, of course. When the manpage refers to "the wstatus
> argument", it is too easy to associate it to the argument named in
> the declaration of the macro just above, rather than to the single
> argument of exit(3) or _exit(2) (which in both
> <http://man7.org/linux/man-pages/man3/exit.3.html> and
> <http://man7.org/linux/man-pages/man2/_exit.2.html> is actually
> called "status", not "wstatus").
>
> Because both exit(3) and _exit(2) only take a single argument, I
> would suggest striking "wstatus" from the text of the explanation of
> WEXITSTATUS(), since it is not ambiguous which argument of those
> functions is being referred to.

So, the "status" that you point is indeed a typo. I accidentally
injected that typo during a recent global edit. It should read "status"
and I've now fixed the page to reflect that, so the text now reads:

        WEXITSTATUS(wstatus)
               returns the exit status of the child.  This consists of the
               least significant 8 bits of the status  argument  that  the
               child  specified in a call to exit(3) or _exit(2) or as the
               argument for a return  statement  in  main().   This  macro
               should be employed only if WIFEXITED returned true.

Thanks for the report!

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
