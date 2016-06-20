From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: charmap.5: clarify keyword syntax
Date: Mon, 20 Jun 2016 22:34:17 +0200
Message-ID: <60df9e3e-8ea2-0c70-c00e-af07f36b0019@gmail.com>
References: <575E5EA5.6050707@redhat.com> <20160614165643.GF4053@vapier.lan>
 <57610A8D.6080105@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <57610A8D.6080105-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marko Myllynen <myllynen-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On 06/15/2016 09:58 AM, Marko Myllynen wrote:
> Hi,
> 
> On 2016-06-14 19:56, Mike Frysinger wrote:
>> On 13 Jun 2016 10:20, Marko Myllynen wrote:
>>> The patch below updates charmap.5 to match the syntax all the glibc
>>> charmap files are using currently.
>>
>> hmm, i guess this is confusing.  when i read the man page, i see it as
>> the normal syntax of "<required value>" rather than the <> being literal
>> characers that you need to type out.  although in that regard, i would
>> expect it to look something like:
>> 	<character> <byte-sequence> [comment]
>>
>> although in the locale(5) page, we rarely use the <foo> syntax.
> 
> Yes, in the locale(5) page <foo> is now used only in cases like:
> 
>   The characters <space> and <tab> are automatically included.
> 
> In the glibc charmap files the <> notation is used with keywords, the
> man pages states that comment is optional but would it make thing
> clearer if we would use something like:
> 
> .TP
> <
> .I code_set_name
>> is followed by the name of the character map.
> 
> (Ok, that renders badly but you get the idea.)

I'd take patches to fix this. 

I think you want:

.TP
.RI < code_set_name >

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
