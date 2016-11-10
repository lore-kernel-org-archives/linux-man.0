From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] Update the random(4) documentation towards a more
 accurate view on /dev/urandom
Date: Thu, 10 Nov 2016 12:56:34 +0100
Message-ID: <a42d9f33-5552-6e21-4aaf-f2c57e7af4a0@gmail.com>
References: <1461574090.32558.45.camel@redhat.com>
 <1470052099.2926.6.camel@redhat.com> <1476952646.2522.10.camel@redhat.com>
 <b07fb334-149d-cf65-74f3-1d1951e5981b@gmail.com>
 <1478768067.2642.23.camel@redhat.com>
 <3b7ba39b-0434-47ca-7857-257f3c99266b@lgeorget.eu>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <3b7ba39b-0434-47ca-7857-257f3c99266b-AyimVQWTEHzsq35pWSNszA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laurent Georget <laurent-AyimVQWTEHzsq35pWSNszA@public.gmane.org>, Nikos Mavrogiannopoulos <nmav-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, tytso-3s7WtUTddSA@public.gmane.org, George Spelvin <linux-gpGsJRJZ3PBBDgjK7y7TUQ@public.gmane.org>, Stephan Mueller <smueller-T9tCv8IpfcWELgA04lAiVw@public.gmane.org>, =?UTF-8?Q?Carl_Winb=c3=a4ck?= <c@tunnel53.net>, mpm-VDJrAJ4Gl5ZBDgjK7y7TUQ@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Laurent,

On 11/10/2016 10:11 AM, Laurent Georget wrote:
> Hi everyone,
> 
> I very much like the proposed patch. It nicely describes the new
> interfaces and it's much more clear. I agree with the use of the
> word "legacy" you don't seem to like, Michael, I think this is
> accurate (although we might receive a new fair amount of bug reports
> about this, when the patch is applied).

Thanks for your comments Laurent! It's really helpful to
have a second voice confirming a patch to a man page where
my background is weak. I've applied the patch, and added a
Reviewed-by: tag from you.

> By the way, my mail was intended as an answer to the bug report but
> I wonder if Corey Csuhta (the original bug poster) saw it because I
> replied by email. What should we do about this bug now?

I'll take this to the other thread.

Cheers,

Michael

> Le 10/11/2016 à 09:54, Nikos Mavrogiannopoulos a écrit :
>> On Wed, 2016-11-09 at 16:23 +0100, Michael Kerrisk (man-pages) wrote:
>>> [I'm looping a few people into this mail who previously commented
>>> on this page. Nikos, I will also thread you into an earlier mail 
>>> by Laurent Georget.]
>>>
>>> Hello Nikos,
>>>
>>> Sorry that I have been so slow to follow up on this.
>>> Thanks for your persistence. I have some comments 
>>> that probably require some tweaks to your patch.
>>> I also have some questions about a couple of other 
>>> earlier discussions.
>>
>> The comments should be addressed now (see inline for more info or the
>> attached patch). I have not included my proposed fix for Laurent's
>> issue (my proposal was to drop that text, though it can be done
>> independent of this patch).
>>
>> https://bugzilla.kernel.org/show_bug.cgi?id=71211
>>
>>
>>
>>
>>>
>>> On 10/20/2016 10:37 AM, Nikos Mavrogiannopoulos wrote:
>>>>
>>>> On Mon, 2016-08-01 at 13:48 +0200, Nikos Mavrogiannopoulos wrote:
>>>>>
>>>>>>
>>>>>> This is an updated patch reflecting the recent discussion in
>>>>>> linux-
>>>>>> crypto:
>>>>>> http://www.mail-archive.com/linux-crypto-u79uwXL29TY76Z2rM5mHXA@public.gmane.org/msg204
>>>>>> 00.html
>>>> Hi,
>>>>  I'm resending the patch with few typo fixes, and adding Ted in CC
>>>> for
>>>> review. Ted would you like to review this patch for the random(4)
>>>> manpage?
>>>
>>> Some comments below.
>>>
>>> But one question first. You didn't further reply to George 
>>> Spelvin's comments on 26 April. Did you consider those comments
>>> irrelevant or already addressed or something else?
>>
>> I believe we disagree on some points with George (see other mail).
>>
>>> By the way, inline patches are rather easier for me to deal with.
>>
>> (sorry for the attachment, I have no figured a way to make my mailer
>> send consistently the right data when inline)
>>
>>
>>>> +.\" 2016-10-20, Nikos Mavrogiannopoulos <nmav-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
>>>> +.\"     Mention that /dev/random is a legacy interface and removed
>>>> suggested
>>>> +.\"     uses of /dev/random.
>>>
>>> No need to update this in-page changelog. We use git these days.
>>
>> done
>>
>>>> +.LP
>>>> +The \fI/dev/random\fP device is a legacy interface which dates
>>>> back to
>>>> +a time where the cryptographic primitives used in the
>>>> implementation
>>>
>>> s%in the implementation%in the implementation of /dev/urandom% ?
>>>
>>
>> done.
>>
>>>>  has no effect when opening
>>>>  .IR /dev/urandom .
>>>> @@ -82,6 +84,8 @@ for the device
>>>>  signals will not be handled until after the requested random bytes
>>>>  have been generated.
>>>>  
>>>> +
>>>> +
>>>
>>> Please remove these two blank lines.
>>
>> done.
>>
>>
>>>>  Since Linux 3.16,
>>>>  .\" commit 79a8468747c5f95ed3d5ce8376a3e82e0c5857fc
>>>>  a
>>>> @@ -104,14 +108,11 @@ This means that it will impact the contents
>>>>  read from both files, but it will not make reads from
>>>>  \fI/dev/random\fP faster.
>>>>  .SS Usage
>>>> -If you are unsure about whether you should use
>>>> +The 
>>>>  .IR /dev/random
>>>> -or
>>>> +interface is considered a legacy interface, and
>>>
>>> I'm a little uncomfortable with the term "legacy". To me it implies 
>>> that there is *no* legitimate use of /dev/random these days. I'm
>>> no expert on randomness, but I wonder if that is true. Is it?
>>> If it's not, then I would prefer simply a strong statement that
>>> "/dev/urandom is preferred and sufficient in all use cases".
>>
>> That's a tough one to handle. Yes /dev/urandom is preferred and
>> sufficient in all use cases, with the exception of early boot time.
>> More in the text. I've also added a section "KNOWN ISSUES" to state
>> clearly that issue, and mention getrandom() early in the page.
>>
>>  
>>>>  If a seed file is saved across reboots as recommended below (all
>>>> major
>>>>  Linux distributions have done this since 2000 at least), the
>>>> output is
>>>> -- 2.7.4
>>> Laurent Georget also commented on this page in a mail last year.
>>> I'm going to thread you (and the other people on this mail) into
>>> that mail discussion in case there's something there that you
>>> might incorporate into a revised patch.
>>
>> I think it was a different paragraph. Replied in the other email.
>>
>> regards,
>> Nikos
>>
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
