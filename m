From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] getlogin.3: Reformat thread-safety information
Date: Tue, 28 Oct 2014 21:34:09 +0100
Message-ID: <544FFDC1.2040300@gmail.com>
References: <1413518358-32200-1-git-send-email-penght@cn.fujitsu.com>	<5440B1A9.8020304@gmail.com>	<5440B745.9020003@cn.fujitsu.com>	<5440BC77.3040906@gmail.com> <CAE2sS1gRBH=Xw671FRynxCYej7uhYTuJ4pxXC0+6_s78VGJayQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAE2sS1gRBH=Xw671FRynxCYej7uhYTuJ4pxXC0+6_s78VGJayQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Carlos O'Donell <carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>, "linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Alexandre Oliva <aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hi Carlos,

On 10/20/2014 05:50 PM, Carlos O'Donell wrote:
> On Fri, Oct 17, 2014 at 2:51 AM, Michael Kerrisk (man-pages)
> <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>>> getlogin() is MT-Unsafe and is influenced by setlocale(),
>>> So "MT-Unsafe locale" is right.
>>
>> Thank you for the confirmation.
>>
>> Just by the way, I see that the glibc manual says of getlogin:
>>
>>     MT-Unsafe race:getlogin race:utent sig:ALRM timer locale
>>
>> I guess this covers some cases beyond what you document. Is that
>> correct?
>
> I haven't reviewed the technical details of this issue, but I would be
> very worried if the linux-kernel man pages had different annotations

s/linux-kernel/linux/ (yes, they're housed at kernel.org, but...)

> than glibc.

Agreed. They should be consistent.
 
> My expectation is that Peng should review the glibc annotations and
> come talk to us if they are different from what will be documented in
> the man pages.
> 
> We should not have any differences. Either we adjust one or the other,
> but both should match.

Yes.

By the way, how will the glibc manual maintain this info going forward?
Alexandre did great work, but I suppose he will not want to do this 
forever! How will updates be made in the future? I ask because, of 
course, man-pages has a similar issue ;-).

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
