From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [patch] getrandom.2, random.4: Consolidate and improve discussion
 on usage of randomness
Date: Thu, 10 Nov 2016 19:16:05 +0100
Message-ID: <02c2fa67-ce72-010b-e1ac-ae52c1bc6cf2@gmail.com>
References: <CACsCw1MM+eH2zpSajyaT42jHPzrjuxcWpxPA7qqVTBR=uzaLYA@mail.gmail.com>
 <55B65DAC.6010906@lgeorget.eu>
 <2fc34759-5d2b-4192-9611-b499e23efdf8@gmail.com>
 <1478767372.2642.15.camel@redhat.com>
 <fa60e32a-1364-d0be-245f-d8ead6d04713@gmail.com>
 <1478788558.3579.47.camel@redhat.com>
 <66494ef9-80d1-e437-252a-4a15e1f497db@lgeorget.eu>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <66494ef9-80d1-e437-252a-4a15e1f497db-AyimVQWTEHzsq35pWSNszA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laurent Georget <laurent-AyimVQWTEHzsq35pWSNszA@public.gmane.org>, Nikos Mavrogiannopoulos <nmav-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, =?UTF-8?Q?Carl_Winb=c3=a4ck?= <c@tunnel53.net>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephan Mueller <smueller-T9tCv8IpfcWELgA04lAiVw@public.gmane.org>, George Spelvin <linux-gpGsJRJZ3PBBDgjK7y7TUQ@public.gmane.org>, Theodore T'so <tytso-3s7WtUTddSA@public.gmane.org>, mpm-VDJrAJ4Gl5ZBDgjK7y7TUQ@public.gmane.org, ibobrik-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, matt-6J8q6J5oQjkQrrorzV6ljw@public.gmane.org, luke-g3IQT7+C+D7QXOPxS62xeg@public.gmane.org, on2014nm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-man@vger.kernel.org

Nikos, Laurent,

On 11/10/2016 04:10 PM, Laurent Georget wrote:
> 
> 
> Le 10/11/2016 à 15:35, Nikos Mavrogiannopoulos a écrit :
>> On Thu, 2016-11-10 at 15:23 +0100, Michael Kerrisk (man-pages) wrote:
>>> [was: Re: Status for bug 71211? [random(4): clarify utility and
>>> volume]]
>>>
>>> Hello Nikos,
>>>
>>> On 11/10/2016 09:42 AM, Nikos Mavrogiannopoulos wrote:
>>>>
>>>> On Wed, 2016-11-09 at 16:27 +0100, Michael Kerrisk (man-pages)
>>>> wrote:
>>>>>
>>>>> Nikos,
>>>>>
>>>>> This was an earlier mail from Laurent Georget. I bring
>>>>> you into this thread in case there's any of Laurent's comments
>>>>> that may be helpful as inspiration for your patch.
>>>>>
>>>>> See also https://bugzilla.kernel.org/show_bug.cgi?id=71211
>>>>
>>>> I think that's a nice comment. The text referred to applies to old
>>>> kernels not new ones (especially not after the recent rewrite), and
>>>> I
>>>> think it documents and opinion rather than a fact. I am inclined to
>>>> simply drop the referred paragraph. Any better suggestions?
>>>
>>> Dropping the paragraph appears too strong too me. Surely we want 
>>> to maintain a recommendation not to consume too much data from
>>> /dev/urandom?
>>
>> Stephan Mueller or Ted should be able to provide more info for the new
>> code. I think in the new versions of /dev/urandom the amount consumed
>> shouldn't cause issues or affect other users.
>>
>> However, I agree that overall, that this is a low level interface and
>> it should be treated as such. I.e., I'd expect applications to use
>> their crypto libraries' interfaces rather than getrandom directly. The
>> reason is not only about being slow, but about having to take care
>> about EINTR, short reads, quirks such as for early boot, etc [0].
> 
> I agree. For non-cryptographic uses, it's always better to use a userspace
> random-number generator such as the generators provided by the standard
> library of Java, Python, etc. or by OpenSSL. For cryptographic purposes,
> check what available libraries have first, and if needs be, getrandom is
> fine for all reasonable usesand avoid the hassle of opening and closing
> /dev/urandom.
> 
> The warning about the limits of /dev/urandom proposed in the other patch
> (about short reads and EINTR) seems sufficient to me. It's also already
> written that up to 256 bytes is always fine, more than 32MB at once is
> impossible. I don't think we need to stress out anything else.

So, I must admit that after your respective mails, I'm still not
clear. Do you think I should keep this patch, change it, or
discard it?

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
