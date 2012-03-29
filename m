From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [patch] nsswitch.conf.5: clarify the "notfound" status
Date: Fri, 30 Mar 2012 12:27:16 +1300
Message-ID: <CAKgNAkjpoc53+hqghx3nOnKPxp+O=R7M4uwxtEXsH0cseLtvbA@mail.gmail.com>
References: <4F735800.6040807@redhat.com> <4F737004.9060500@proseconsulting.co.uk>
 <CAKgNAkispRXUer73r_HW2Oh+gjoHuj3e4t7dHFtSNDDorjBeHQ@mail.gmail.com> <4F74D4B6.7040701@proseconsulting.co.uk>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4F74D4B6.7040701-/K+B3afwL8Jt0JrxVvvTASp2UmYkHbXO@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark R Bannister <mark-/K+B3afwL8Jt0JrxVvvTASp2UmYkHbXO@public.gmane.org>
Cc: Peter Schiffer <pschiffe-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Fri, Mar 30, 2012 at 10:31 AM, Mark R Bannister
<mark-/K+B3afwL8Jt0JrxVvvTASp2UmYkHbXO@public.gmane.org> wrote:
> On 29/03/2012 19:34, Michael Kerrisk (man-pages) wrote:
>>
>> On Thu, Mar 29, 2012 at 9:09 AM, Mark R Bannister
>> <mark-/K+B3afwL8Jt0JrxVvvTASp2UmYkHbXO@public.gmane.org> =A0wrote:
>>>
>>> On 28/03/2012 19:27, Peter Schiffer wrote:
>>>>
>>>> Hello,
>>>>
>>>> I am suggesting the following update of the =A0"notfound" status o=
n the
>>>> nsswitch.conf.5 man page. I am not 100% sure that this is the corr=
ect
>>>> place
>>>> where this information on the man page should be placed. Any comme=
nts
>>>> are
>>>> welcome.
>>>>
>>> Hi Peter,
>>>
>>> I did a rewrite of the nsswitch.conf man page in October last year:
>>>
>>> http://article.gmane.org/gmane.linux.man/2366/match=3Dnsswitch+conf
>>>
>>> I'm still waiting for Michael to incorporate these changes. =A0May =
I
>>> suggest
>>> you send in a patch that is applied against this? =A0I would also s=
uggest
>>> that
>>> if you're going to make reference to "initgroups" you'll need to ad=
d some
>>> further description somewhere that explains what this is and when y=
ou
>>> would
>>> use it.
>>
>> Looking a little deeper at this, I'd like another set of eyes. Mark,
>> would you be able to review Peter's patch?
>>
>> Thanks,
>>
>> Michael
>>
>
> I can't find this comment in glibc myself, there's nothing to this ef=
fect in
> grp/initgroups.c ?

=46ollow Peter's URL.

> I've tested on a build with glibc 2.5 - admittedly not the latest ver=
sion
> but it does feature the initgroups functionality - and I am not witne=
ssing
> this behaviour. =A0My configuration file has no initgroups line, and =
this
> entry:
>
> =A0 =A0group: db [NOTFOUND=3Dreturn] files
>
> ...always returns as expected if my /var/db/group.db file does not co=
ntain
> the group entry that I am searching for.
>
> So I don't concur with the suggested change ...

It looks like the change only arrived in glibc 2.14. Would you be able
to take a look there?

Thanks,

Michael


--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
