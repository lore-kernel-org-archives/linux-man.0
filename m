From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] keyctl.2: updates regarding command usage, return values
 and error codes
Date: Thu, 3 Nov 2016 14:36:41 +0100
Message-ID: <CAKgNAkhFRwfMCkZOPfxJu7SHCcYsZvd4W4E=dTvf6_RL3XJK-w@mail.gmail.com>
References: <20160926022448.GA28764@obsidian> <b293076f-797d-76df-3b76-27d67b3f128a@gmail.com>
 <alpine.OSX.2.20.1609261024180.6377@mjmartin-mac01.local>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <alpine.OSX.2.20.1609261024180.6377-zaFMaa3cLiZe6KzckbbZvYT4S9po1h25@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mat Martineau <mathew.j.martineau-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Cc: Eugene Syromyatnikov <evgsyr-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, David Howells <dhowells-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, keyrings-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Mat,

On 26 September 2016 at 20:03, Mat Martineau
<mathew.j.martineau-VuQAYsv1563Yd54FQh9/CA@public.gmane.org> wrote:
>
> Michael and Eugene -
>
> On Mon, 26 Sep 2016, Michael Kerrisk (man-pages) wrote:
>
>> [CC extended:
>> keyrings-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
>> Mat Martineau, as he added KEYCTL_DH_COMPUTE]
>>
>>
>> Hello Eugene,
>>
>> On 09/26/2016 04:24 AM, Eugene Syromyatnikov wrote:
>>>
>>> Hello.
>>>
>>> I've drafted some updates to the keyctl.2 man page while preparing test
>>> for strace syscall decoder. It is focused mostly on description of
>>> argument
>>> format used in various commands and return values/error codes.
>>> Information is based on Documentation/security/keys.txt,
>>> include/uapi/linux/keyctl.h, and source code and comments in
>>> security/keys/ (mostly comments from security/keys/keyctl.c).
>>> Hope you find it useful.
>
>
> There's additional reference material from keyctl.1 and keyctl.3 in
> https://git.kernel.org/cgit/linux/kernel/git/dhowells/keyutils.git/ .
> The 'next' branch has updates for KEYCTL_DH_COMPUTE

Thanks.

One thing that the man page and the commit message for the DH compute
feature lack is a rationale for why this operation was added.

So, why was it added? It'd be good to document that.

Cheers,

Michael
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
