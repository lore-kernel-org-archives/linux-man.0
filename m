From: "Carlos O'Donell" <carlos-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: POSIX Safety
Date: Fri, 17 Oct 2014 10:40:38 -0400
Message-ID: <54412A66.8050909@redhat.com>
References: <53AD7575.9080202@redhat.com> <5440A25F.9090507@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5440A25F.9090507-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Alexandre Oliva <aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On 10/17/2014 01:00 AM, Michael Kerrisk (man-pages) wrote:
> On 06/27/2014 03:45 PM, Carlos O'Donell wrote:
>> Michael,
>>
>> I submit the following text to the Linux Kernel Man Pages project.
>> The goal being that we copy-edit this into a safety attributes
>> man page and thus harmonize the definition of thread safe,
>> async-cancel safe, and async-signal safe between glibc and the
>> linux kernel man page project.
>>
>> Please feel free to use all, some, or non of this document. It is
>> included under GPLv2+_DOC_FULL for your use in the linux kernel man
>> pages project. It is presently formatted as info, please feel free
>> to reformat. For example the HURD parts of the doucment do not apply
>> since the man pages are intended for systems using the Linux
>> kernel e.g. GNU/Linux.
>>
>> As always I look forward to continued harmonization between the
>> glibc manual and linux kernel man pages project :-)
> 
> Hi Carlos,
> 
> I started editing up some of this material for inclusion in
> a man page. As well as the Copyright, I do find it useful to
> list the authors for the text. Is that you, Alexandre, or both?

Alexandre is the author of the text.

Cheers,
Carlos.

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
