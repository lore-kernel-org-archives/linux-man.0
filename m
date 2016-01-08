From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] prctl.2: PR_SET_PDEATHSIG by orphan process
Date: Fri, 8 Jan 2016 20:18:57 +0100
Message-ID: <56900BA1.6000708@gmail.com>
References: <1452104606-25569-1-git-send-email-jann@thejh.net>
 <568FE223.20209@gmail.com> <20160108163949.GA4313@pc.thejh.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160108163949.GA4313-J1fxOzX/cBvk1uMJSBkQmQ@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jann Horn <jann-XZ1E9jl8jIdeoWH0uzbU5w@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi Jann,

On 01/08/2016 05:39 PM, Jann Horn wrote:
> On Fri, Jan 08, 2016 at 05:21:55PM +0100, Michael Kerrisk (man-pages) wrote:
>> Hi Jann,
>>
>> Your mail is a little cryptic. It would be best to start with
>> a brief summary of your point--something like the text of your
>> patch at the end of the mail.
> 
> Ok, will do that next time. I wanted to avoid duplicating the content.

But you did it again :-). See below.

>> On 01/06/2016 07:23 PM, Jann Horn wrote:
>>> Proof:
>>> In kernel/sys.c:
>>>
>>> 	case PR_SET_PDEATHSIG:
>>> 		if (!valid_signal(arg2)) {
>>> 			error = -EINVAL;
>>> 			break;
>>> 		}
>>> 		me->pdeath_signal = arg2;
>>> 		break;
>>
>> I don't understand how the code above relates to the point you
>> want to make. (Or maybe you mean: "look, there's no check here
>> to see that if the parent is already dead"; but it would help
>> to state that explicitly).
> 
> Yes, that's what I meant.
> 
> 
>>> Testcase:
>>>
>>> #include <sys/prctl.h>
>>> #include <err.h>
>>> #include <unistd.h>
>>> #include <signal.h>
>>> #include <stdio.h>
>>>
>>> void ponk(int s) {
>>>   puts("ponk!");
>>> }
>>>
>>> int main(void) {
>>>   if (fork() == 0) {
>>>     if (fork() == 0) {
>>>       sleep(1);
>>>       signal(SIGUSR1, ponk);
>>>       prctl(PR_SET_PDEATHSIG, SIGUSR1, 0, 0, 0);
>>>       sleep(1);
>>>       return 0;
>>>     }
>>>     return 0;
>>>   }
>>>
>>>   sleep(3);
>>>   return 0;
>>> }
>>> ---
>>>  man2/prctl.2 | 3 +++
>>>  1 file changed, 3 insertions(+)
>>>
>>> diff --git a/man2/prctl.2 b/man2/prctl.2
>>> index 5cea3bb..3dce8e9 100644
>>> --- a/man2/prctl.2
>>> +++ b/man2/prctl.2
>>> @@ -670,6 +670,9 @@ In other words, the signal will be sent when that thread terminates
>>>  (via, for example,
>>>  .BR pthread_exit (3)),
>>>  rather than after all of the threads in the parent process terminate.
>>> +
>>> +If the parent has already died by the time the parent death signal
>>> +is set, the new parent death signal will not be sent.
>>
>> In a way, this seems almost obvious. But perhaps it is better to make the
>> point explicitly, as you suggest. But, because there may have been a
>> previous PR_SET_PDEATHSIG, I'd prefer something like this:
>>
>> [[
>> If the caller's parent has already died by the time of this
>> PR_SET_PDEATHSIG operation, the operation shall have no effect.
>> ]]
>>
>> What do you think?
> 
> I don't think "no effect" would be strictly correct because weird stuff
> happens on subreaper death - I'm not sure whether this is intended or a
> bug though:

Pause. Please begin with a short explanation of what you're about to
demonstrate with the following code.... As it is, I am (again) not at
all clear about the point you are trying to make.

> $ cat deathsig2.c
> #include <sys/prctl.h>
> #include <err.h>
> #include <unistd.h>
> #include <signal.h>
> #include <stdio.h>
> 
> void ponk(int s) {
>   puts("ponk!");
> }
> 
> int main(void) {
>   if (fork() == 0) {
>     prctl(PR_SET_CHILD_SUBREAPER, 1, 0, 0, 0);
>     puts("enabled subreaper");
>     if (fork() == 0) {
>       if (fork() == 0) {
>         sleep(1);
>         puts("setting deathsig...");
>         signal(SIGUSR1, ponk);
>         prctl(PR_SET_PDEATHSIG, SIGUSR1, 0, 0, 0);
>         sleep(2);
>         return 0;
>       }
>       puts("parent will die now, causing reparent to subreaper");
>       return 0;
>     }
>     sleep(2);
>     puts("subreaper will die now");
>     return 0;
>   }
>   sleep(4);
>   return 0;
> }
> $ gcc -o deathsig2 deathsig2.c
> $ cat deathsig3.c
> #include <sys/prctl.h>
> #include <err.h>
> #include <unistd.h>
> #include <signal.h>
> #include <stdio.h>
> 
> void ponk(int s) {
>   puts("ponk!");
> }
> 
> int main(void) {
>   if (fork() == 0) {
>     prctl(PR_SET_CHILD_SUBREAPER, 1, 0, 0, 0);
>     puts("enabled subreaper");
>     if (fork() == 0) {
>       if (fork() == 0) {
>         puts("setting deathsig...");
>         signal(SIGUSR1, ponk);
>         prctl(PR_SET_PDEATHSIG, SIGUSR1, 0, 0, 0);
>         sleep(3);
>         return 0;
>       }
>       sleep(1);
>       puts("parent will die now, causing reparent to subreaper");
>       return 0;
>     }
>     sleep(2);
>     puts("subreaper will die now");
>     return 0;
>   }
>   sleep(4);
>   return 0;
> }
> $ gcc -o deathsig3 deathsig3.c
> $ ./deathsig2
> enabled subreaper
> parent will die now, causing reparent to subreaper
> setting deathsig...
> subreaper will die now
> ponk!
> $ ./deathsig3
> enabled subreaper
> setting deathsig...
> parent will die now, causing reparent to subreaper
> ponk!
> subreaper will die now
> $ 
> 
> I didn't manage to find the reason for that in the code.

The reason for *what*? I am none the wiser.... What do you
see as anomalous in the above? Please explain, so I can
follow you.

> Sorry, I probably should have tried to figure out the details of
> this before sending a manpages patch.

FWIW, all of the above looks legitimate and expected to me, but
again, I'm not sure, because you didn't explain your point, just
showed some code...

Thanks,

Michael


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
