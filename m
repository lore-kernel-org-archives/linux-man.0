From: Szabolcs Nagy <szabolcs.nagy-5wv7dgnIgG8@public.gmane.org>
Subject: Re: man-pages-4.06 released
Date: Thu, 12 May 2016 10:37:54 +0100
Message-ID: <57344EF2.1080206@arm.com>
References: <f06548d5-5857-c73f-0f9a-331761cd748c@gmail.com> <20160511233214.GD22574@port70.net> <20160512001830.GR26300@vapier.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160512001830.GR26300-UgUKS2FnFs9+urZeOPWqwQ@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Szabolcs Nagy <nsz-4P1ElwuDYu6sTnJN9+BGXg@public.gmane.org>, "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, libc-alpha <libc-alpha-9JcytcrH/bA+uJoB2kUjGw@public.gmane.org>
Cc: nd-5wv7dgnIgG8@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 12/05/16 01:18, Mike Frysinger wrote:
> On 12 May 2016 01:32, Szabolcs Nagy wrote:
>> * Michael Kerrisk (man-pages) <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> [2016-05-11 08:51:14 +0200]:
>>> clone.2
>>>     Michael Kerrisk  [Colin Ian King]
>>>         ERRORS: add EINVAL for improperly aligned 'child_stack' value
>>
>> glibc is able to align the stack
>> maybe it should (e.g. musl does).
> 
> see the original thread for discussion:
> 	https://www.spinics.net/lists/linux-man/msg10237.html

glibc can provide consistent behaviour even
if the kernel does not, so kernel side does
not matter much.

i have no strong opinion here, fixing it in
the man page is ok, but i can provide an
aarch64 clone.S patch.

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
