From: Peter Schiffer <pschiffe-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [patch] nsswitch.conf.5: clarify the "notfound" status
Date: Mon, 09 Jul 2012 14:59:58 +0200
Message-ID: <4FFAD5CE.5000903@redhat.com>
References: <4F735800.6040807@redhat.com> <4F737004.9060500@proseconsulting.co.uk> <CAKgNAkispRXUer73r_HW2Oh+gjoHuj3e4t7dHFtSNDDorjBeHQ@mail.gmail.com> <4F74D4B6.7040701@proseconsulting.co.uk> <CAKgNAkjpoc53+hqghx3nOnKPxp+O=R7M4uwxtEXsH0cseLtvbA@mail.gmail.com> <4F755DF2.3090906@redhat.com> <4FC5E6E2.9070008@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4FC5E6E2.9070008-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: Mark R Bannister <mark-/K+B3afwL8Jt0JrxVvvTASp2UmYkHbXO@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

ping

On 05/30/2012 11:22 AM, Peter Schiffer wrote:
> Hello,
>
> I've updated the patch against the latest man-pages 3.41.
> Also, I've added description of the initgroups database,
> reformulated the note and moved it to the return action.
>
> What do you think?
>
> Thanks,
>
> peter
>
>
> --- nsswitch.conf.5.org    2012-05-10 22:13:23.000000000 +0200
> +++ nsswitch.conf.5    2012-05-30 11:16:26.881542800 +0200
> @@ -59,6 +59,11 @@
>  .BR gethostbyname (3)
>  and related functions.
>  .TP
> +.B initgroups
> +Supplementary group access list, used by
> +.BR getgrouplist (3)
> +function.
> +.TP
>  .B netgroup
>  Network-wide list of hosts and users, used for access rules.
>  C libraries before glibc 2.1 supported netgroups only over NIS.
> @@ -241,6 +246,10 @@
>  .B return
>  Return a result now.
>  Do not call any further lookup functions.
> +However, for compatibility reasons, if this is the selected action
> +for the `group' database and the `notfound' status,
> +and the configuration file does not contain the `initgroups' line,
> +the next lookup function is always called, without affecting the 
> search result.
>  .TP
>  .B continue
>  Call the next lookup function.
>
>
> On 03/30/2012 09:17 AM, Peter Schiffer wrote:
>> Hello guys,
>>
>> thanks for looking into this. I am adding some notes below:
>>
>> On 03/30/2012 01:27 AM, Michael Kerrisk (man-pages) wrote:
>>> On Fri, Mar 30, 2012 at 10:31 AM, Mark R Bannister
>>> <mark-/K+B3afwL8Jt0JrxVvvTASp2UmYkHbXO@public.gmane.org>  wrote:
>>>> On 29/03/2012 19:34, Michael Kerrisk (man-pages) wrote:
>>>>> On Thu, Mar 29, 2012 at 9:09 AM, Mark R Bannister
>>>>> <mark-/K+B3afwL8Jt0JrxVvvTASp2UmYkHbXO@public.gmane.org>    wrote:
>>>>>> On 28/03/2012 19:27, Peter Schiffer wrote:
>>>>>>> Hello,
>>>>>>>
>>>>>>> I am suggesting the following update of the "notfound" status on 
>>>>>>> the
>>>>>>> nsswitch.conf.5 man page. I am not 100% sure that this is the 
>>>>>>> correct
>>>>>>> place
>>>>>>> where this information on the man page should be placed. Any 
>>>>>>> comments
>>>>>>> are
>>>>>>> welcome.
>>>>>>>
>>>>>> Hi Peter,
>>>>>>
>>>>>> I did a rewrite of the nsswitch.conf man page in October last year:
>>>>>>
>>>>>> http://article.gmane.org/gmane.linux.man/2366/match=nsswitch+conf
>>>>>>
>>>>>> I'm still waiting for Michael to incorporate these changes.  May I
>>>>>> suggest
>>>>>> you send in a patch that is applied against this?  I would also 
>>>>>> suggest
>>>>>> that
>>>>>> if you're going to make reference to "initgroups" you'll need to 
>>>>>> add some
>>>>>> further description somewhere that explains what this is and when 
>>>>>> you
>>>>>> would
>>>>>> use it.
>>>>> Looking a little deeper at this, I'd like another set of eyes. Mark,
>>>>> would you be able to review Peter's patch?
>>>>>
>>>>> Thanks,
>>>>>
>>>>> Michael
>>>>>
>>>> I can't find this comment in glibc myself, there's nothing to this 
>>>> effect in
>>>> grp/initgroups.c ?
>>> Follow Peter's URL.
>>>
>>>> I've tested on a build with glibc 2.5 - admittedly not the latest 
>>>> version
>>>> but it does feature the initgroups functionality - and I am not 
>>>> witnessing
>>>> this behaviour.  My configuration file has no initgroups line, and 
>>>> this
>>>> entry:
>>>>
>>>>     group: db [NOTFOUND=return] files
>>>>
>>>> ...always returns as expected if my /var/db/group.db file does not 
>>>> contain
>>>> the group entry that I am searching for.
>>>>
>>>> So I don't concur with the suggested change ...
>> The result is always as expected, the added note should clarify how
>> the search is done. Important example would be like this:
>>
>> group:      files [!NOTFOUND=return] XXXXXX
>>
>> what means, according to the current text in the man page, that if the
>> result from "files" is either SUCCESS, UNAVAIL or TRYAGAIN, then,
>> it should be returned. Well, it is, but the XXXXXX is also _always_ 
>> searched.
>> Without the suggested note, it can be confusing while testing or 
>> setting up,
>> also, if the XXXXXX is some remote service, this can create some hard 
>> to find
>> delays.
>>
>> Thanks,
>>
>> peter
>>> It looks like the change only arrived in glibc 2.14. Would you be able
>>> to take a look there?
>>>
>>> Thanks,
>>>
>>> Michael
> -- 
> To unsubscribe from this list: send the line "unsubscribe linux-man" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html


--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
