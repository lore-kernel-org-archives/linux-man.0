From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] init_module: update to modern interfaces
Date: Fri, 12 Oct 2012 09:42:38 +0200
Message-ID: <CAKgNAkiKajiFxjfBEadXBtD67ApyGEvCa+uoWm7iFBBm0gnshA@mail.gmail.com>
References: <20120920232737.GA2953@www.outflux.net> <CAKgNAkheF8=ssrE=_JP-ApDP5zXeHSYVG+0x6Wfd6U28TcPSHQ@mail.gmail.com>
 <87wqyx7me7.fsf@rustcorp.com.au>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <87wqyx7me7.fsf-8n+1lVoiYb80n/F98K4Iww@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rusty Russell <rusty-8n+1lVoiYb80n/F98K4Iww@public.gmane.org>
Cc: Kees Cook <keescook-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Lucas De Marchi <lucas.demarchi-Y3ZbgMPKUGA34EUeqzHoZw@public.gmane.org>, Jon Masters <jonathan-Zp4isUonpHBD60Wz+7aTrA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hi Rusty,

Thanks for the review! One open question below.

On Thu, Oct 11, 2012 at 4:50 AM, Rusty Russell <rusty-8n+1lVoiYb80n/F98K4Iww@public.gmane.org> wrote:
> "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> writes:
>> [CC widened, so that some more review might come in. Rusty?]
>
> Sure.
>
> Looks good. but:
>
>> .B EBUSY
>> The module's initialization routine failed.
>
> Possibly.  You should mention that the individual module's
> initialization routine can return other errors as appropriate.

Done!

In fact, the existing EBUSY text seems completely bogus. Should it not
read something like
"Timeout while trying to resolve a symbol reference by this module."?

>> .BR EINVAL " (Linux 2.4 and earlier)"
>> Some
>> .I image
>> slot is filled in incorrectly,
>> .I image\->name
>> does not correspond to the original module name, some
>> .I image\->deps
>> entry does not correspond to a loaded module,
>> or some other similar inconsistency.
>> .TP
>
> Why document this?

Because the general approach in man-pages is to document past as well
as current behavior. Since there are few user-space customers of
init_module(), perhaps you are right that this is unnecessary. I
dropped it.

>> .B ENOEXEC
>> The ELF image in
>> .I module_image
>> is too small or has corrupted segments.
>
> Or is not an ELF image, or wrong arch...

Yes, reworded here.

[...]

> You might want to note that the 2.4 syscall can be detected by calling
> query_module(): 2.6 and above give ENOSYS.

Done.

Thanks,

Michael

-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
