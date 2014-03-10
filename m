From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: RFC: Bug 60749 - Do not need to link against -lm for fabs*()
Date: Mon, 10 Mar 2014 14:25:27 +0100
Message-ID: <531DBD47.6010902@gmail.com>
References: <5233415A.90506@bfs.de> <CAKgNAkiy54SbGEt6KQ2a87SQejoyuzcTvDbVK8aAQXd==yNNvg@mail.gmail.com> <5234511C.7030500@bfs.de> <52371C48.7040404@bfs.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <52371C48.7040404-fPG8STNUNVg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: wharms-fPG8STNUNVg@public.gmane.org
Cc: "linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.orglinux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Walter,

On 09/16/2013 04:57 PM, walter harms wrote:
> 
> 
> Am 14.09.2013 14:05, schrieb walter harms:
>>
>>
>> Am 13.09.2013 20:20, schrieb Michael Kerrisk (man-pages):
>>> Walter,
>>>
>>> On Fri, Sep 13, 2013 at 6:46 PM, walter harms <wharms-fPG8STNUNVg@public.gmane.org> wrote:
>>>> hi list,
>>>> i was investigating this and the good news it that you still need a libm.
>>>> On the other side the reporter is right he does not need to specify that.
>>>> Obviously this depends on the linker script used.
>>>>
>>>> The math man pages say: "Link with -lm".
>>>> Perhaps it is better to say 'You may need to Link with -lm".
>>>>
>>>> any comments on that ?
>>>
>>>
>>> Thanks for looking at this bug. Could you elaborate a little more on
>>> what it/sin't in the linker script that makes the difference?
>>>
>>
>> I have no clue what linker magic is needed.
>>
> I know what it going on. the is no linker magic required.
> The point is gcc build-ins. Some functions are replaced with
> build-ins. That happens e.g. with fabs() what the original poster noted.
> Disabling the build-ins with gcc -fno-builtin shows that the -lm is still
> a requirement.

Thanks! I hadn't thought of that. I see there is a list available in
the gcc documentation at http://gcc.gnu.org/onlinedocs/gcc/Other-Builtins.html

> next problem, who will do the bugzilla-entry ?

I will add something to https://bugzilla.kernel.org/show_bug.cgi?id=60749
Fundamentally, this is a gcc feature, and I don't think there's much that
can be sensibly said about it in man-pages.

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
