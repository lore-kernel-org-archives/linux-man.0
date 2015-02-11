From: Denys Vlasenko <dvlasenk-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] access.2: explain how access() check treats capabilities
Date: Wed, 11 Feb 2015 14:34:41 +0100
Message-ID: <54DB5A71.6080606@redhat.com>
References: <1410354068-6100-1-git-send-email-dvlasenk@redhat.com> <54D3498C.7000904@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <54D3498C.7000904-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi Michael,

On 02/05/2015 11:44 AM, Michael Kerrisk (man-pages) wrote:
> On 09/10/2014 03:01 PM, Denys Vlasenko wrote:
>> We have users who are terribly confused why their binaries
>> with CAP_DAC_OVERRIDE capability see EACCESS from access() calls,
>> but are able to read the file.
>>
>> The reason is access() isn't the "can I read/write/execute this file?"
>> question, it is the "(assuming that I'm a setuid binary,) can *the user
>> who invoked me* read/write/execute this file?" question.
>>
>> That's why it uses real UIDs as documented, and why it ignores
>> capabilities when capability-endored binaries are run by non-root
>> (this patch adds this information).
>>
>> To make users more likely to notice this less-known detail,
>> the patch expands the explanation with rationale for this logic
>> into a separate paragraph.
> 
> Thanks, Denys. Applied.

I don't see it in git://git.kernel.org/pub/scm/docs/man-pages/man-pages.git

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
