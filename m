From: Mark R Bannister <mark-/K+B3afwL8Jt0JrxVvvTASp2UmYkHbXO@public.gmane.org>
Subject: Re: [patch] nsswitch.conf.5: clarify the "notfound" status
Date: Thu, 29 Mar 2012 22:31:34 +0100
Message-ID: <4F74D4B6.7040701@proseconsulting.co.uk>
References: <4F735800.6040807@redhat.com> <4F737004.9060500@proseconsulting.co.uk> <CAKgNAkispRXUer73r_HW2Oh+gjoHuj3e4t7dHFtSNDDorjBeHQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAKgNAkispRXUer73r_HW2Oh+gjoHuj3e4t7dHFtSNDDorjBeHQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: Peter Schiffer <pschiffe-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 29/03/2012 19:34, Michael Kerrisk (man-pages) wrote:
> On Thu, Mar 29, 2012 at 9:09 AM, Mark R Bannister
> <mark-/K+B3afwL8Jt0JrxVvvTASp2UmYkHbXO@public.gmane.org>  wrote:
>> On 28/03/2012 19:27, Peter Schiffer wrote:
>>> Hello,
>>>
>>> I am suggesting the following update of the  "notfound" status on the
>>> nsswitch.conf.5 man page. I am not 100% sure that this is the correct place
>>> where this information on the man page should be placed. Any comments are
>>> welcome.
>>>
>> Hi Peter,
>>
>> I did a rewrite of the nsswitch.conf man page in October last year:
>>
>> http://article.gmane.org/gmane.linux.man/2366/match=nsswitch+conf
>>
>> I'm still waiting for Michael to incorporate these changes.  May I suggest
>> you send in a patch that is applied against this?  I would also suggest that
>> if you're going to make reference to "initgroups" you'll need to add some
>> further description somewhere that explains what this is and when you would
>> use it.
> Looking a little deeper at this, I'd like another set of eyes. Mark,
> would you be able to review Peter's patch?
>
> Thanks,
>
> Michael
>

I can't find this comment in glibc myself, there's nothing to this 
effect in grp/initgroups.c ?

I've tested on a build with glibc 2.5 - admittedly not the latest 
version but it does feature the initgroups functionality - and I am not 
witnessing this behaviour.  My configuration file has no initgroups 
line, and this entry:

     group: db [NOTFOUND=return] files

...always returns as expected if my /var/db/group.db file does not 
contain the group entry that I am searching for.

So I don't concur with the suggested change ...

Best regards,
Mark.

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
