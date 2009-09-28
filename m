From: Michael Kerrisk <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: [PATCHES] Typos and questions
Date: Mon, 28 Sep 2009 12:53:53 +0200
Message-ID: <cfd18e0f0909280353l1f84da77y8c08aae94b026a09@mail.gmail.com>
References: <20090926054751.GA11597@nekral.nekral.homelinux.net>
	 <cfd18e0f0909270056m39a15b1dy1ffcd88a32f2023f@mail.gmail.com>
	 <cfd18e0f0909280353v716a76b5n69ba9b8ff0be0f90@mail.gmail.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <cfd18e0f0909280353v716a76b5n69ba9b8ff0be0f90-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?ISO-8859-1?Q?Nicolas_Fran=E7ois?= <nicolas.francois-Fa7rcPG4DJn7nK0/Xc0eeg@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

I meant to add. All of these changes are now pushed to the git repo on
kernel.org.

On Mon, Sep 28, 2009 at 12:53 PM, Michael Kerrisk
<mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org> wrote:
> Salut Nicolas,
>
> On Sun, Sep 27, 2009 at 9:56 AM, Michael Kerrisk
> <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org> wrote:
>>> The patches starting with a 9 need to be reviewed. Some of them are=
 not
>>> patches, but questions:
>>> =A0* 904-tcp.7-list_separator.patch
>>> =A0* 919_cpuset.7-question.patch
>>
>> Hi Nicolas,
>>
>> It was great how you split out the 0* and 9* series. Thanks. In fact=
,
>> you could have been even more confident with some of the 9* patches,
>> since they were (to my eye) unquestionably correct :-).
>>
>> I have so far processed the following:
>>
>> 905 applied
>> 906 applied
>> 908 applied
>> 909 rejected (this preposition is okay)
>> 910 applied
>> 911 edited: in fact what was missing was "to" berfor "POSIX.1-2001".
>> 912 applied
>> 914 applied
>>
>> I will get to the rest later.
>
> I've now processed the following:
>
> 901 rejected. I think the existing text is okay.
>
> 902 applied, along with a few other fixes along similar lines.
>
> 903 applied
>
> 904 Could you please resubmit this separately, and show the contents
> of these two /proc files on your systrem as produced by "od -c"?
> (Shell sessions that modified the "allowed" value and showed me befor=
e
> and after "od -c" would be great!)
>
> 907 applied
>
> 913 I think the first part suggested by this patch isn't needed (I
> don't see the problem -- but please resubmit with more detail, if you
> think I'm being slow ;-).) I applied the second part of the patch
> (s/Thursday/Monday/).
>
> 915 rejected. As far as I know this is simply incorrect.
> If you think otherwise, could I ask you to resubmit this patch as
> separate mail, and supply more explanation.
>
> 916 rejected. As far as I can see, this isn't correct. The point here
> is not that the caller can change the values, but rther, that such
> changes will be visible to the caller of the PLT entry,
> If you think otherwise, could I ask you to resubmit this patch as
> separate mail, and supply more explanation.
>
> 917 applied
>
> 918 applied. This is a great rewording of the text, doubly so when yo=
u
> are not a native speaker.
>
> 919 rejected. Short answer is that I don't know the details here. If
> you wanted to research this and send me a patch, I'd be happy to
> receive it, but I also can understand that you may not have the time.
>
> 920 applied, with slight changes to the first block.
>
> 921 rejected. I need more info on this one. "Numerical value out of
> range" is ERANGE. I haven't tried to test this, but reading
> kernel/cpuset.c (2.6.31) there is no use of ERANGE, and it looks like
> EINVAL is being used by this case. Could I ask you to resubmit this a=
s
> a separate patch, with a shell session that fully demonstrates what
> you are seeing (please show "uname -a" and all the commands you use t=
o
> mount the cpuset file system, and also some information on your
> systems node/memory setup.)
>
> I believe I've now processed all of your patches. (Let me know if you
> think I missed one.) Please, do feel free to separately resubmit any
> patches that I rejected above, if you think I'm wrong, or can provide
> more information. (As things stand, if I hear nothing further on any
> of these, I'll forget about them...)
>
> Thanks again for the great work Nicolas. (By the way, does this mean
> that work is progressing on the French translation?)
>
> Cheers,
>
> Michael
>
> --
> Michael Kerrisk
> Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
> Watch my Linux system programming book progress to publication!
> http://blog.man7.org/
>



--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Watch my Linux system programming book progress to publication!
http://blog.man7.org/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
